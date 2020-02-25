%dw 2.0
output application/json
import * from dw::Runtime
var errorTypes = vars.errorTypes splitBy(',')
var errorCodes = vars.errorCodes splitBy(',')
var errorMessages = vars.errorMessages splitBy(',')
var errorTitles = vars.errorTitles splitBy(',')
---
if ((sizeOf(errorTypes) == sizeOf(errorCodes)) and (sizeOf(errorTypes) == sizeOf(errorMessages)) and (sizeOf(errorTypes) == sizeOf(errorTitles))) (
	
	errorTypes map ((item, index) -> {
    errorType: trim(errorTypes[index]),
    errorCode: trim(errorCodes[index]) default '500',
    errorMessage: trim(errorMessages[index]) default 'There was a server error',
    errorTitle: trim(errorTitles[index]) default 'Internal Server Error',
})
)



else fail("Incorrect number of entries for User defined errors")