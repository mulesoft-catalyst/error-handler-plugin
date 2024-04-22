%dw 2.0
output application/json

// Conditionally set error message to the user-specified or the generated message.
fun getMessage(message) = 
    if (vars.useGeneratedError default true)
        vars.error.description default message
    else
        message
---
{
	// Default error if no matching errors.
	"UNKNOWN": {
		code: 500,
		reason: "Internal Server Error",
		message: getMessage(vars.serverError)
    },
    
    // List of all standard API-related errors.
	"APIKIT:BAD_REQUEST": {
		"code": 400,
		"reason": "Bad Request",
		"message": getMessage(vars.badRequestError)
	},
	"HTTP:BAD_REQUEST": {
		"code": 400,
		"reason": "Bad Request",
		"message": getMessage(vars.badRequestError)
	},
	"HTTP:PARSING": {
		"code": 400,
		"reason": "Bad Request",
		"message": getMessage(vars.badRequestError)
	},
	"HTTP:CLIENT_SECURITY": {
		"code": 401,
		"reason": "Unauthorized",
		"message": getMessage(vars.unauthorizedError)
	},	
	"HTTP:SECURITY": {
		"code": 401,
		"reason": "Unauthorized",
		"message": getMessage(vars.unauthorizedError)
	},
	"MULE:SECURITY": {
		"code": 401,
		"reason": "Unauthorized",
		"message": getMessage(vars.unauthorizedError)
	},
	"HTTP:UNAUTHORIZED": {
		"code": 401,
		"reason": "Unauthorized",
		"message": getMessage(vars.unauthorizedError)
	},
	"HTTP:FORBIDDEN": {
		"code": 403,
		"reason": "Forbidden",
		"message": getMessage(vars.forbiddenError)
	},	
	"HTTP:NOT_FOUND": {
		"code": 404,
		"reason": "Not Found",
		"message": getMessage(vars.notFoundError)
	},
	"APIKIT:NOT_FOUND": {
		"code": 404,
		"reason": "Not Found",
		"message": getMessage(vars.notFoundError)
	},
	"APIKIT:METHOD_NOT_ALLOWED": {
		"code": 405,
		"reason": "Method Not Allowed",
		"message": getMessage(vars.methodNotAllowedError)
	},
	"HTTP:METHOD_NOT_ALLOWED": {
		"code": 405,
		"reason": "Method Not Allowed",
		"message": getMessage(vars.methodNotAllowedError)
	},
	"APIKIT:NOT_ACCEPTABLE": {
		"code": 406,
		"reason": "Not Acceptable",
		"message": getMessage(vars.notAcceptableError)
	},
	"HTTP:NOT_ACCEPTABLE": {
		"code": 406,
		"reason": "Not Acceptable",
		"message": getMessage(vars.notAcceptableError)
	},
	"HTTP:TIMEOUT": {
      "code":408,
      "reason": "Request Timeout",
      "message": getMessage(vars.timeoutError)
	},
	"APIKIT:UNSUPPORTED_MEDIA_TYPE": {
		"code": 415,
		"reason": "Unsupported Media Type",
		"message": getMessage(vars.unsupportedMediaTypeError)
	},
	"HTTP:UNSUPPORTED_MEDIA_TYPE": {
		"code": 415,
		"reason": "Unsupported Media Type",
		"message": getMessage(vars.unsupportedMediaTypeError)
	},
	"HTTP:TOO_MANY_REQUESTS": {
      "code":429,
      "reason": "Too Many Requests",
      "message": getMessage(vars.tooManyRequestsError)
	},
	"MULE:EXPRESSION": {
      "code":500,
      "reason": "Internal Server Error",
	  // Don't provide default error description for expression errors as that is a potential security issue.
      "message": vars.expressionError default ""
	},
	"APIKIT:NOT_IMPLEMENTED": {
		"code": 501,
		"reason": "Not Implemented",
		"message": getMessage(vars.notImplementedError)
	},
	"HTTP:NOT_IMPLEMENTED": {
		"code": 501,
		"reason": "Not Implemented",
		"message": getMessage(vars.notImplementedError)
	},
	"HTTP:BAD_GATEWAY": {
		"code": 502,
		"reason": "Bad Gateway",
		"message": getMessage(vars.connectivityError)
	},
	"HTTP:CONNECTIVITY": {
		"code": 503,
		"reason": "Service Unavailable",
		"message": getMessage(vars.connectivityError)
	},
	"HTTP:RETRY_EXHAUSTED": {
		"code": 503,
		"reason": "Service Unavailable",
		"message": getMessage(vars.connectivityError)
	},
	"HTTP:SERVICE_UNAVAILABLE": {
		"code": 503,
		"reason": "Service Unavailable",
		"message": getMessage(vars.connectivityError)
	}
}