# It's ugly, but it is almost usefull
  $link = "http://get.videolan.org/vlc/last/win64/";
  $link2 = "http://ftp.free.org/mirrors/videolan/vlc/last/win64/";
  
function installer {
  $filen = "C:\vlcversion.html"
  $wget = New-Object System.Net.WebClient
  $wget.DownloadFile($link,$filen)
  cd "C:\"
  $finn_version = Select-String -Path C:\vlcversion.html -Pattern "vlc-.....-win64.exe"""
  $string1 = "$finn_version".TrimStart("C:\vlcversion.html:10:<a href=")
  $string2 = $string1.split('"')[1].split('<')[0]
  $url = $link2 + $string2
  echo $url;
  $fil = "C:\vlcinstall.exe"
  $wget = New-Object System.Net.WebClient
  $wget.DownloadFile($url,$fil);
  cd "C:\"; .\vlcinstall.exe /S
}

function avinstaller {
  cd "C:\Program Files\VideoLAN\VLC\"; .\uninstall.exe /S
}

If (Test-Path "C:\Program Files\VideoLAN\VLC\uninstall.exe"){
  avinstaller
  installer
  }Else{installer}
