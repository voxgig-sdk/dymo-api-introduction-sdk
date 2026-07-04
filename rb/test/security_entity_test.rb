# Security entity test

require "minitest/autorun"
require "json"
require_relative "../DymoApiIntroduction_sdk"
require_relative "runner"

class SecurityEntityTest < Minitest::Test
  def test_create_instance
    testsdk = DymoApiIntroductionSDK.test(nil, nil)
    ent = testsdk.Security(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = security_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "security." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set DYMOAPIINTRODUCTION_TEST_SECURITY_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    security_ref01_ent = client.Security(nil)
    security_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.security"), "security_ref01"))

    security_ref01_data_result = security_ref01_ent.create(security_ref01_data, nil)
    security_ref01_data = Helpers.to_map(security_ref01_data_result)
    assert !security_ref01_data.nil?

  end
end

def security_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "security", "SecurityTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = DymoApiIntroductionSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["security01", "security02", "security03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["DYMOAPIINTRODUCTION_TEST_SECURITY_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "DYMOAPIINTRODUCTION_TEST_SECURITY_ENTID" => idmap,
    "DYMOAPIINTRODUCTION_TEST_LIVE" => "FALSE",
    "DYMOAPIINTRODUCTION_TEST_EXPLAIN" => "FALSE",
    "DYMOAPIINTRODUCTION_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["DYMOAPIINTRODUCTION_TEST_SECURITY_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["DYMOAPIINTRODUCTION_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["DYMOAPIINTRODUCTION_APIKEY"],
      },
      extra || {},
    ])
    client = DymoApiIntroductionSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["DYMOAPIINTRODUCTION_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["DYMOAPIINTRODUCTION_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
