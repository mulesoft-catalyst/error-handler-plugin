%dw 2.0
output application/json
import * from dw::Runtime
var errorTypes = vars.errorTypes splitBy(',')
var errorCodes = vars.errorCodes splitBy(',')
var errorHttpStatuses = vars.errorHttpStatuses splitBy(',')
var errorDeveloperMessages = vars.errorDeveloperMessages splitBy(',')
var errorMoreInfos = vars.errorMoreInfos splitBy(',')
var errorMessages = vars.errorMessages splitBy(',')
var errorTitles = vars.errorTitles splitBy(',')
---
if ((sizeOf(errorTypes) == sizeOf(errorCodes)) and (sizeOf(errorTypes) == sizeOf(errorMessages)) and (sizeOf(errorTypes) == sizeOf(errorDeveloperMessages)) and (sizeOf(errorTypes) == sizeOf(errorMoreInfos)) and (sizeOf(errorTypes) == sizeOf(errorHttpStatuses)) and (sizeOf(errorTypes) == sizeOf(errorTitles))) (
	
	errorTypes map ((item, index) -> {
    errorType: trim(errorTypes[index]),
    errorCode: trim(errorCodes[index]) default '500',
    errorHttpStatus: trim(errorHttpStatuses[index]) default '500',
    errorDeveloperMessage: trim(errorDeveloperMessages[index]) default 'This was a server error, please review logs',
    errorMoreInfo: trim(errorMoreInfos[index]) default 'Additional Info can be found in logs',
    errorMessage: trim(errorMessages[index]) default 'There was a server error',
    errorTitle: trim(errorTitles[index]) default 'Internal Server Error',
})
)



else fail("Incorrect number of entries for User defined errors")