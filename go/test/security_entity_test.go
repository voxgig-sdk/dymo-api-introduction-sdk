package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/dymo-api-introduction-sdk/go"
	"github.com/voxgig-sdk/dymo-api-introduction-sdk/go/core"

	vs "github.com/voxgig-sdk/dymo-api-introduction-sdk/go/utility/struct"
)

func TestSecurityEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Security(nil)
		if ent == nil {
			t.Fatal("expected non-nil SecurityEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := securityBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "security." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		securityRef01Ent := client.Security(nil)
		securityRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "security"}, setup.data), "security_ref01"))

		securityRef01DataResult, err := securityRef01Ent.Create(securityRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		securityRef01Data = core.ToMapAny(entityData(securityRef01DataResult))
		if securityRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func securityBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "security", "SecurityTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read security test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse security test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"security01", "security02", "security03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID": idmap,
		"DYMO_API_INTRODUCTION_TEST_LIVE":      "FALSE",
		"DYMO_API_INTRODUCTION_TEST_EXPLAIN":   "FALSE",
		"DYMO_API_INTRODUCTION_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["DYMO_API_INTRODUCTION_TEST_SECURITY_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["DYMO_API_INTRODUCTION_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["DYMO_API_INTRODUCTION_APIKEY"],
			},
			extra,
		})
		client = sdk.NewDymoApiIntroductionSDK(core.ToMapAny(mergedOpts))
	}

	live := env["DYMO_API_INTRODUCTION_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["DYMO_API_INTRODUCTION_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
