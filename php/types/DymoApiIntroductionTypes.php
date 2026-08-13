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
    public ?array $aiInsights = null;
    public ?array $analytics = null;
    public array $data;
    public ?bool $enableAI = null;
    public ?array $marketingInsights = null;
    public ?string $status = null;
    public ?string $timestamp = null;
    public ?array $validationResults = null;
    public ?string $validationType = null;
}

/** Request payload for Security#create. */
class SecurityCreateData
{
    public ?array $aiInsights = null;
    public ?array $analytics = null;
    public array $data;
    public ?bool $enableAI = null;
    public ?array $marketingInsights = null;
    public ?string $status = null;
    public ?string $timestamp = null;
    public ?array $validationResults = null;
    public ?string $validationType = null;
}

