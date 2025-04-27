#!/bin/bash

# https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
install_on_ubuntu() {
  sudo apt update
  sudo apt install software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible
}

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/lsb-release ]; then
            install_on_ubuntu
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
esac

echo "Ansible installation complete."
