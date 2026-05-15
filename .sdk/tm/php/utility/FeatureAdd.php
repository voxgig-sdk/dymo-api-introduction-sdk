<?php
declare(strict_types=1);

// DymoApiIntroduction SDK utility: feature_add

class DymoApiIntroductionFeatureAdd
{
    public static function call(DymoApiIntroductionContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
