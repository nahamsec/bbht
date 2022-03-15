#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt install -y libpcap-dev

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"



#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"

# Installing nuclei
echo "Installing Nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "Done"

# Installing Subfinder 
echo "Installing Subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "Done"

# Installing Naabu
echo "Installing Naabu"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
echo "Done"

# Intsall DNSx
echo "Installing dnsx"
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
echo "Done"

# Installing Shuffledns
echo "Install Shuffledns"
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
echo "Done"

# Installing Interactsh
echo "Installing Interactsh"
go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
echo "Done"

# Installing HTTPx
echo "Installing HTTPx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "Done"

# Installing Notify
echo "Installing Notify"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
echo "Done"

# Installing Mapcidr
echo "Installing mapcidr"
GO111MODULE=on go get -v github.com/projectdiscovery/mapcidr/cmd/mapcidr
echo "Done"

# Installing chaos-client
echo "Installing chaos-client"
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
echo "Done"

# Installing Uncover
echo "Installing Uncover"
go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
echo "Done"

# Install hakrevdns
echo "Installing Hakrevdns"
go install github.com/hakluke/hakrevdns@latest
echo "Done"

# Install hakrawler
echo "Installing hakrawler"
go install github.com/hakluke/hakrawler@latest
echo "Done"

# Install haktldextract
echo "Installing haktldextract"
go install github.com/hakluke/haktldextract@latest
echo "Done"

# Install hakcheckurl
echo "Installing hakcheckurl"
go install github.com/hakluke/hakcheckurl@latest
echo "Done"

# Install hakfindinternaldomains
echo "Install hakfindinternaldomains"
go install github.com/hakluke/hakfindinternaldomains
echo "Done"

# Install haktrails
echo "Install haktrails"
go install -v github.com/hakluke/haktrails@latest
echo "Done"

# Install haklistgen
echo "Install haklistgen"
go install github.com/hakluke/haklistgen@latest
echo "Done"

# Install hakcsp 
echo "Installing hakcsp"
go get github.com/hakluke/hakcsp
echo "Done"

# Install hakurlencode
echo "Installing hakurlencode"
go get github.com/hakluke/hakurlencode
echo "Done"

# Install hakgzsplit
echo "Installing hakgzsplit"
go get -u github.com/hakluke/hakgzsplit
echo "Done"

# Install hakaxfr
echo "Installing hakaxfr"
go install github.com/hakluke/hakaxfr@latest
echo "Done"

# Install hakcron
echo "Installing hakcron"
go install github.com/hakluke/hakcron@latest
echo "Done"

# Install gau
echo "Installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest
echo "Done"

# Install subjs
echo "Installing gau"
GO111MODULE=on go get -u -v github.com/lc/subjs@latest
echo "Done"

# Install ffuf
echo "Installing ffuf"
go install github.com/ffuf/ffuf@latest
echo "Done"

# Install secretz
echo "Installing secretz"
go get -u github.com/lc/secretz
echo "Done"

# Install brute53
echo "Installing brute53"
go get -u github.com/lc/brute53
echo "Done"

# Install otxurls
echo "Installing otxurls"
go get github.com/lc/otxurls
echo "Done"

# 
