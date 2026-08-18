-- DymoApiIntroduction SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "DymoApiIntroduction",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.dymo.com/v1",
      auth = {
        prefix = "",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["security"] = {},
      },
    },
    entity = {
      ["security"] = {
        ["fields"] = {
          {
            ["name"] = "aiInsights",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "analytics",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "data",
            ["req"] = true,
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "enableAI",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "marketingInsights",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "status",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "timestamp",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "validationResults",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "validationType",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "security",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/validate",
                ["parts"] = {
                  "validate",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
