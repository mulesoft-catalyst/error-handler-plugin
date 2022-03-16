%dw 2.0

/*
 NOTICE:
    This file must be in the ./resources/<module name> folder in order to be exported in the META-INF/mule-artifact/mule-artifact.json file.  This allows the functions to be used in the module as they are executed in the app's context (without the mule message context).
 */

import mergeWith from dw::core::Objects

// Nested error pulled off the Mule error object, which conforms to the API Error Handler responses.
fun getNestedErrorMessage(error) = error.exception.errorMessage.typedValue.error.message default ""

// Conditionally add default error description to the user-specified message.
fun appendDescription(message, doAppend, description, delimiter = " | ") = 
    if (doAppend)
        (message default "") ++ delimiter ++ (description default "")
    else
        message default ""

// Get the error type string
fun getErrorTypeAsString(errorType) = 
    if (!isBlank(errorType.namespace))
        errorType.namespace ++ ":" ++ (errorType.identifier default "") 
    else
        "UNKNOWN"

// Get the proper error from the merged default and custom error lists.  Provide a standard 500 if none found.
fun getErrorResponse(errorType, defaultErrors, customErrors = {}) = do {
    var errorList = (defaultErrors mergeWith customErrors)
    var foundError = errorList[errorType]
    var response = if ( !isEmpty(foundError.status) ) foundError else errorList["UNKNOWN"]
    ---
    {
        error: response
    }
}