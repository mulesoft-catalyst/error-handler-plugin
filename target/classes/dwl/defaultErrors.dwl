%dw 2.0
output application/json
---
[
   {
      "errorType":"HTTP:CLIENT_SECURITY",
      "errorCode":401,
      "errorMessage": vars.unauthorizedError default "You have issues accessing the system",
      "rfcName": "Unauthorized"
   },
	 {
      "errorType":"HTTP:FORBIDDEN",
      "errorCode":401,
      "errorMessage":vars.unauthorizedError default "You have issues accessing the system",
      "rfcName": "Unauthorized"
   },
	 {
      "errorType":"HTTP:SECURITY",
      "errorCode":401,
      "errorMessage":vars.unauthorizedError default "You have issues accessing the system",
      "rfcName": "Unauthorized"
   },
	 {
      "errorType":"MULE:SECURITY",
      "errorCode":401,
      "errorMessage":vars.unauthorizedError default "You have issues accessing the system",
      "rfcName": "Unauthorized"
   },
	 {
      "errorType":"HTTP:UNAUTHORIZED",
      "errorCode":401,
      "errorMessage":vars.unauthorizedError default "You have issues accessing the system",
      "rfcName": "Unauthorized"
   },
	 {
      "errorType":"APIKIT:BAD_REQUEST",
      "errorCode":400,
      "errorMessage":vars.badRequestError default "There was an issue with your request message.",
      "rfcName": "Bad Request"
   },
	 {
      "errorType":"HTTP:BAD_REQUEST",
      "errorCode":400,
      "errorMessage":vars.badRequestError default "There was an issue with your request message.",
      "rfcName": "Bad Request"
   },
	 {
      "errorType":"HTTP:PARSING",
      "errorCode":400,
      "errorMessage":vars.badRequestError default "There was an issue with your request message.",
      "rfcName": "Bad Request"
   },
	 {
      "errorType":"HTTP:NOT_FOUND",
      "errorCode":404,
      "errorMessage":vars.notFoundError default "The API has not been implemented",
      "rfcName": "Not Found"
   },
	 {
      "errorType":"APIKIT:NOT_FOUND",
      "errorCode":404,
      "errorMessage":vars.notFoundError default "The API has not been implemented",
      "rfcName": "Not Found"
   },
	 {
      "errorType":"APIKIT:NOT_ACCEPTABLE",
      "errorCode":406,
      "errorMessage":vars.notAcceptableError default "One of the request or parameters is unacceptable",
      "rfcName": "Not Acceptable"
   },
	 {
      "errorType":"HTTP:NOT_ACCEPTABLE",
      "errorCode":406,
      "errorMessage":vars.notAcceptableError default "One of the request or parameters is unacceptable",
      "rfcName": "Not Acceptable"
   },
	 {
      "errorType":"APIKIT:UNSUPPORTED_MEDIA_TYPE",
      "errorCode":415,
      "errorMessage":vars.unsupportedMediaTypeError default "Media Type not supported",
      "rfcName": "Unsupported Media Type"
   },
	 {
      "errorType":"HTTP:UNSUPPORTED_MEDIA_TYPE",
      "errorCode":415,
      "errorMessage":vars.unsupportedMediaTypeError default "Media Type not supported",
      "rfcName": "Unsupported Media Type"
   },
	 {
      "errorType":"HTTP:CONNECTIVITY",
      "errorCode":503,
      "errorMessage":vars.connectivityError default "You have issues connecting to the system",
      "rfcName": "Bad Connectivity"
   },
	 {
      "errorType":"HTTP:RETRY_EXHAUSTED",
      "errorCode":503,
      "errorMessage":vars.connectivityError default "You have issues connecting to the system",
      "rfcName": "Bad Connectivity"
   },
	 {
      "errorType":"HTTP:SERVICE_UNAVAILABLE",
      "errorCode":503,
      "errorMessage":vars.connectivityError default "You have issues connecting to the system",
      "rfcName": "Bad Connectivity"
   },
	 {
      "errorType":"APIKIT:METHOD_NOT_ALLOWED",
      "errorCode":501,
      "errorMessage":vars.methodNotAllowedError default "The method has not been implemented",
      "rfcName": "Method Not Allowed"
   },
	 {
      "errorType":"HTTP:METHOD_NOT_ALLOWED",
      "errorCode":501,
      "errorMessage":vars.methodNotAllowedError default "The method has not been implemented",
      "rfcName": "Method Not Allowed"
   },
	 {
      "errorType":"HTTP:TIMEOUT",
      "errorCode":408,
      "errorMessage":vars.timeoutError default "You request to the server has been timed-out",
      "rfcName": "Timeout"
   },
	 {
      "errorType":"HTTP:TOO_MANY_REQUESTS",
      "errorCode":429,
      "errorMessage":vars.tooManyRequestsError default "You have made too many requests to the server",
      "rfcName": "Too Many Requests"
   }
]