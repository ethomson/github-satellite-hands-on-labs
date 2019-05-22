
#--- Enable command extensions for cmd.exe ---
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Command Processor" -Name EnableExtensions -Value 1
#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1
