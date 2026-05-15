<?php
declare(strict_types=1);

// DymoApiIntroduction SDK utility: prepare_body

class DymoApiIntroductionPrepareBody
{
    public static function call(DymoApiIntroductionContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
