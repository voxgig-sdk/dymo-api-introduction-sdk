<?php
declare(strict_types=1);

// DymoApiIntroduction SDK exists test

require_once __DIR__ . '/../dymoapiintroduction_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = DymoApiIntroductionSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
