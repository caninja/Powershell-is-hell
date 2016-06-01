
# It's ugly, but it is almost usefull
$url2 = "http://www.7-zip.org/download.html"
$link = "http://www.7-zip.org/a"

function installer {
  $filen = "C:\7zipversion.html"
  $wget = New-Object System.Net.WebClient
  $wget.DownloadFile($url2,$filen)
  cd "C:\"  
  $finn_version = Select-String -Path C:\7zipversion.html -Pattern "a/7z....-x64.exe"
  $string1 = "$finn_version".TrimEnd("""download</A></TD>")
  $string2 = "$string1".TrimStart("C:\7zipversion.html:63:    <TD class=""Item"" align=""center""><A href=""")
  $url = $link + $string2
  echo $url;
  $fil = "C:\7zipfil.exe"
  $wget = New-Object System.Net.WebClient
  $wget.DownloadFile($url,$fil);
  cd "C:\"; .\7zipfil.exe /S
  slettbrask
}
function avinstaller {
  cd "C:\Program Files\7-Zip\"; .\Uninstall.exe /S
}
function slettbrask {
  cd "C:\";
  If (Test-Path "C:\7zipversion.html"){
  Remove-Item C:\7zipversion.html
  }Else{ }
}

If (Test-Path "C:\Program Files\7-Zip\Uninstall.exe"){
  avinstaller
  installer
}Else{ installer }
