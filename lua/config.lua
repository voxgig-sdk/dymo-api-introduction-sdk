-- DymoApiIntroduction SDK configuration

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
            ["active"] = true,
            ["name"] = "aiInsights",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "analytics",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "data",
            ["req"] = true,
            ["type"] = "`$OBJECT`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "enableAI",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "marketingInsights",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "status",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "timestamp",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "validationResults",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 7,
          },
          {
            ["active"] = true,
            ["name"] = "validationType",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 8,
          },
        },
        ["name"] = "security",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["active"] = true,
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
                ["index$"] = 0,
              },
            },
            ["key$"] = "create",
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
