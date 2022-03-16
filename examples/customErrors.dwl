%dw 2.0
output application/json

import * from module_error_handler_plugin::common

// Map error parameter in module to local variable to match normal error selector syntax like 'error.description'.
var error = vars.error
// Nested error pulled off the Mule error object, which conforms to the API Error Handler responses.
var nestedError = getNestedErrorMessage(error)
---
{
    /*
    APP 401 Unauthorized
    This catches custom service unauthorized error from app and formats the response accordingly.
    */
    "APP:UNAUTHORIZED": {
        "status":401,
        "reason": "Unauthorized",
        "message": appendDescription(
        	"There was an issue with authorization.",
        	vars.appendDefaultErrorDescription default false,
        	error.description
        )
    },

    /*
    APP 503 Service Unavailable
    This catches custom service unavailable error from app and formats the response accordingly.
    */
    "APP:SERVICE_UNAVAILABLE": {
        "status":503,
        "reason": "Service Unavailable",
        "message": appendDescription(
        	"There was an issue connecting to the system.",
        	vars.appendDefaultErrorDescription default false,
        	error.description
        )
    },

    /*
    HTTP 500 Pass Through
    This catches HTTP 500 errors and propagates the detailed reason for failure.
    It uses the error.message field from the response of the HTTP call that failed, which conforms to the API Error Handler responses.
    If not found, the error.description will be returned, which generally says an internal server error occurred.
    This useful for process or experience APIs to pass through system API errors.
    */
    "HTTP:INTERNAL_SERVER_ERROR": {
        "status":500,
        "reason": "Internal Server Error",
        "message": appendDescription(
        	"Internal Server Error.", 
        	vars.appendDefaultErrorDescription default false,
        	if (!isEmpty(nestedError)) nestedError else error.description
        )
    }
}