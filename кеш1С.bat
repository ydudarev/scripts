set cache_dir="%userprofile%\Application Data\1c\1Cv82"
FOR /D %%i IN (%cache_dir%\*) DO rd /s /q "%%i"
set cache_dir="%userprofile%\Local Settings\Application Data\1c\1Cv82"
FOR /D %%i IN (%cache_dir%\*) DO rd /s /q "%%i"
