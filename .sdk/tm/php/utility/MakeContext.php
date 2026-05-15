<?php
declare(strict_types=1);

// DymoApiIntroduction SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class DymoApiIntroductionMakeContext
{
    public static function call(array $ctxmap, ?DymoApiIntroductionContext $basectx): DymoApiIntroductionContext
    {
        return new DymoApiIntroductionContext($ctxmap, $basectx);
    }
}
