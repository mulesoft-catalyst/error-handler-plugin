# API Error Handler

This error handler module processes any errors thrown in a flow and transforms to the correct JSON response body and HTTP status code for an API.

All APIKit and HTTP exceptions are handled by the module and can be customized in the *Common Errors* tab.  Additional error definitions can be added via a dataweave file defined in the *Custom Errors* section.

The error is converted by this module into the items below.

- **HTTP status code**: *Status code* from the [HTTP RFC 7231 Response Status Codes][http-rfc-7231-6] for [Client Error 4xx][http-rfc-7231-6.5] and [Server Error 5xx][http-rfc-7231-6.6].
- **JSON response body**
  - **Error status**:  *Status code*; see above.
  - **Error reason**:  *Reason phrase* from the [HTTP RFC 7231 Response Status Codes][http-rfc-7231-6] for [Client Error 4xx][http-rfc-7231-6.5] and [Server Error 5xx][http-rfc-7231-6.6].
  - **Error message**: This can be any text description or even an object.  It is usually the Mule `error.description` or developer-defined DataWeave or text.

A JSON body response example is shown below.

**StatusCode: 400**
```
{
  "error": {
	  "status": 400,
      "reason": "Bad Request",
      "message": "Error validating response"
  }
}
```

The error object is defined on the *Advanced* tab.  It takes the standard [Mule Error][mule-error] by default, which is the recommended setting.  You can change this as long as the provided object has the same fields as the [Mule Error][mule-error].

This is compatible with Mule 4.x.x runtimes.

This module is derived from the [Error Plugin for Mule][handler-plugin].  They offer a similar feature-set.  However, this version focuses on flexibility for custom scripting on each error type and removing custom error definitions from the UI.

## Features
- Converts all errors into proper API JSON request body and HTTP status code.
- Customize error descriptions for common API errors for HTTP & APIKIT.
- Customize error description for the default error when no errors matched: 500 - Internal Server Error.
- Provide custom error mappings with a dataweave file.
- Un-clutter exceptions both in UI and XML
- Compatible with `on-error-propagate` and  `on-error-continue` error handlers.
- No specific error type is required for this module. It can parse any error types.
- Can provide strings, arrays, or objects in the `message` response field.

# Installation

This is a custom Mule module that is installed like any other connector, it is installed by adding the dependency to the pom or from "Search Exchange" button in Studio. Once installed, it will show up in the Anypoint Studio palette.

# Usage

## Maven Dependency

Use the dependency below to include the API Error Handler in an application's maven build.  
The groupId value must be the appropriate Anypoint Org Id where the module is deployed.

```
<dependency>
    <groupId>${anypoint-org-id}</groupId>
    <artifactId>common-error-handler</artifactId>
    <version>${error-handler.module.version}</version>
</dependency>
```

## App Preparation

- Delete the auto-generated error blocks (`on-error-propagate`/`on-error-continue`) before using this module.
- Place the module inside an error block: `on-error-propagate`.  You usually would not use `on-error-continue` since the error handler module generates the API's error response to the caller.
- Set the outbound HTTP Status variable, `vars.httpStatus` when using APIKit, from the HTTP status attribute set by the module: `attributes.httpStatus`.  This is how the status code is sent to the caller.
- Update HTTP Listener's response values to properly use the generated body and HTTP status from the module.  See below.

**Update HTTP Listener Response**

Add `vars.httpStatus` to the listener's `http:response` and `http:error-response` elements. Also make sure that both `http:response` and `http:error-response` elements have the `payload` as their body.

```
	<http:response 
		statusCode="#[vars.httpStatus default 200]">
	</http:response>
```

```
	<http:error-response 
		statusCode="#[vars.httpStatus default 500]">
		<http:body ><![CDATA[#[payload]]]></http:body>
	</http:error-response>
```

## Error Handler Flow

Drag from palette into error handler to transform error into API response.
**Process Error** is the supported operation.  This transforms the error to the proper JSON response body and HTTP status code.

**Module XML**

