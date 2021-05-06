%dw 2.0
output application/java
---
{
   "APIKIT:BAD_REQUEST": {
      "status":400,
      "reason": "Bad Request",
      "message":vars.badRequestError default "There was an issue with your request"
   },
   "HTTP:BAD_REQUEST": {
      "status":400,
      "reason": "Bad Request",
      "message":vars.badRequestError default "There was an issue with your request"
   },
	"HTTP:PARSING": {
      "status":400,
      "reason": "Bad Request",
      "message":vars.badRequestError default "There was an issue with your request"
   },
   "HTTP:CLIENT_SECURITY": {
      "status":401,
      "reason": "Unauthorized",
      "message": vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"HTTP:FORBIDDEN": {
      "status":401,
      "reason": "Unauthorized",
      "message":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"HTTP:SECURITY": {
      "status":401,
      "reason": "Unauthorized",
      "message":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"MULE:SECURITY": {
      "status":401,
      "reason": "Unauthorized",
      "message":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
	"HTTP:UNAUTHORIZED": {
      "status":401,
      "reason": "Unauthorized",
      "message":vars.unauthorizedError default "Authentication was not provided or is invalid"
   },
   "HTTP:FORBIDDEN": {
      "status":403,
      "reason": "Forbidden",
      "message":vars.forbiddenError default "You are not allowed to make this request"
   },
	"HTTP:NOT_FOUND": {
      "status":404,
      "reason": "Not Found",
      "message":vars.notFoundError default "Resource not found"
   },
	"APIKIT:NOT_FOUND": {
      "status":404,
      "reason": "Not Found",
      "message":vars.notFoundError default "Resource not found"
   },
   "APIKIT:METHOD_NOT_ALLOWED": {
      "status":405,
      "reason": "Method Not Allowed",
      "message":vars.methodNotAllowedError default "Method not allowed"
   },
   "HTTP:METHOD_NOT_ALLOWED": {
      "status":405,
      "reason": "Method Not Allowed",
      "message":vars.methodNotAllowedError default "Method not allowed"
   },
	"APIKIT:NOT_ACCEPTABLE": {
      "status":406,
      "reason": "Not Acceptable",
      "message":vars.notAcceptableError default "The API cannot provide the requested accepted response"
   },
	"HTTP:NOT_ACCEPTABLE": {
      "status":406,
      "reason": "Not Acceptable",
      "message":vars.notAcceptableError default "The API cannot provide the requested accepted response"
   },
	"HTTP:TIMEOUT": {
      "status":408,
      "reason": "Request Timeout",
      "message":vars.timeoutError default "The request to the server has been timed-out"
   },
	"APIKIT:UNSUPPORTED_MEDIA_TYPE": {
      "status":415,
      "reason": "Unsupported Media Type",
      "message":vars.unsupportedMediaTypeError default "Media type not supported"
   },
	"HTTP:UNSUPPORTED_MEDIA_TYPE": {
      "status":415,
      "reason": "Unsupported Media Type",
      "message":vars.unsupportedMediaTypeError default "Media type not supported"
   },
	"HTTP:TOO_MANY_REQUESTS": {
      "status":429,
      "reason": "Too Many Requests",
      "message":vars.tooManyRequestsError default "You have made too many requests to the server"
   },
   "MULE:EXPRESSION": {
      "status":500,
      "reason": "Internal Server Error",
      "message":vars.expressionError default "Error with data transformation.  See log for details."
   },
	"APIKIT:NOT_IMPLEMENTED": {
      "status":501,
      "reason": "Not Implemented",
      "message":vars.methodNotImplementedError default "The operation has not been implemented"
   },	 
	"HTTP:CONNECTIVITY": {
      "status":503,
      "reason": "Service Unavailable",
      "message":vars.connectivityError default "Unable to access the system at this time"
   },
	"HTTP:RETRY_EXHAUSTED": {
      "status":503,
      "reason": "Service Unavailable",
      "message":vars.connectivityError default "Unable to access the system at this time"
   },
	"HTTP:SERVICE_UNAVAILABLE": {
      "status":503,
      "reason": "Service Unavailable",
      "message":vars.connectivityError default "Unable to access the system at this time"
   }
}