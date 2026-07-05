# Typed models for the DymoApiIntroduction SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class SecurityRequired(TypedDict):
    data: dict


class Security(SecurityRequired, total=False):
    ai_insight: dict
    analytics: dict
    enable_ai: bool
    marketing_insight: dict
    status: str
    timestamp: str
    validation_result: dict
    validation_type: str


class SecurityCreateDataRequired(TypedDict):
    data: dict


class SecurityCreateData(SecurityCreateDataRequired, total=False):
    ai_insight: dict
    analytics: dict
    enable_ai: bool
    marketing_insight: dict
    status: str
    timestamp: str
    validation_result: dict
    validation_type: str