```
<common-error-handler:process-error doc:name="Process Error"
	customErrorDefinition="errors/customErrors.dwl" />
```

**Error Handler Flow**

```
<error-handler name="error-handler-api">
	<on-error-propagate
		enableNotifications="true"
		logException="true"
		doc:name="On Error Propagate">
		<common-error-handler:on-error
			doc:name="Process Error"
			customErrorDefinition="errors/customErrors.dwl" />
		<json-logger:logger
			doc:name="Log Error"
			priority="ERROR"
			tracePoint="ERROR"
			message='#[write(payload ++ { httpStatus: attributes.httpStatus }, "application/json")]'
			config-ref="json-logger-config">
			<json-logger:content ><![CDATA[#[output application/json --- error]]]></json-logger:content>
		</json-logger:logger>
		<set-variable
			value="#[attributes.httpStatus]"
			doc:name="Set HTTP Status Code"
			variableName="httpStatus" />
	</on-error-propagate>
</error-handler>
```

# Configuration

## Common Errors Tab
**APIKit & HTTP Error Details Customization**

Modify the error details for the APIKit and HTTP errors on the *Common Errors* tab.  This field supports dataweave for dynamically generated details.
The response status code and error message (phrase) *cannot* be changed for common errors on this tab.
Additional errors not covered here can be mapped to the same status codes on the *Custom Errors* tab.

## Custom Errors Tab
**File for Custom Error Definitions**

You can add any number of custom error definitions for the module to include in the mapping.  This is done by defining these custom error mappings in a [DataWeave file][dataweave-file].

This file should be in or below `src/main/resources` folder in the Mule app.  Recommended practice is to put it in an *errors* folder: `src/main/resources/errors`.

When adding the file name to the *Custom Error Definitions File* field in the module, make sure to include the full relative path from the resources folder.
Example: if the custom errors file is `src/main/resources/errors/customErrors.dwl` then this field should be `errors/customErrors.dwl`.

**All custom errors must be in a single file; multiple files are not supported**

The custom errors must be an *object of objects* with the fields below.

- Key: [Mule error type][mule-error-types] used to match.  Example: `HTTP:BAD_REQUEST`
- Value: (object)
	- `status`: HTTP status code to send in response.
	- `reason`: Error reason phrase to send in JSON body response.
	- `message`: Error details to send in JSON body response.

DataWeave script is allowed in each field value.  Unlike the DataWeave in the module's fields, the DataWeave script in the custom errors file is executed *inside the context* of the error handler module.  This means it can **only** access content provided via the module's fields, which are accessed via the `vars` object.  To access the error object from this file, you would need to use `vars.error` instead of simply `error`. 

**Custom errors override common errors.**  If you want to override a common error's status or message, and not just the details, you would add an entry for that error in the custom errors file, which will completely override the common error.

A template custom error file is shown below.  Two custom errors, `APP:...`, and one common error override, `HTTP:...`, are shown.

```
%dw 2.0
output application/java

// Map error parameter in module to local variable to match normal error selector syntax like 'error.description'.
var error = vars.error
// Nested error pulled off the Mule error object, which conforms to the API Error Handler responses.
var previousError = error.exception.errorMessage.typedValue.error.details
---
{
	/*
	APP 401 Unauthorized
	This catches custom service unauthorized error from app and formats the response accordingly.
	*/
	"APP:UNAUTHORIZED": {
		"status":401,
		"reason": "Unauthorized",
		"message": error.description default "There was an issue with authorization."
	},
	
	/*
	APP 503 Service Unavailable
	This catches custom service unavailable error from app and formats the response accordingly.
	*/
	"APP:SERVICE_UNAVAILABLE": {
		"status":503,
		"reason": "Service Unavailable",
		"message": error.description default "There was an issue connecting to the system."
	},

	/*
	HTTP 500 Pass Through
	This catches HTTP 500 errors and propagates the detailed reason for failure.
	It uses the error.details field from the response of the HTTP call that failed, which conforms to the API Error Handler responses.
	If not found, the error.description will be returned, which generally says an internal server error occurred.
	This useful for process or experience APIs to pass through system API errors.
	*/
	"HTTP:INTERNAL_SERVER_ERROR": {
		"status":500,
		"reason": "Internal Server Error",
		"message": (if (!isEmpty(previousError)) previousError else error.description) default "Internal Server Error."
	}
}
```

