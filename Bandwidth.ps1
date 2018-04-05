while ($true)
{
# Get an object for the network interfaces, excluding any that are currently disabled.
$colInterfaces = Get-WmiObject -class Win32_PerfFormattedData_Tcpip_NetworkInterface |select BytesTotalPersec, CurrentBandwidth,PacketsPersec|where {$_.PacketsPersec -gt 0}   

   foreach ($interface in $colInterfaces) {
      $totalBytes = $interface.BytesTotalPersec
      $totalKiloBytes = $totalBytes / 1000
      $totalMegaBytes = $totalKiloBytes / 1024

      #if ($totalBits -gt 0) {
         cls
         Write-Host $totalBytes " B/s"
         Write-Host $totalKiloBytes " KB/s"
         Write-Host $totalMegaBytes " MB/s"
         Start-Sleep -m 250
      #}
   }
}
