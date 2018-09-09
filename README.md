# powershell-nginx
Powershell scripts for nginx

InstallNginx.ps1 will download nginx 1.15.3, extract it and move it to c:\nginx.

The version of nginx that gets installed can be changed by editing the powershell variable `$version`
```
$version = '1.15.3'
```

This code is provided as is with no warranty whatsoever. Use at your own risk.