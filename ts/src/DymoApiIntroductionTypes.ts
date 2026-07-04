// Typed models for the DymoApiIntroduction SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Security {
  ai_insight?: Record<string, any>
  analytics?: Record<string, any>
  data: Record<string, any>
  enable_ai?: boolean
  marketing_insight?: Record<string, any>
  status?: string
  timestamp?: string
  validation_result?: Record<string, any>
  validation_type?: string
}

export type SecurityCreateData = Partial<Security>

