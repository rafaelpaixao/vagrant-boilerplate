#!/bin/bash
custom_echo () {
    echo "--------------------------------- $@"
}
install () {
    custom_echo echo "INSTALLING $@"
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq --fix-missing --allow-unauthenticated $@
}

# YOUR CUSTOM SCRIPT TO BE RUN AS VAGRANT