%dw 2.0
output application/json
import * from dw::Runtime
var errorTypes = vars.errorTypes splitBy(',')
var errorCodes = vars.errorCodes splitBy(',')
var errorMessages = vars.errorMessages splitBy(',')
---
if ((sizeOf(errorTypes) == sizeOf(errorCodes)) and (sizeOf(errorTypes) == sizeOf(errorMessages))) (
	
	errorTypes map ((item, index) -> {
    errorType: trim(errorTypes[index]),
    errorCode: trim(errorCodes[index]) default '500',
    errorMessage: trim(errorMessages[index]) default 'There was a server error'
})
)



else fail("Incorrect number of entries for User defined errors")