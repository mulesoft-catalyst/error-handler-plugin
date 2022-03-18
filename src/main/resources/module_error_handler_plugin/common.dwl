%dw 2.0

/*
 NOTICE:
    This file must be in the ./resources/<module name> folder in order to be exported in the META-INF/mule-artifact/mule-artifact.json file.  This allows the functions to be used in the module as they are executed in the app's context (without the mule message context).
 */

import mergeWith from dw::core::Objects

// Downstream error pulled off the Mule error object, which conforms to the API Error Handler responses.
fun getPreviousErrorMessage(error) = error.exception.errorMessage.typedValue.error.message default ""

// Get the error type string
fun getErrorTypeAsString(errorType) = 
    if (!isBlank(errorType.namespace))
        errorType.namespace ++ ":" ++ (errorType.identifier default "") 
    else
        "UNKNOWN"

// Get the proper error from the merged default and custom error lists.  Provide a standard error if none found.
fun getError(errorType, defaultErrors, customErrors = {}) = do {
    var errorList = (defaultErrors mergeWith customErrors)
    var foundError = errorList[errorType]
    var error = if ( !isEmpty(foundError) ) foundError else errorList["UNKNOWN"]
    ---
    error
}
