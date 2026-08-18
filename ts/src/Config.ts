
import { BaseFeature } from './feature/base/BaseFeature'
import { TestFeature } from './feature/test/TestFeature'



const FEATURE_CLASS: Record<string, typeof BaseFeature> = {
   test: TestFeature,

}


class Config {

  makeFeature(this: any, fn: string) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'DymoApiIntroduction',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: "https://api.dymo.com/v1",

    auth: {
      prefix: '',
    },

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
          "name": "aiInsights",
          "type": "`$OBJECT`"
        },
        {
          "name": "analytics",
          "type": "`$OBJECT`"
        },
        {
          "name": "data",
          "req": true,
          "type": "`$OBJECT`"
        },
        {
          "name": "enableAI",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "marketingInsights",
          "type": "`$OBJECT`"
        },
        {
          "name": "status",
          "type": "`$STRING`"
        },
        {
          "name": "timestamp",
          "type": "`$STRING`"
        },
        {
          "name": "validationResults",
          "type": "`$OBJECT`"
        },
        {
          "name": "validationType",
          "type": "`$STRING`"
        }
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
                "validate"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
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

