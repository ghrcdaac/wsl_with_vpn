#! /bin/bash

wsl='/etc/wsl.conf'
resolv='/etc/resolv.conf'


function activate {
    sudo rm -f $wsl
    sudo rm -f $resolv
    echo '[network]' | sudo tee $wsl
    echo 'generateResolvConf = false' | sudo tee -a $wsl
    ns='nameserver '
    echo "nameserver $2" | sudo tee $resolv
    chattr +i $resolv
    echo 'VPN configured'
}


function disable {
    cd /etc
    sudo chattr -i resolv.conf
    sudo rm -f $wsl
    sudo rm -f resolv.conf
    sudo touch $wsl
    echo 'VPN disabled'
}


case $1 in

  activate)
    activate $1
    ;;

  disable)
    disable $1
    ;;

  *)
    echo 'Only valid option is activate or disable'
    echo 'To run the script: bash activate_vpn.sh [activate|disable]'
    ;;
esac


