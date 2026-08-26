-- DymoApiIntroduction SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "DymoApiIntroduction",
      slug = "dymo-api-introduction",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["transport"] = "base",
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
            ["short"] = "AI-powered insights and recommendations",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "analytics",
            ["short"] = "Analytics data and customer behavior insights",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "data",
            ["req"] = true,
            ["short"] = "The data to be validated",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "enableAI",
            ["short"] = "Enable AI-powered analysis",
            ["type"] = "`$BOOLEAN`",
          },
          {
            ["name"] = "marketingInsights",
            ["short"] = "Marketing-related insights",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "status",
            ["short"] = "Validation status",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "timestamp",
            ["short"] = "Timestamp of the validation",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "validationResults",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "validationType",
            ["short"] = "Type of validation to perform",
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
