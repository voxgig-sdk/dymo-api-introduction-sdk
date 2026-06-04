
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    }

  }


  options = {
    base: 'https://api.dymo.com/v1',

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      security: {
      },

    }
  }


  entity = {
    "security": {
      "fields": [
        {
          "name": "ai_insight",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 0
        },
        {
          "name": "analytics",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 1
        },
        {
          "name": "data",
          "req": true,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 2
        },
        {
          "name": "enable_ai",
          "req": false,
          "type": "`$BOOLEAN`",
          "active": true,
          "index$": 3
        },
        {
          "name": "marketing_insight",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 4
        },
        {
          "name": "status",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 5
        },
        {
          "name": "timestamp",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 6
        },
        {
          "name": "validation_result",
          "req": false,
          "type": "`$OBJECT`",
          "active": true,
          "index$": 7
        },
        {
          "name": "validation_type",
          "req": false,
          "type": "`$STRING`",
          "active": true,
          "index$": 8
        }
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
                "validate"
              ],
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              },
              "active": true,
              "args": {},
              "select": {},
              "index$": 0
            }
          ],
          "input": "data",
          "key$": "create"
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

export {
  config
}

