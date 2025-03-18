@echo off
title PortScanner

:mainmenu
color 6
title PortScanner
cls
echo  ----------------------------------
echo          Ports Scanner Tool   
echo  ----------------------------------
timeout /t 2 /NOBREAK > nul
cls
echo  ----------------------------------
echo     [~] 1.Domain Lookup
echo     [~] 2.Port Scanner
echo     [~] 3.Sub Domains Scanner
echo  ----------------------------------
set /p okay=root$portscanner-[~]:
if %okay%==1 goto domainlookup
if %okay%==2 goto portscanner
if %okay%==3 goto subdscanner
goto nonoption
cls

:domainlookup
cls
echo  ----------------------------------
echo    [+] Domain Lookup
echo  ----------------------------------
echo.
echo  Type the domain you want to scan
echo  [~] 2.Main Menu
echo.
set /p domain=Type the domain:
cls
curl -s https://api.hackertarget.com/dnslookup/?q=%domain%
if %domain%==2 goto mainmenu
echo.
echo.
echo  [~] 1.Lookup Another Domain
echo  [~] 2.Main Menu
echo.
set /p backtomm2=root$portscanner-[~]:
if %backtomm2%==1 goto domainlookup
if %backtomm2%==2 goto mainmenu
goto nonoption
cls

:portscanner
cls
echo  ----------------------------------
echo    [+] Port Scanner
echo  ----------------------------------
echo.
echo  [~] 1.Nmap Scan
echo  [~] 2.Main Menu
echo.
echo.
echo  Nmap must be installed on your device or the scanner wont work
echo  Download Nmap from official website: https://nmap.org/download
echo.
set /p choosemode=root$portscanner-[~]:
if %choosemode%==1 goto nmapscan
if %choosemode%==2 goto mainmenu
goto nonoption
cls

:nmapscan
cls
echo.
set /p IP1=Enter your IP:
echo.
set /P PORTS1=Enter your ports:
echo.
nmap -p %PORTS1% -T5 -v -A -Pn %IP1%
echo.
echo  1.Scan Another IP
echo  2.Main Menu
echo.
set /p backtommns=root$portscanner-[~]:
if %backtommns%==1 goto nmapscan
if %backtommns%==2 goto mainmenu
goto nonoption
cls

:subdscanner
cls
echo  ----------------------------------
echo    [+] Sub Domains Scanner
echo  ----------------------------------
echo.
echo  Enter the domain to start scanning
echo  [~] 2.Main Menu
echo.
set /p glue=Enter the domain:
if %glue%==2 goto mainmenu
echo.
echo Scanning for sub domains started...
echo.
PING -n 5 .%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x10
)
echo Subdomain found: dev.%glue% && ping dev.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x10
:x10
PING -n 5 test.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x11
)
echo Subdomain found: test.%glue% && ping test.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x11
:x11
PING -n 5 ovh.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x12
)
echo Subdomain found: ovh.%glue% && ping ovh.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x12
:x12
PING -n 5 staff.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x13
)
echo Subdomain found: staff.%glue% && ping staff.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x13
:x13
PING -n 5 jogar.%glue% | FIND "TTL" > nul
if errorlevel 0 (
   goto x14
)
echo Subdomain found: jogar.%glue% && ping jogar.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x14
:x14
PING -n 5 play.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x15
)
echo Subdomain found: play.%glue% && ping play.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x15
:x15
PING -n 5 mc.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x16
)
echo Subdomain found: mc.%glue% && ping mc.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x16
:x16
PING -n 5 www.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x17
)
echo Subdomain found: www.%glue% && ping www.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x17
:x17
PING -n 5 build.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x18
)
echo Subdomain found: build.%glue% && ping build.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x18
:x18
PING -n 5 store.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x19
)
echo Subdomain found: store.%glue% && ping store.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x19
:x19
PING -n 5 na.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x20
)
echo Subdomain found: na.%glue% && ping na.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x20
:x20
PING -n 5 as.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x21
)
echo Subdomain found: as.%glue% && ping as.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x21
:x21
PING -n 5 eu.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x22
)
echo Subdomain found: eu.%glue% && ping eu.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x22
:x22
PING -n 5 node01.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x23
)
echo Subdomain found: node01.%glue% && ping node01.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x23
:x23
PING -n 5 node02.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x24
)
echo Subdomain found: node02.%glue% && ping node02.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x24
:x24
PING -n 5 node03.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x25
)
echo Subdomain found: node03.%glue% && ping node03.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x25
:x25
PING -n 5 node04.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x26
)
echo Subdomain found: node04.%glue% && ping node04.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x26
:x26
PING -n 5 node05.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x27
)
echo Subdomain found: node05.%glue% && ping node05.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x27
:x27
ping -l 100 vote.%glue% > nul
if errorlevel 1 (
   goto x28
)
echo Subdomain found: vote.%glue% && ping vote.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x28
:x28
PING -n 5 vote1.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x29
)
echo Subdomain found: vote1.%glue% && ping vote1.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x29
:x29
PING -n 5 vote2.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x30
)
echo Subdomain found: vote2.%glue% && ping vote2.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x30
:x30
PING -n 5 vote3.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x31
)
echo Subdomain found: vote3.%glue% && ping vote3.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x31
:x31
PING -n 5 vote4.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x32
)
echo Subdomain found: vote4.%glue% && ping vote4.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x32
:x32
PING -n 5 vote5.%glue% | FIND "TTL" > nul
if errorlevel 1 (
   goto x33
)
echo Subdomain found: vote5.%glue% && ping vote5.%glue% | for /f "skip=3 tokens=*" %%a in ('findstr Reply') do @echo %%a && echo. && goto x33
:x33
echo.
echo Scan finished.
echo Press enter to continue.
pause>nul
cls
echo.
echo  [~] 1.Scan Another Domain
echo  [~] 2.Main Menu
echo.
set /p nbo=root$portscanner-[~]:
if %nbo%==1 goto subdscanner
if %nbo%==2 goto mainmenu
goto nonoption
cls

:nonoption
cls
echo.
echo  This option doesn't exist!
echo.
timeout /t 3 /NOBREAK > nul
goto mainmenu