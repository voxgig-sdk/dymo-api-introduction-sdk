package voxgigdymoapiintroductionsdk

import (
	"github.com/voxgig-sdk/dymo-api-introduction-sdk/go/core"
	"github.com/voxgig-sdk/dymo-api-introduction-sdk/go/entity"
	"github.com/voxgig-sdk/dymo-api-introduction-sdk/go/feature"
	_ "github.com/voxgig-sdk/dymo-api-introduction-sdk/go/utility"
)

// Type aliases preserve external API.
type DymoApiIntroductionSDK = core.DymoApiIntroductionSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type DymoApiIntroductionEntity = core.DymoApiIntroductionEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type DymoApiIntroductionError = core.DymoApiIntroductionError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewSecurityEntityFunc = func(client *core.DymoApiIntroductionSDK, entopts map[string]any) core.DymoApiIntroductionEntity {
		return entity.NewSecurityEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewDymoApiIntroductionSDK = core.NewDymoApiIntroductionSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
