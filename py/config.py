# DymoApiIntroduction SDK configuration


def make_config():
    return {
        "main": {
            "name": "DymoApiIntroduction",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.dymo.com/v1",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "security": {},
            },
        },
        "entity": {
      "security": {
        "fields": [
          {
            "name": "ai_insight",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "analytics",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "data",
            "req": True,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "enable_ai",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "marketing_insight",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "status",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "timestamp",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 6,
          },
          {
            "name": "validation_result",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 7,
          },
          {
            "name": "validation_type",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 8,
          },
        ],
        "name": "security",
        "op": {
          "create": {
            "name": "create",
            "points": [
              {
                "method": "POST",
                "orig": "/validate",
                "parts": [
                  "validate",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "create",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
