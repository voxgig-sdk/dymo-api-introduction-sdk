// Typed models for the DymoApiIntroduction SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Security {
  aiInsights?: Record<string, any>
  analytics?: Record<string, any>
  data: Record<string, any>
  enableAI?: boolean
  marketingInsights?: Record<string, any>
  status?: string
  timestamp?: string
  validationResults?: Record<string, any>
  validationType?: string
}

export interface SecurityCreateData {
  aiInsights?: Record<string, any>
  analytics?: Record<string, any>
  data: Record<string, any>
  enableAI?: boolean
  marketingInsights?: Record<string, any>
  status?: string
  timestamp?: string
  validationResults?: Record<string, any>
  validationType?: string
}

