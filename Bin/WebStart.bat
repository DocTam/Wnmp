@Echo off
SetLocal EnableDelayedExpansion
Title Windows ������ MySql PHP Nginx By DocTam��������·��

Rem
Rem ���ߣ�DocTam��������·��
Rem �汾��1.0.1��20180429��
Rem ���ܣ�Windows ������ MySql PHP Nginx��Windows XP/2003 ϵͳ�����֧�ְ汾Ϊ mysql-5.6.20 php-5.4.31 phpmyadmin-4.2.7��
Rem ���������ű����ܼ�����л�����VC��MySql��PHP��Nginx����
Rem       PHP�˿��޸�Ϊ 8999�����г�ͻ���ֶ����ĺ��ʶ˿ڣ���
Rem       �Ķ��ط���������
Rem       1.  ���ű��� 127.0.0.1:8999
Rem       2.  �ļ� nginx\�汾��\config\conf.d\web.conf �� 127.0.0.1:8999
Rem

Pushd %~Dp0
For %%R in (
  Set_Var
  Conf_Run
  Create_Lnk
) do (
  Set Run_Value=%%R
  If "!Run_Value:~0,2!" Neq "::" (
    Rem Echo %%R&Pause
    Call :%%R
  )
)
Rem Pause
Exit

Goto :Eof
:Set_Var
Set Wnmp_Dir=%~Dp0
For %%i in ("%Wnmp_Dir:~0,-1%") do (
  Set Wnmp_Dir=%%~Dpi
  If Not Exist !Wnmp_Dir!Tmp Md !Wnmp_Dir!Tmp
)

Goto :Eof
:Conf_Run
For %%i in (
  WebStop.Bat
  VC15_redist.x86.Exe
  Mysqld.Exe
  Php-cgi.Exe
  Nginx.Exe
) do (
  Set Switch=
  For /f "delims=" %%I in ('Where /R !Wnmp_Dir! %%i') do (
    Echo !PATH! | Find /i "%%~DpI" || Set PATH=!PATH!;%%~DpI
    If /i %%i Equ WebStop.Bat (
      Set Switch=TurnOn
      Start /Wait /Min %%i
    )
    If /i %%i Equ VC15_redist.x86.Exe (
      Set Switch=TurnOn
      Call :VC_Run %%i
    )
    If /i %%i Equ php-cgi.Exe (
      Set Php_Ini=%%~DpIphp.ini
      Call :Php_Run "!Php_Ini!"
      Set Parms=-c !Php_Ini! -b 127.0.0.1:8999
    )
    If /i %%i Equ nginx.Exe (
      Call :Nginx_Run "%%I"
      Set Parms=-p %%~DpI
    )
    Rem If Not Defined Switch Hiderun.exe %%i !Parms!
    If Not Defined Switch Hiderun.exe %%i !Parms!
  )
)

Goto :Eof
:VC_Run
Rem  {B175520C-86A2-35A7-8619-86DC379688B9}@VC14_redist.x86.exe
For %%I in (
  {B175520C-86A2-35A7-8619-86DC379688B9}@VC11_redist.x86.exe
  {895D5198-C5DB-375E-86AB-133F4DAA9FE2}@%1
) do (
  For /f "tokens=1-2 delims=@" %%i in ('Echo %%I') do (
    Reg Query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%%i" | FindStr /i "Visual C++" || %%j/install /passive /norestart
  )
)

Goto :Eof
:Php_Run
For %%i in (%1) do (
  Rem Del /f /q /s %1
  If Not Exist %1 (
    Copy /y "%%~Fi-development" %1
    Set extension_dir=%%~DpiExt\
    Set extension_dir=!extension_dir:\=/!
    Set sys_temp_dir=!Wnmp_Dir!Tmp
    Set sys_temp_dir=!sys_temp_dir:\=/!
    NirCmd inisetval %1 "PHP" "max_execution_time" "300"
    NirCmd inisetval %1 "PHP" "max_input_time" "600"
    NirCmd inisetval %1 "PHP" "extension_dir" "!extension_dir!"
    NirCmd inisetval %1 "PHP" "sys_temp_dir" "!sys_temp_dir!"
    NirCmd inisetval %1 "PHP" "upload_max_filesize" "2000M"
    NirCmd inisetval %1 "Date" "date.timezone" "Asia/Shanghai"
    NirCmd inisetval %1 "Session" "session.save_path" "!sys_temp_dir!"
    For %%I in (
      extension=php_mbstring.dll
      extension=php_mysqli.dll
    ) do (
      Wfr %1 -fic:";%%I" -t:"%%I"
    ) 
  )
)

Goto :Eof
:Nginx_Run
For %%i in (%1) do (
  If Not Exist "%%~Dpiconf\conf.d" (
    Set Nginx_Conf=%%~Dpi
    Set Nginx_Conf=!Nginx_Conf:\=/!
    For %%j in ("!Nginx_Conf:~0,-1!") do (
      Echo A | XCopy /E /G /H /Y "%%~Dpjconfig\*" "%%~Dpiconf\"
    )
    Wfr "%%~Dpiconf\%%~Ni.conf" -fic:"C:/server/nginx/" -t:"!Nginx_Conf!"
    Set Document_Root=!Wnmp_Dir!Web
    Set Document_Root=!Document_Root:\=/!
    Set Wnmp_Dir=!Wnmp_Dir:\=/!
    For %%I in (
      "%%~Dpiconf\conf.d\web.conf"
      "%%~Dpiconf\conf.d\example.conf"
      "%%~Dpiconf\conf.d\phpmyadmin.conf"
    ) do (
      Wfr %%I -fic:"C:/WEB" -t:"!Document_Root!"
      Wfr %%I -fic:"C:/server/" -t:"!Wnmp_Dir!"
    )   
  )
)

Goto :Eof
:Create_Lnk
NirCmd shortcut "%~F0" "!Wnmp_Dir!" "Wnmp_Start" "" "!Wnmp_Dir!Icon\icon_start.ico" "" "min" "" ""
NirCmd shortcut "%~Dp0WebStop.bat" "!Wnmp_Dir!" "Wnmp_Stop" "" "!Wnmp_Dir!Icon\icon_stop.ico" "" "min" "" ""