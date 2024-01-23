%dw 2.0

/*
 NOTICE:
    This file must be in the ./resources/<module name> folder in order to be exported in the META-INF/mule-artifact/mule-artifact.json file.  This allows the functions to be used in the module as they are executed in the app's context (without the mule message context).
 */

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

/**
 * Converts a value to a String representation.
 * Binary is converted as-is to Strings since it must be read to get content.
 * Primitives are directly converted to Strings.
 * Complex objects, like Objects and Arrays, are converted to the String presentation of their Java form.
 * 
 * @p value to convert.
 * @p def is the default value if the provided value is empty.
 * @r String.  If empty, then returns the default value provided
 */
fun toString(value, def="") = do {
    var safeValue = if (!isEmpty(value)) value else def default ""  // No nulls allowed
    ---
    typeOf(safeValue) match {
        case "String" -> safeValue
        case "Number" -> safeValue as String
        case "Binary" -> read(safeValue, "text/plain")  
        else -> write(safeValue, "application/java")
    }
}
