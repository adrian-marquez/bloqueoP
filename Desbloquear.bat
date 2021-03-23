@echo off
DEL C:\Windows\System32\drivers\etc\hosts /y
COPY %~d0\UNLOCK\hosts C:\Windows\System32\drivers\etc\ /y
exit