'*******************************************************************************************'
'                                                                                           '
' Get API Key https://app.pdf.co/signup                                                     '
' API Documentation: https://developer.pdf.co/api/index.html                                '
'                                                                                           '
' Note: Replace placeholder values in the code with your API Key                            '
' and file paths (if applicable)                                                            '
'                                                                      '
'*******************************************************************************************'


if (WScript.Arguments.Count < 1) Then

	MsgBox "Run with the file name as the argument" & vbCRLF & vbCRLF & "ReadGS1_128.vbs <InputFileName>"
 	WScript.Quit 0
End If

WScript.Echo "Reading barcode(s) from image " & WScript.Arguments(0)

Set reader = CreateObject("Bytescout.BarCodeReader.Reader")

reader.RegistrationName = "demo"
reader.RegistrationKey = "demo"

' Set barcode type to find
' "GS1-128" barcode type is subset of "Code 128"
reader.BarcodeTypesToFind.GS1 = True

reader.ReadFromFile WScript.Arguments(0)

For i = 0 To reader.FoundCount - 1 

	' Write to console
	WScript.Echo "Found barcode with type '" & reader.GetFoundBarcodeType(i) & "' and value '" & reader.GetFoundBarcodeValue(i) & "'"
Next

' Cleanup
Set reader = Nothing
