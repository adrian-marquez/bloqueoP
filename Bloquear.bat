@echo off
DEL C:\Windows\System32\drivers\etc\hosts
COPY C:\Windows\LOCK\hosts C:\Windows\System32\drivers\etc
exit