package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "DymoApiIntroduction",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://api.dymo.com/v1",
			"auth": map[string]any{
				"prefix": "Bearer",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"security": map[string]any{},
			},
		},
		"entity": map[string]any{
			"security": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "ai_insight",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "analytics",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "data",
						"req": true,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "enable_ai",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "marketing_insight",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "status",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "timestamp",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "validation_result",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "validation_type",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 8,
					},
				},
				"name": "security",
				"op": map[string]any{
					"create": map[string]any{
						"name": "create",
						"points": []any{
							map[string]any{
								"method": "POST",
								"orig": "/validate",
								"parts": []any{
									"validate",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "create",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
