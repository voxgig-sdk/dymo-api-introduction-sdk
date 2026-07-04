<?php
declare(strict_types=1);

// Typed models for the DymoApiIntroduction SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Security entity data model. */
class Security
{
    public ?array $ai_insight = null;
    public ?array $analytics = null;
    public array $data;
    public ?bool $enable_ai = null;
    public ?array $marketing_insight = null;
    public ?string $status = null;
    public ?string $timestamp = null;
    public ?array $validation_result = null;
    public ?string $validation_type = null;
}

/** Match filter for Security#create (any subset of Security fields). */
class SecurityCreateData
{
    public ?array $ai_insight = null;
    public ?array $analytics = null;
    public ?array $data = null;
    public ?bool $enable_ai = null;
    public ?array $marketing_insight = null;
    public ?string $status = null;
    public ?string $timestamp = null;
    public ?array $validation_result = null;
    public ?string $validation_type = null;
}

