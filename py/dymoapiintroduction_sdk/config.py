# DymoApiIntroduction SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "DymoApiIntroduction",
            "slug": "dymo-api-introduction",
            "version": "0.0.1",
            "target": "py",
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
            "auth": {
                "prefix": "",
            },
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
            "name": "aiInsights",
            "short": "AI-powered insights and recommendations",
            "type": "`$OBJECT`",
          },
          {
            "name": "analytics",
            "short": "Analytics data and customer behavior insights",
            "type": "`$OBJECT`",
          },
          {
            "name": "data",
            "req": True,
            "short": "The data to be validated",
            "type": "`$OBJECT`",
          },
          {
            "name": "enableAI",
            "short": "Enable AI-powered analysis",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "marketingInsights",
            "short": "Marketing-related insights",
            "type": "`$OBJECT`",
          },
          {
            "name": "status",
            "short": "Validation status",
            "type": "`$STRING`",
          },
          {
            "name": "timestamp",
            "short": "Timestamp of the validation",
            "type": "`$STRING`",
          },
          {
            "name": "validationResults",
            "type": "`$OBJECT`",
          },
          {
            "name": "validationType",
            "short": "Type of validation to perform",
            "type": "`$STRING`",
          },
        ],
        "name": "security",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "args": {},
                "kind": "http",
                "method": "POST",
                "orig": "/validate",
                "parts": [
                  "validate",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
