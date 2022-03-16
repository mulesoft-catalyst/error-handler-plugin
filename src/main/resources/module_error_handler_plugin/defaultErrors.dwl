%dw 2.0
output application/json

import appendDescription from module_error_handler_plugin::common

fun appendDescriptionLocal(message) = appendDescription(
		message,
		vars.appendDefaultErrorDescription default false,
		vars.error.description
	)
---
{
	// Default error if no matching errors.
	"UNKNOWN": {
		status: 500,
		reason: "Internal Server Error",
		message: appendDescriptionLocal(vars.serverError)
    },
    
    // List of all standard API-related errors.
	"APIKIT:BAD_REQUEST": {
		"status": 400,
		"reason": "Bad Request",
		"message": appendDescriptionLocal(vars.badRequestError)
	},
	"HTTP:BAD_REQUEST": {
		"status": 400,
		"reason": "Bad Request",
		"message": appendDescriptionLocal(vars.badRequestError)
	},
	"HTTP:PARSING": {
		"status": 400,
		"reason": "Bad Request",
		"message": appendDescriptionLocal(vars.badRequestError)
	},
	"HTTP:CLIENT_SECURITY": {
		"status": 401,
		"reason": "Unauthorized",
		"message": appendDescriptionLocal(vars.unauthorizedError)
	},	
	"HTTP:SECURITY": {
		"status": 401,
		"reason": "Unauthorized",
		"message": appendDescriptionLocal(vars.unauthorizedError)
	},
	"MULE:SECURITY": {
		"status": 401,
		"reason": "Unauthorized",
		"message": appendDescriptionLocal(vars.unauthorizedError)
	},
	"HTTP:UNAUTHORIZED": {
		"status": 401,
		"reason": "Unauthorized",
		"message": appendDescriptionLocal(vars.unauthorizedError)
	},
	"HTTP:FORBIDDEN": {
		"status": 403,
		"reason": "Forbidden",
		"message": appendDescriptionLocal(vars.forbiddenError)
	},	
	"HTTP:NOT_FOUND": {
		"status": 404,
		"reason": "Not Found",
		"message": appendDescriptionLocal(vars.notFoundError)
	},
	"APIKIT:NOT_FOUND": {
		"status": 404,
		"reason": "Not Found",
		"message": appendDescriptionLocal(vars.notFoundError)
	},
	"APIKIT:METHOD_NOT_ALLOWED": {
		"status": 405,
		"reason": "Method Not Allowed",
		"message": appendDescriptionLocal(vars.methodNotAllowedError)
	},
	"HTTP:METHOD_NOT_ALLOWED": {
		"status": 405,
		"reason": "Method Not Allowed",
		"message": appendDescriptionLocal(vars.methodNotAllowedError)
	},
	"APIKIT:NOT_ACCEPTABLE": {
		"status": 406,
		"reason": "Not Acceptable",
		"message": appendDescriptionLocal(vars.notAcceptableError)
	},
	"HTTP:NOT_ACCEPTABLE": {
		"status": 406,
		"reason": "Not Acceptable",
		"message": appendDescriptionLocal(vars.notAcceptableError)
	},
	"HTTP:TIMEOUT": {
      "status":408,
      "reason": "Request Timeout",
      "message": appendDescriptionLocal(vars.timeoutError)
	},
	"APIKIT:UNSUPPORTED_MEDIA_TYPE": {
		"status": 415,
		"reason": "Unsupported Media Type",
		"message": appendDescriptionLocal(vars.unsupportedMediaTypeError)
	},
	"HTTP:UNSUPPORTED_MEDIA_TYPE": {
		"status": 415,
		"reason": "Unsupported Media Type",
		"message": appendDescriptionLocal(vars.unsupportedMediaTypeError)
	},
	"HTTP:TOO_MANY_REQUESTS": {
      "status":429,
      "reason": "Too Many Requests",
      "message": appendDescriptionLocal(vars.tooManyRequestsError)
	},
	"MULE:EXPRESSION": {
      "status":500,
      "reason": "Internal Server Error",
	  // Don't provide default error description for expression errors as that is a potential security issue.
      "message":vars.expressionError default ""
	},
	"APIKIT:NOT_IMPLEMENTED": {
		"status": 501,
		"reason": "Not Implemented",
		"message": appendDescriptionLocal(vars.notImplementedError)
	},
	"HTTP:NOT_IMPLEMENTED": {
		"status": 501,
		"reason": "Not Implemented",
		"message": appendDescriptionLocal(vars.notImplementedError)
	},
	"HTTP:BAD_GATEWAY": {
		"status": 502,
		"reason": "Bad Gateway",
		"message": appendDescriptionLocal(vars.connectivityError)
	},
	"HTTP:CONNECTIVITY": {
		"status": 503,
		"reason": "Service Unavailable",
		"message": appendDescriptionLocal(vars.connectivityError)
	},
	"HTTP:RETRY_EXHAUSTED": {
		"status": 503,
		"reason": "Service Unavailable",
		"message": appendDescriptionLocal(vars.connectivityError)
	},
	"HTTP:SERVICE_UNAVAILABLE": {
		"status": 503,
		"reason": "Service Unavailable",
		"message": appendDescriptionLocal(vars.connectivityError)
	}
}