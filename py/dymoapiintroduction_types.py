# Typed models for the DymoApiIntroduction SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Security:
    data: dict
    ai_insight: Optional[dict] = None
    analytics: Optional[dict] = None
    enable_ai: Optional[bool] = None
    marketing_insight: Optional[dict] = None
    status: Optional[str] = None
    timestamp: Optional[str] = None
    validation_result: Optional[dict] = None
    validation_type: Optional[str] = None


@dataclass
class SecurityCreateData:
    ai_insight: Optional[dict] = None
    analytics: Optional[dict] = None
    data: Optional[dict] = None
    enable_ai: Optional[bool] = None
    marketing_insight: Optional[dict] = None
    status: Optional[str] = None
    timestamp: Optional[str] = None
    validation_result: Optional[dict] = None
    validation_type: Optional[str] = None

