# DymoApiIntroduction PHP SDK Reference

Complete API reference for the DymoApiIntroduction PHP SDK.


## DymoApiIntroductionSDK

### Constructor

```php
require_once __DIR__ . '/dymo-api-introduction_sdk.php';

$client = new DymoApiIntroductionSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `DymoApiIntroductionSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = DymoApiIntroductionSDK::test();
```


### Instance Methods

#### `Security($data = null)`

Create a new `SecurityEntity` instance. Pass `null` for no initial data.

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. Returns `[$result, $err]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array [$result, $err]`

#### `prepare(array $fetchargs = []): array`

Prepare a fetch definition without sending the request. Returns `[$fetchdef, $err]`.


---

## SecurityEntity

```php
$security = $client->Security();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ai_insight` | ``$OBJECT`` | No |  |
| `analytics` | ``$OBJECT`` | No |  |
| `data` | ``$OBJECT`` | Yes |  |
| `enable_ai` | ``$BOOLEAN`` | No |  |
| `marketing_insight` | ``$OBJECT`` | No |  |
| `status` | ``$STRING`` | No |  |
| `timestamp` | ``$STRING`` | No |  |
| `validation_result` | ``$OBJECT`` | No |  |
| `validation_type` | ``$STRING`` | No |  |

### Operations

#### `create(array $reqdata, ?array $ctrl = null): array`

Create a new entity with the given data.

```php
[$result, $err] = $client->Security()->create([
  "data" => /* `$OBJECT` */,
]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SecurityEntity`

Create a new `SecurityEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new DymoApiIntroductionSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

