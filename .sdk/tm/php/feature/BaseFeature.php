<?php
declare(strict_types=1);

// DymoApiIntroduction SDK base feature

class DymoApiIntroductionBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(DymoApiIntroductionContext $ctx, array $options): void {}
    public function PostConstruct(DymoApiIntroductionContext $ctx): void {}
    public function PostConstructEntity(DymoApiIntroductionContext $ctx): void {}
    public function SetData(DymoApiIntroductionContext $ctx): void {}
    public function GetData(DymoApiIntroductionContext $ctx): void {}
    public function GetMatch(DymoApiIntroductionContext $ctx): void {}
    public function SetMatch(DymoApiIntroductionContext $ctx): void {}
    public function PrePoint(DymoApiIntroductionContext $ctx): void {}
    public function PreSpec(DymoApiIntroductionContext $ctx): void {}
    public function PreRequest(DymoApiIntroductionContext $ctx): void {}
    public function PreResponse(DymoApiIntroductionContext $ctx): void {}
    public function PreResult(DymoApiIntroductionContext $ctx): void {}
    public function PreDone(DymoApiIntroductionContext $ctx): void {}
    public function PreUnexpected(DymoApiIntroductionContext $ctx): void {}
}
