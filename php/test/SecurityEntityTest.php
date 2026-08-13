<?php
declare(strict_types=1);

// Security entity test

require_once __DIR__ . '/../dymoapiintroduction_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class SecurityEntityTest extends TestCase
{
    public function test_create_instance(): void
    {
        $testsdk = DymoApiIntroductionSDK::test(null, null);
        $ent = $testsdk->Security(null);
        $this->assertNotNull($ent);
    }

    public function test_basic_flow(): void
    {
        $setup = security_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "security." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live mode
        // without an *_ENTID env override, those IDs hit the live API and 4xx.
        if (!empty($setup["synthetic_only"])) {
            $this->markTestSkipped("live entity test uses synthetic IDs from fixture — set DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID JSON to run live");
            return;
        }
        $client = $setup["client"];

        // CREATE
        $security_ref01_ent = $client->Security(null);
        $security_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.security"), "security_ref01"));

        $security_ref01_data_result = $security_ref01_ent->create($security_ref01_data, null);
        $security_ref01_data = Helpers::to_map(is_object($security_ref01_data_result) && method_exists($security_ref01_data_result, 'data_get') ? $security_ref01_data_result->data_get() : $security_ref01_data_result);
        $this->assertNotNull($security_ref01_data);

    }
}

function security_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/security/SecurityTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = DymoApiIntroductionSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["security01", "security02", "security03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against synthetic
    // IDs from the fixture and 4xx's. Surface this so the test can skip.
    $entid_env_raw = getenv("DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID" => $idmap,
        "DYMO_API_INTRODUCTION_TEST_LIVE" => "FALSE",
        "DYMO_API_INTRODUCTION_TEST_EXPLAIN" => "FALSE",
        "DYMO_API_INTRODUCTION_APIKEY" => "NONE",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["DYMO_API_INTRODUCTION_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            [
                "apikey" => $env["DYMO_API_INTRODUCTION_APIKEY"],
            ],
            $extra ?? [],
        ]);
        $client = new DymoApiIntroductionSDK(Helpers::to_map($merged_opts));
    }

    $live = $env["DYMO_API_INTRODUCTION_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["DYMO_API_INTRODUCTION_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
