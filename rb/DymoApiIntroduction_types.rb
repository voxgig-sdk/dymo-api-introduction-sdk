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
# @!attribute [rw] aiInsights
#   @return [Hash, nil]
#
# @!attribute [rw] analytics
#   @return [Hash, nil]
#
# @!attribute [rw] data
#   @return [Hash]
#
# @!attribute [rw] enableAI
#   @return [Boolean, nil]
#
# @!attribute [rw] marketingInsights
#   @return [Hash, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] validationResults
#   @return [Hash, nil]
#
# @!attribute [rw] validationType
#   @return [String, nil]
Security = Struct.new(
  :aiInsights,
  :analytics,
  :data,
  :enableAI,
  :marketingInsights,
  :status,
  :timestamp,
  :validationResults,
  :validationType,
  keyword_init: true
)

# Request payload for Security#create.
#
# @!attribute [rw] aiInsights
#   @return [Hash, nil]
#
# @!attribute [rw] analytics
#   @return [Hash, nil]
#
# @!attribute [rw] data
#   @return [Hash]
#
# @!attribute [rw] enableAI
#   @return [Boolean, nil]
#
# @!attribute [rw] marketingInsights
#   @return [Hash, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] timestamp
#   @return [String, nil]
#
# @!attribute [rw] validationResults
#   @return [Hash, nil]
#
# @!attribute [rw] validationType
#   @return [String, nil]
SecurityCreateData = Struct.new(
  :aiInsights,
  :analytics,
  :data,
  :enableAI,
  :marketingInsights,
  :status,
  :timestamp,
  :validationResults,
  :validationType,
  keyword_init: true
)

