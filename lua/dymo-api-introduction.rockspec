package = "voxgig-sdk-dymo-api-introduction"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/dymo-api-introduction-sdk.git"
}
description = {
  summary = "DymoApiIntroduction SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["dymo-api-introduction_sdk"] = "dymo-api-introduction_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
