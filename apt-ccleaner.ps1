# It's ugly, but it is almost usefull
  $link = "https://www.piriform.com/ccleaner/download/standard/";
  
function installer {
  $filen = "C:\cclversion.html"
  $wget = New-Object System.Net.WebClient
  $wget.DownloadFile($link,$filen)
  cd "C:\"
  $finn_version = Select-String -Path C:\cclversion.html -Pattern "ccsetup....exe"""
  $string1 = "$finn_version".TrimStart("        <br />If it doesn't please use this link to <a href=""")
  $string2 = $string1.split('"')[1].split('<')[0]
  $url = $string2
  echo $url;
  $fil = "C:\cclinstall.exe"
  $wget = New-Object System.Net.WebClient
  $wget.DownloadFile($url,$fil);
  cd "C:\"; .\cclinstall.exe /S
}

function avinstaller {cd "C:\Program Files\CCleaner"; .\uninst.exe /S}

function ccleaner {Start-Sleep -s 10; cd "C:\Program Files\CCleaner"; .\CCleaner64.exe /AUTO}

If (Test-Path "C:\Program Files\CCleaner\uninst.exe"){
  avinstaller
  installer
  ccleaner 
  }Else{installer}
