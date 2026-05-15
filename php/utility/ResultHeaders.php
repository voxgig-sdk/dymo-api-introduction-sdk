<?php
declare(strict_types=1);

// DymoApiIntroduction SDK utility: result_headers

class DymoApiIntroductionResultHeaders
{
    public static function call(DymoApiIntroductionContext $ctx): ?DymoApiIntroductionResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
