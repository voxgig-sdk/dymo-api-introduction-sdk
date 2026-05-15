package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewSecurityEntityFunc func(client *DymoApiIntroductionSDK, entopts map[string]any) DymoApiIntroductionEntity

