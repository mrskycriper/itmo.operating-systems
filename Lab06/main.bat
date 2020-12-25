sc query type=service state=all > service.txt
sc stop XboxNetApiSvc
timeout /t 5
sc query type=service state=all > buffer.txt
sc start XboxNetApiSvc
support.bat
