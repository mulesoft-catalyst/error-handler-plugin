%dw 2.0
output application/json
---
if ( vars.appendDefaultErrorDescription ) {
	"HTTP:CLIENT_SECURITY": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": (vars.unauthorizedError default "" ++ " " ++ vars.error.description default "") default "You have issues accessing the system"
	},
	"HTTP:FORBIDDEN": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": (vars.unauthorizedError default "" ++ " " ++ vars.error.description default "") default "You have issues accessing the system"
	},
	"HTTP:SECURITY": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": (vars.unauthorizedError default "" ++ " " ++ vars.error.description default "") default "You have issues accessing the system"
	},
	"MULE:SECURITY": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": (vars.unauthorizedError default "" ++ " " ++ vars.error.description default "") default "You have issues accessing the system"
	},
	"HTTP:UNAUTHORIZED": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": (vars.unauthorizedError default "" ++ " " ++ vars.error.description default "") default "You have issues accessing the system"
	},
	"APIKIT:BAD_REQUEST": {
		"errorCode": 400,
		"reason": "Bad Request",
		"defaultError": (vars.badRequestError default "" ++ " " ++ vars.error.description default "") default "There was an issue with your request message."
	},
	"HTTP:BAD_REQUEST": {
		"errorCode": 400,
		"reason": "Bad Request",
		"defaultError": (vars.badRequestError default "" ++ " " ++ vars.error.description default "") default "There was an issue with your request message."
	},
	"HTTP:PARSING": {
		"errorCode": 400,
		"reason": "Bad Request",
		"defaultError": (vars.badRequestError default "" ++ " " ++ vars.error.description default "") default "There was an issue with your request message."
	},
	"HTTP:NOT_FOUND": {
		"errorCode": 404,
		"reason": "Not Found",
		"defaultError": (vars.notFoundError default "" ++ " " ++ vars.error.description default "") default "Resource not found"
	},
	"APIKIT:NOT_FOUND": {
		"errorCode": 404,
		"reason": "Not Found",
		"defaultError": (vars.notFoundError default "" ++ " " ++ vars.error.description default "") default "Resource not found"
	},
	"APIKIT:METHOD_NOT_ALLOWED": {
		"errorCode": 405,
		"reason": "Method Not Allowed",
		"defaultError": (vars.methodNotAllowedError default "" ++ " " ++ vars.error.description default "") default "Resource not found"
	},
	"HTTP:METHOD_NOT_ALLOWED": {
		"errorCode": 405,
		"reason": "Method Not Allowed",
		"defaultError": (vars.methodNotAllowedError default "" ++ " " ++ vars.error.description default "") default "The method is not allowed"
	}
	"APIKIT:NOT_ACCEPTABLE": {
		"errorCode": 406,
		"reason": "Not Acceptable",
		"defaultError": (vars.notAcceptableError default "" ++ " " ++ vars.error.description default "") default "One of the request or parameters is unacceptable"
	},
	"HTTP:NOT_ACCEPTABLE": {
		"errorCode": 406,
		"reason": "Not Acceptable",
		"defaultError": (vars.notAcceptableError default "" ++ " " ++ vars.error.description default "") default "One of the request or parameters is unacceptable"
	},
	"APIKIT:UNSUPPORTED_MEDIA_TYPE": {
		"errorCode": 415,
		"reason": "Unsupported Media Type",
		"defaultError": (vars.unsupportedMediaTypeError default "" ++ " " ++ vars.error.description default "") default "Media Type not supported"
	},
	"HTTP:UNSUPPORTED_MEDIA_TYPE": {
		"errorCode": 415,
		"reason": "Unsupported Media Type",
		"defaultError": (vars.unsupportedMediaTypeError default "" ++ " " ++ vars.error.description default "") default "Media Type not supported"
	},
	"HTTP:CONNECTIVITY": {
		"errorCode": 503,
		"reason": "Bad Connectivity",
		"defaultError": (vars.connectivityError default "" ++ " " ++ vars.error.description default "") default "The service is unavailable"
	},
	"HTTP:RETRY_EXHAUSTED": {
		"errorCode": 503,
		"reason": "Bad Connectivity",
		"defaultError": (vars.connectivityError default "" ++ " " ++ vars.error.description default "") default "The service is unavailable"
	},
	"HTTP:SERVICE_UNAVAILABLE": {
		"errorCode": 503,
		"reason": "Bad Connectivity",
		"defaultError": (vars.connectivityError default "" ++ " " ++ vars.error.description default "") default "The service is unavailable"
	},
	"APIKIT:NOT_IMPLEMENTED": {
		"errorCode": 501,
		"reason": "Method Not Implemented",
		"defaultError": (vars.notImplementedError default "" ++ " " ++ vars.error.description default "") default "The method has not been implemented"
	},
	"HTTP:NOT_IMPLEMENTED": {
		"errorCode": 501,
		"reason": "Method Not Implemented",
		"defaultError": (vars.notImplementedError default "" ++ " " ++ vars.error.description default "") default "The method has not been implemented"
	},
	"HTTP:TIMEOUT": {
		"errorCode": 408,
		"reason": "Timeout",
		"defaultError": (vars.timeoutError default "" ++ " " ++ vars.error.description default "") default "You request to the server has been timed-out"
	},
	"HTTP:TOO_MANY_REQUESTS": {
		"errorCode": 429,
		"reason": "Too Many Requests",
		"defaultError": (vars.tooManyRequestsError default "" ++ " " ++ vars.error.description default "") default "You have made too many requests to the server"
	}
}

