<?php
declare(strict_types=1);

// DymoApiIntroduction SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class DymoApiIntroductionFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new DymoApiIntroductionBaseFeature();
            case "test":
                return new DymoApiIntroductionTestFeature();
            default:
                return new DymoApiIntroductionBaseFeature();
        }
    }
}
