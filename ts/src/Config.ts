
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

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(this: any, fn: string) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'DymoApiIntroduction',
        slug: "dymo-api-introduction",
    version: "0.0.1",
    target: "ts",

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
          "short": "AI-powered insights and recommendations",
          "type": "`$OBJECT`"
        },
        {
          "name": "analytics",
          "short": "Analytics data and customer behavior insights",
          "type": "`$OBJECT`"
        },
        {
          "name": "data",
          "req": true,
          "short": "The data to be validated",
          "type": "`$OBJECT`"
        },
        {
          "name": "enableAI",
          "short": "Enable AI-powered analysis",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "marketingInsights",
          "short": "Marketing-related insights",
          "type": "`$OBJECT`"
        },
        {
          "name": "status",
          "short": "Validation status",
          "type": "`$STRING`"
        },
        {
          "name": "timestamp",
          "short": "Timestamp of the validation",
          "type": "`$STRING`"
        },
        {
          "name": "validationResults",
          "type": "`$OBJECT`"
        },
        {
          "name": "validationType",
          "short": "Type of validation to perform",
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

