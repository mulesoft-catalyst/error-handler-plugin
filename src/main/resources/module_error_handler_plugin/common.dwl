%dw 2.0

/*
 NOTICE:
    This file must be in the ./resources/<module name> folder in order to be exported in the META-INF/mule-artifact/mule-artifact.json file.  This allows the functions to be used in the module as they are executed in the app's context (without the mule message context).
 */

// Downstream error pulled off the Mule error object, which conforms to the API Error Handler responses.
fun getPreviousErrorMessage(error) = if (!isEmpty(error.exception.errorMessage.TypedValue)) error.exception.errorMessage.typedValue.error.message else if(!isEmpty(error.exception)) error.exception.message else ''

/*
 *  Get the error type as a String
 */
fun getErrorTypeAsString(errorType) =
    if (!isBlank(errorType.namespace))
        errorType.namespace ++ ":" ++ (errorType.identifier default "")
    else
        "UNKNOWN"

/*
 * Get the proper error from the merged default and custom error lists.  Provide a standard error if none found.
 */
fun getError(errorType, defaultErrors, customErrors = {}) = do {
    import mergeWith from dw::core::Objects
    var errorList = (defaultErrors mergeWith (customErrors default {}))
    var foundError = errorList[errorType]
    var error = if ( !isEmpty(foundError) ) foundError else errorList["UNKNOWN"]
    ---
    error
}

/*
 * Convert non-empty items to String.  If not a string, then writes in Java format.
 * If empty, then returns the default value provided
 */
fun toString(obj, def="") = obj match {
    case item if (item is String and !isEmpty(item)) -> item
    case item if !isEmpty(item) -> write(item, "application/java")
    else -> def
}