As mentioned, the error object is only available within the module as `vars.error`.  You can add a dataweave variable to match the normal [error selector syntax][mule-error] as shown in the above example.

## Accessing Nested Errors
Sometimes connectors generate error responses that are generic and wrap the actual error response from the external system.  In this case, the external system's response is lost and not propagated back to the API's caller.  This happens in certain scenarios with the HTTP and Web Service Consumer connectors.

A common scenario is when a system API generates an error that needs to get propagated back to the caller of the experience or process API.  Using normal error handling, like `error.description`, the SOAP fault or 500 response from the called system is not logged or propagated.  These items are usually nested in the error object here: `error.exception.errorMessage.typedValue`. A developer would add that as script to the standard or custom errors in the error handler module to propagate that error as this API's error.

All Mule API's should have the same error response body format.  It is best practice to propagate 500 error details from Mule APIs up the API network, unless you have specific requirement not to do that.  The example DataWeave snippet below shows how to access a called Mule API's error details for propagating, assuming that those details are in `error.details` in the response body, which conforms to the API Error Handler responses.  It falls back to the standard error description and then a default error message in properties if any items are not available.

```
(error.exception.errorMessage.typedValue.error.details default error.description) default p("property.with.default.error.message")
```

## List of Errors
The `message` field in the response body can be of any type.  A string is recommended, but this can also be an array of errors if needed to show history of errors across APIs.  To create an array of errors, follow the steps below.

- Create the list of errors with DataWeave in the `message` field contained in the *Custom Error* file described in a previous section.
- Log the error in your flow while handling the array so it logs appropriately.

# Building
When building this module, the required dependencies are provided by the standard MuleSoft maven repositories. Standard maven build commands work without any additional parameters required.  This is a [Mule XML SDK][xml-sdk] module.  Use `build.sh` as described under **Deploying** below to build the module.

# Deploying

The `build.sh` script executes maven commands on the module, including deploying to Exchange.  For deploying to Anypoint Exchange or other binary repositorities, server credentials must be in your maven settings.xml file, and repository and server properly linked in pom.xml.

It takes the parameters below.

	1. Anypoint Org Id: the Anypoint business organization where to deploy the module.
	2. Build option: the type of build to execute: `local`, `deploy`.
		- `local`: builds locally (installs dependencies and module in local maven repository)
		- `deploy`: deploys module to Exchange
	
**Syntax**
```
./build.sh {Anypoint Org ID} {build option}
```

**Example**
```
./build.sh 3c07e201-c97b-4665-9310-e3ac89ce1c28 deploy
```

# Synchronizing Updates
This repository corresponds with the [Error Plugin for Mule public repo][handler-plugin].  Desired changes from that repo can be merged into this periodically if desired.  Make sure to use the branch that corresponds to the latest mule version.
Significant changes were made to this for flexibility and adherence to HTTP RFC 7231 responses, so syncing is likely not needed or desired.

[handler-plugin]: https://github.com/mulesoft-catalyst/error-handler-plugin
[mule-error]: https://docs.mulesoft.com/mule-runtime/4.3/mule-error-concept
[mule-error-types]: https://docs.mulesoft.com/mule-runtime/4.3/mule-error-concept#error_types
[http-rfc-7231-6]: https://tools.ietf.org/html/rfc7231#section-6
[http-rfc-7231-6.5]: https://tools.ietf.org/html/rfc7231#section-6.5
[http-rfc-7231-6.6]: https://tools.ietf.org/html/rfc7231#section-6.6
[dataweave-file]: https://docs.mulesoft.com/mule-runtime/4.3/dataweave-language-introduction#dwl_file
[xml-sdk]: https://docs.mulesoft.com/mule-sdk/1.1/xml-sdk
