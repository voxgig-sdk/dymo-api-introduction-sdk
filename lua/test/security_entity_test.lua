-- Security entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("dymo-api-introduction_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

describe("SecurityEntity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:Security(nil)
    assert.is_not_nil(ent)
  end)

  it("should run basic flow", function()
    local setup = security_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"create"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "security." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    -- The basic flow consumes synthetic IDs from the fixture. In live mode
    -- without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only then
      pending("live entity test uses synthetic IDs from fixture — set DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID JSON to run live")
      return
    end
    local client = setup.client

    -- CREATE
    local security_ref01_ent = client:Security(nil)
    local security_ref01_data = helpers.to_map(vs.getprop(
      vs.getpath(setup.data, "new.security"), "security_ref01"))

    local security_ref01_data_result, err = security_ref01_ent:create(security_ref01_data, nil)
    assert.is_nil(err)
    security_ref01_data = helpers.to_map(type(security_ref01_data_result) == 'table' and security_ref01_data_result.data_get and security_ref01_data_result:data_get() or security_ref01_data_result)
    assert.is_not_nil(security_ref01_data)

  end)
end)

function security_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/security/SecurityTestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read security test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "security01", "security02", "security03" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Detect ENTID env override before envOverride consumes it. When live
  -- mode is on without a real override, the basic test runs against synthetic
  -- IDs from the fixture and 4xx's. Surface this so the test can skip.
  local entid_env_raw = os.getenv("DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID"] = idmap,
    ["DYMO_API_INTRODUCTION_TEST_LIVE"] = "FALSE",
    ["DYMO_API_INTRODUCTION_TEST_EXPLAIN"] = "FALSE",
    ["DYMO_API_INTRODUCTION_APIKEY"] = "NONE",
  })

  local idmap_resolved = helpers.to_map(
    env["DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["DYMO_API_INTRODUCTION_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      {
        apikey = env["DYMO_API_INTRODUCTION_APIKEY"],
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["DYMO_API_INTRODUCTION_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["DYMO_API_INTRODUCTION_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
