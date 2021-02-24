%dw 2.0
output application/java
---
{
   "APIKIT:BAD_REQUEST": {
      "errorCode":400,
      "errorMessage": "Bad Request",
      "errorDescription":vars.badRequestError default "There was an issue with your request"
   },
   "HTTP:BAD_REQUEST": {
      "errorCode":400,
      "errorMessage": "Bad Request",
      "errorDescription":vars.badRequestError default "There was an issue with your request"
   },
	"HTTP:PARSING": {
      "errorCode":400,
      "errorMessage": "Bad Request",
      "errorDescription":vars.badRequestError default "There was an issue with your request"
   },
   "HTTP:CLIENT_SECURITY": {
      "errorCode":401,
      "errorMessage": "Unauthorized",
      "errorDescription": vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"HTTP:FORBIDDEN": {
      "errorCode":401,
      "errorMessage": "Unauthorized",
      "errorDescription":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"HTTP:SECURITY": {
      "errorCode":401,
      "errorMessage": "Unauthorized",
      "errorDescription":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"MULE:SECURITY": {
      "errorCode":401,
      "errorMessage": "Unauthorized",
      "errorDescription":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"HTTP:UNAUTHORIZED": {
      "errorCode":401,
      "errorMessage": "Unauthorized",
      "errorDescription":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
   "HTTP:FORBIDDEN": {
      "errorCode":403,
      "errorMessage": "Forbidden",
      "errorDescription":vars.forbiddenError default "You are not allowed to make this request"
   },
	"HTTP:NOT_FOUND": {
      "errorCode":404,
      "errorMessage": "Not Found",
      "errorDescription":vars.notFoundError default "Resource not found"
   },
	"APIKIT:NOT_FOUND": {
      "errorCode":404,
      "errorMessage": "Not Found",
      "errorDescription":vars.notFoundError default "Resource not found"
   },
   "APIKIT:METHOD_NOT_ALLOWED": {
      "errorCode":405,
      "errorMessage": "Method Not Allowed",
      "errorDescription":vars.methodNotAllowedError default "Method not allowed"
   },
   "HTTP:METHOD_NOT_ALLOWED": {
      "errorCode":405,
      "errorMessage": "Method Not Allowed",
      "errorDescription":vars.methodNotAllowedError default "Method not allowed"
   },
	"APIKIT:NOT_ACCEPTABLE": {
      "errorCode":406,
      "errorMessage": "Not Acceptable",
      "errorDescription":vars.notAcceptableError default "The API cannot provide the requested accepted response"
   },
	"HTTP:NOT_ACCEPTABLE": {
      "errorCode":406,
      "errorMessage": "Not Acceptable",
      "errorDescription":vars.notAcceptableError default "The API cannot provide the requested accepted response"
   },
	"HTTP:TIMEOUT": {
      "errorCode":408,
      "errorMessage": "Request Timeout",
      "errorDescription":vars.timeoutError default "The request to the server has been timed-out"
   },
	"APIKIT:UNSUPPORTED_MEDIA_TYPE": {
      "errorCode":415,
      "errorMessage": "Unsupported Media Type",
      "errorDescription":vars.unsupportedMediaTypeError default "Media type not supported"
   },
	"HTTP:UNSUPPORTED_MEDIA_TYPE": {
      "errorCode":415,
      "errorMessage": "Unsupported Media Type",
      "errorDescription":vars.unsupportedMediaTypeError default "Media type not supported"
   },
	"HTTP:TOO_MANY_REQUESTS": {
      "errorCode":429,
      "errorMessage": "Too Many Requests",
      "errorDescription":vars.tooManyRequestsError default "You have made too many requests to the server"
   },
   "MULE:EXPRESSION": {
      "errorCode":500,
      "errorMessage": "Internal Server Error",
      "errorDescription":vars.expressionError default "Error with data transformation.  See log for details."
   },
	"APIKIT:NOT_IMPLEMENTED": {
      "errorCode":501,
      "errorMessage": "Not Implemented",
      "errorDescription":vars.methodNotImplementedError default "The operation has not been implemented"
   },	 
	"HTTP:CONNECTIVITY": {
      "errorCode":503,
      "errorMessage": "Service Unavailable",
      "errorDescription":vars.connectivityError default "Unable to access the system at this time"
   },
	"HTTP:RETRY_EXHAUSTED": {
      "errorCode":503,
      "errorMessage": "Service Unavailable",
      "errorDescription":vars.connectivityError default "Unable to access the system at this time"
   },
	"HTTP:SERVICE_UNAVAILABLE": {
      "errorCode":503,
      "errorMessage": "Service Unavailable",
      "errorDescription":vars.connectivityError default "Unable to access the system at this time"
   }
}