<?php
declare(strict_types=1);

// DymoApiIntroduction SDK utility: result_body

class DymoApiIntroductionResultBody
{
    public static function call(DymoApiIntroductionContext $ctx): ?DymoApiIntroductionResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
