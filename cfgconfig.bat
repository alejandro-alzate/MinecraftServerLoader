::Cfg api by alejandroalzatesanchez
if exist "cfgconfig" (
	cd cfgconfig
	) else (
	Echo "Fatal: No config directory found!" & echo "Remember: this batch need be started on root where 'cfgconfig' are."
	set errorlevel=404 Not found
	)
if not errorlevel 0 (
	"Fatal: Unknown fail (Error: %errorlevel%)" 
	exit /b
	)