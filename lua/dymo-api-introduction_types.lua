-- Typed models for the DymoApiIntroduction SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Security
---@field aiInsights? table
---@field analytics? table
---@field data table
---@field enableAI? boolean
---@field marketingInsights? table
---@field status? string
---@field timestamp? string
---@field validationResults? table
---@field validationType? string

---@class SecurityCreateData
---@field aiInsights? table
---@field analytics? table
---@field data table
---@field enableAI? boolean
---@field marketingInsights? table
---@field status? string
---@field timestamp? string
---@field validationResults? table
---@field validationType? string

local M = {}

return M
