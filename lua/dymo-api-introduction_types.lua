-- Typed models for the DymoApiIntroduction SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Security
---@field ai_insight? table
---@field analytics? table
---@field data table
---@field enable_ai? boolean
---@field marketing_insight? table
---@field status? string
---@field timestamp? string
---@field validation_result? table
---@field validation_type? string

---@class SecurityCreateData
---@field ai_insight? table
---@field analytics? table
---@field data table
---@field enable_ai? boolean
---@field marketing_insight? table
---@field status? string
---@field timestamp? string
---@field validation_result? table
---@field validation_type? string

local M = {}

return M
