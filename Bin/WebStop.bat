@Echo off

Rem find & stop service
For %%i in (mysqld php-cgi nginx) do Tasklist | Findstr /i %%i.exe && Taskkill /f /im %%i.exe

Rem close cmd window
Exit
