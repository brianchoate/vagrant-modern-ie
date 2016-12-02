@echo off
set WINRM_EXEC=call %SYSTEMROOT%\System32\winrm
%WINRM_EXEC% quickconfig -q
%WINRM_EXEC% set winrm/config/winrs @{MaxMemoryPerShellMB="300"}
%WINRM_EXEC% set winrm/config @{MaxTimeoutms="1800000"}
%WINRM_EXEC% set winrm/config/client/auth @{Basic="true"}
%WINRM_EXEC% set winrm/config/service @{AllowUnencrypted="true"}
%WINRM_EXEC% set winrm/config/service/auth @{Basic="true"}


@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

chocolatey feature enable -n=allowGlobalConfirmation
choco install GoogleChrome
choco install jre8
choco install firefox
choco install notepadplusplus.install
chocolatey feature disable -n=allowGlobalConfirmation
