%dw 2.0
output application/json
---
[
   {
      "errorType": "HTTP:CLIENT_SECURITY",
      "errorCode": 401,
      "errorHttpStatus": 401,
      "errorMessage": vars.unauthorizedError default "You have issues accessing the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Unauthorized"
   },
	 {
      "errorType": "HTTP:FORBIDDEN",
      "errorCode": 401,
      "errorHttpStatus": 401,
      "errorMessage": vars.unauthorizedError default "You have issues accessing the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Unauthorized"
   },
	 {
      "errorType": "HTTP:SECURITY",
      "errorCode": 401,
      "errorHttpStatus": 401,
      "errorMessage": vars.unauthorizedError default "You have issues accessing the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Unauthorized"
   },
	 {
      "errorType":"HTTP:UNAUTHORIZED",
      "errorCode": 401,
      "errorHttpStatus": 401,
      "errorMessage": vars.unauthorizedError default "You have issues accessing the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Unauthorized"
   },
	 {
      "errorType":"APIKIT:BAD_REQUEST",
      "errorCode": 400,
      "errorHttpStatus": 400,
      "errorMessage": vars.badRequestError default "There was an issue with your request message.",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Bad Request"
   },
   {
      "errorType":"HTTP:BAD_REQUEST",
      "errorCode": 400,
      "errorHttpStatus": 400,
      "errorMessage": vars.badRequestError default "There was an issue with your request message.",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Bad Request"
   },
	 {
      "errorType": "HTTP:NOT_FOUND",
      "errorCode": 404,
      "errorHttpStatus": 404,
      "errorMessage": vars.notFoundError default "The API has not been implemented",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Not Found"
   },
    {
      "errorType": "APIKIT:NOT_FOUND",
      "errorCode": 404,
      "errorHttpStatus": 404,
      "errorMessage": vars.notFoundError default "The API has not been implemented",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Not Found"
   },
	 {
      "errorType":"APIKIT:NOT_ACCEPTABLE",
      "errorCode": 406,
      "errorHttpStatus": 406,
      "errorMessage": vars.notAcceptableError default "One of the request or parameters is unacceptable",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Not Acceptable"
   },
	 {
      "errorType": "HTTP:UNSUPPORTED_MEDIA_TYPE",
      "errorCode": 415,
      "errorHttpStatus": 415,
      "errorMessage": vars.unsupportedMediaTypeError default "Media Type not supported",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Unsupported Media Type"
   },
   {
      "errorType": "APIKIT:UNSUPPORTED_MEDIA_TYPE",
      "errorCode": 415,
      "errorHttpStatus": 415,
      "errorMessage": vars.unsupportedMediaTypeError default "Media Type not supported",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Unsupported Media Type"
   },
	 {
      "errorType": "HTTP:CONNECTIVITY",
      "errorCode": 503,
      "errorHttpStatus": 503,
      "errorMessage": vars.connectivityError default "You have issues connecting to the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Bad Connectivity"
   },
	 {
      "errorType": "HTTP:RETRY_EXHAUSTED",
      "errorCode": 503,
      "errorHttpStatus": 503,
      "errorMessage": vars.connectivityError default "You have issues connecting to the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Bad Connectivity"
   },
	 {
      "errorType": "HTTP:SERVICE_UNAVAILABLE",
      "errorCode": 503,
      "errorHttpStatus": 503,
      "errorMessage": vars.connectivityError default "You have issues connecting to the system",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Bad Connectivity"
   },
	 {
      "errorType": "HTTP:METHOD_NOT_ALLOWED",
      "errorCode": 405,
      "errorHttpStatus": 405,
      "errorMessage": vars.methodNotAllowedError default "The method is not allowed",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Method Not Allowed"
   },
   {
      "errorType": "APIKIT:METHOD_NOT_ALLOWED",
      "errorCode": 405,
      "errorHttpStatus": 405,
      "errorMessage": vars.methodNotAllowedError default "The method is not allowed",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Method Not Allowed"
   },
	 {
      "errorType": "HTTP:TIMEOUT",
      "errorCode": 408,
      "errorHttpStatus": 408,
      "errorMessage": vars.timeoutError default "Your request to the server has been timed-out",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Timeout"
   },
	 {
      "errorType": "HTTP:TOO_MANY_REQUESTS",
      "errorCode": 429,
      "errorHttpStatus": 429,
      "errorMessage": vars.tooManyRequestsError default "You have made too many requests to the server",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Too Many Requests"
   },
   {
      "errorType": "APIKIT:NOT_IMPLEMENTED",
      "errorCode": 501,
      "errorHttpStatus": 501,
      "errorMessage": vars.notImplemented default "This method has not been implemented",
      "errorDeveloperMessage": vars.developerMessage default "Error Type: " ++ vars.errorType as String default "" ++ " , Detail: " ++ vars.error.description as String default "",
      "errorMoreInfo": vars.errorMoreInfoMessage default "No Additional Info",
      "errorTitle": "Not Implemented"
   }
]