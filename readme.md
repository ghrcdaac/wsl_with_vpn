# How to use  
## Activate on WSL2 side  
download the script inside the WSL2 instance then in the install folder run  
``` 
sudo ./activate_vpn.sh activate <vpn_dns_ip>
``` 
After execution restart the WSL2 instance with "`wsl --shutdown\`" in powershell  

## Disable on WSL2 side
```
sudo ./activate_vpn.sh disable 
```  
After exicution again restart the WSL2 instance with "`wsl --shutdown`" to appy changes  

## Windows side setup  
For some VPN's additional set up on the windows side that is required each time the VPN is connected.  
These setting are reset after each restart or disconnect from the VPN.  
Launch a powershell terminal as administrator and run the command  
```  
Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "<VPN app name>"} | Set-NetIPInterface -InterfaceMetric 6000  
```

## Things to note
WSL2 changes will be persistent between sessions and as a result of enabling the vpn on WSL  
you will not be able to reach the internet without the vpn unless you run the disable command.  
A potential way around this problem is having 2 WSL distros one for use on VPN and one for use  
off VPN

## Where to find DNS ip address
while the vpn is running in  go to 
```
control panel>Network and Internet>Network and Sharing Center>Change adapter setting>VPN connection>Change settings of this connection>Intenet Protocol Version 4>Properties  
```
There you will find a field called '`Preferred DNS server`'.  This is the `<vpn_dns_ip>`