::Minecraft Server Starter by: alejandroalzatesanchez
::Redistribute, edit, copy, but don't buy/sell and give me the credits
:SOF
setlocal
title Minecraft Server Loader by alejandroalzatesanchez
:Preconfig
::Edit the settings too carefully you only need edit the text before =, example (set var=edit here)
set echo=off
::^Generally uselless but, set to on to make verbose mode enabled, if only need the minecraft's stdout set to off
set server=minecraft_server-1.15.2.jar
::^Establish the minecraft server jar file (minecraft_server-x.xx.x.jar)
set color=f0
::^Establish the command line color (f=white 0=black > white on black)
set dir=~dp
::^Establish the directory where minecraft works, if the batch is in the same directory set to ~dp (~=invocation d=drive p=path 0=the batch file)
set minram=512M
set maxram=1G
::^The amount of ram to minecraft; the minimun is the amount to start the server, if needs more it's expand the amount if gave the maximum is the peak to use from here DON'T expand more, be carefully max use 80% of your
::machine the other 20% is for hardware memory and OS sytem using 80%++ minecraft get slow the machine
::Syntax: G=gigabytes flag, M=Megabytes flag, K=Kilobytes flag, use one of those letters + a number example; 1024M equals 1G
::The memory don't be inverted example max=512m min=1G this crash java
set java=java
::^The java binary generally is java, but if didn't works the defaults path is "C:\Program Files\java\jrex.x.x_xx\bin\javaw.exe" you need find your java binary, if don't find it you need install java from his official site.
:Enviroment config by files
::^if find any especial file its configures the enviroment of batch file.
if exist "batcfg" (
	call ~%dpconfig.bat
	)
if not errorlevel 0 (
	echo "When calling Cfg config batch, maybe the config.bat or .\batcfg\%0cfg\ don't exist."
	)
:load
echo %echo%
cd /d %dir%
color %color%
title %java% -Xms%minram% -Xmx%maxram% -jar %server%
timeout /t 1s > nul
title Loaded. Ram %minram%/%maxram%, Verbose %echo%, Server %server%
%java% -Xms%minram% -Xmx%maxram% -jar %server%
if not errorlevel 0 (
	echo "A fatal error ocurred (Error: %errorlevel%)"
	goto ask
	)
:ask
set ask=y
:EOF
endlocal
exit /b