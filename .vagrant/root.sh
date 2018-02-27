#!/bin/bash
custom_echo () {
    echo "--------------------------------- $@"
}
install () {
    custom_echo echo "INSTALLING $@"
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq --fix-missing --allow-unauthenticated $@
}
update () {
    custom_echo "SYSTEM UPDATE"
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y update;
}
upgrade () {
    custom_echo " SYSTEM UPGRADE"
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
}

# YOUR CUSTOM SCRIPT TO BE RUN AS ROOT