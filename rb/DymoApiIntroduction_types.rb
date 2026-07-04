# frozen_string_literal: true

# Typed models for the DymoApiIntroduction SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Security entity data model.
#
# @!attribute [rw] ai_insight
#   @return [Hash, nil]
#
# @!attribute [rw] analytics
#   @return [Hash, nil]
#
# @!attribute [rw] data
#   @return [Hash]
#
# @!attribute [rw] enable_ai
#   @return [Boolean, nil]
#
# @!attribute [rw] marketing_insight
#   @return [Hash, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] validation_result
#   @return [Hash, nil]
#
# @!attribute [rw] validation_type
#   @return [String, nil]
Security = Struct.new(
  :ai_insight,
  :analytics,
  :data,
  :enable_ai,
  :marketing_insight,
  :status,
  :timestamp,
  :validation_result,
  :validation_type,
  keyword_init: true
)

# Match filter for Security#create (any subset of Security fields).
#
# @!attribute [rw] ai_insight
#   @return [Hash, nil]
#
# @!attribute [rw] analytics
#   @return [Hash, nil]
#
# @!attribute [rw] data
#   @return [Hash, nil]
#
# @!attribute [rw] enable_ai
#   @return [Boolean, nil]
#
# @!attribute [rw] marketing_insight
#   @return [Hash, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] validation_result
#   @return [Hash, nil]
#
# @!attribute [rw] validation_type
#   @return [String, nil]
SecurityCreateData = Struct.new(
  :ai_insight,
  :analytics,
  :data,
  :enable_ai,
  :marketing_insight,
  :status,
  :timestamp,
  :validation_result,
  :validation_type,
  keyword_init: true
)