else 
{
	"HTTP:CLIENT_SECURITY": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": vars.unauthorizedError default "You have issues accessing the system"
	},
	"HTTP:FORBIDDEN": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": vars.unauthorizedError default "You have issues accessing the system"
	},
	"HTTP:SECURITY": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": vars.unauthorizedError default "You have issues accessing the system"
	},
	"MULE:SECURITY": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": vars.unauthorizedError default "You have issues accessing the system"
	},
	"HTTP:UNAUTHORIZED": {
		"errorCode": 401,
		"reason": "Unauthorized",
		"defaultError": vars.unauthorizedError default "You have issues accessing the system"
	},
	"APIKIT:BAD_REQUEST": {
		"errorCode": 400,
		"reason": "Bad Request",
		"defaultError": vars.badRequestError default "There was an issue with your request message."
	},
	"HTTP:BAD_REQUEST": {
		"errorCode": 400,
		"reason": "Bad Request",
		"defaultError": vars.badRequestError default "There was an issue with your request message."
	},
	"HTTP:PARSING": {
		"errorCode": 400,
		"reason": "Bad Request",
		"defaultError": vars.badRequestError default "There was an issue with your request message."
	},
	"HTTP:NOT_FOUND": {
		"errorCode": 404,
		"reason": "Not Found",
		"defaultError": vars.notFoundError default "The API has not been implemented"
	},
	"APIKIT:NOT_FOUND": {
		"errorCode": 404,
		"reason": "Not Found",
		"defaultError": vars.notFoundError default "The API has not been implemented"
	},
	"APIKIT:NOT_ACCEPTABLE": {
		"errorCode": 406,
		"reason": "Not Acceptable",
		"defaultError": vars.notAcceptableError default "One of the request or parameters is unacceptable"
	},
	"HTTP:NOT_ACCEPTABLE": {
		"errorCode": 406,
		"reason": "Not Acceptable",
		"defaultError": vars.notAcceptableError default "One of the request or parameters is unacceptable"
	},
	"APIKIT:UNSUPPORTED_MEDIA_TYPE": {
		"errorCode": 415,
		"reason": "Unsupported Media Type",
		"defaultError": vars.unsupportedMediaTypeError default "Media Type not supported"
	},
	"HTTP:UNSUPPORTED_MEDIA_TYPE": {
		"errorCode": 415,
		"reason": "Unsupported Media Type",
		"defaultError": vars.unsupportedMediaTypeError default "Media Type not supported"
	},
	"HTTP:CONNECTIVITY": {
		"errorCode": 503,
		"reason": "Bad Connectivity",
		"defaultError": vars.connectivityError default "You have issues connecting to the system"
	},
	"HTTP:RETRY_EXHAUSTED": {
		"errorCode": 503,
		"reason": "Bad Connectivity",
		"defaultError": vars.connectivityError default "You have issues connecting to the system"
	},
	"HTTP:SERVICE_UNAVAILABLE": {
		"errorCode": 503,
		"reason": "Bad Connectivity",
		"defaultError": vars.connectivityError default "You have issues connecting to the system"
	},
	"APIKIT:METHOD_NOT_ALLOWED": {
		"errorCode": 501,
		"reason": "Method Not Allowed",
		"defaultError": vars.methodNotAllowedError default "The method has not been implemented"
	},
	"HTTP:METHOD_NOT_ALLOWED": {
		"errorCode": 501,
		"reason": "Method Not Allowed",
		"defaultError": vars.methodNotAllowedError default "The method has not been implemented"
	},
	"HTTP:TIMEOUT": {
		"errorCode": 408,
		"reason": "Timeout",
		"defaultError": vars.timeoutError default "You request to the server has been timed-out"
	},
	"HTTP:TOO_MANY_REQUESTS": {
		"errorCode": 429,
		"reason": "Too Many Requests",
		"defaultError": vars.tooManyRequestsError default "You have made too many requests to the server"
	}
}