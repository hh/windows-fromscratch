# with this, we can open the iso, and extract the VBoxWindowsAdditions.exe!
# http://downloads.sourceforge.net/sevenzip/7z920.exe
cmd /c certutil -addstore -f "TrustedPublisher" a:oracle-cert.cer
cmd /c e:\VBoxWindowsAdditions-amd64.exe /S
cmd /c shutdown /r /t 0  /f /d p:4:1 /c "Restarting for VBoxWindowsAdditions"
