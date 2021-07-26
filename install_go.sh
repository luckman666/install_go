#!/bin/bash

go_version="1.16.2.linux-amd64"
install_path="/opt/go"
# download golang on studygolang mirror
wget -c -t 0 -T 1200 https://studygolang.com/dl/golang/go${go_version}.tar.gz

tar zxvf go${go_version}.tar.gz

mv go $install_path

if cat ~/.bash_profile | grep 'export GOROOT=' >>/dev/null 2>&1; then
    echo "GOROOT is $GOROOT now"
    echo -e "if you want to change it ,run command :\n"
    echo "export GOROOT=${install_path} >>~/.bash_profile"
    echo "export GOPATH=${HOME}/gopath >>~/.bash_profile"
    echo "export PATH=\${GOROOT}/bin:\${GOPATH}/bin:\$PATH >>~/.bash_profile"
else
    # set environment
    echo "export GOROOT=${install_path}" >>~/.bash_profile
    echo "export GOPATH=${HOME}/gopath" >>~/.bash_profile
    echo "export PATH=\${GOROOT}/bin:\${GOPATH}/bin:\$PATH" >>~/.bash_profile
fi
# source the env setting
source ~/.bash_profile

# set go mod
go env -w GO111MODULE=on
# set go mod proxy
go env -w GOPROXY=https://goproxy.cn,direct
# show version
go version

echo "You need run \" source ~/.bash_profile \" again !"
