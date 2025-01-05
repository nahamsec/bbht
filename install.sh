#!/bin/bash

set -e

sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt-get install -y \
    libcurl4-openssl-dev libssl-dev jq ruby-full build-essential \
    libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev \
    libffi-dev python3-dev python3-pip git rename xargs awscli nmap

git clone https://github.com/nahamsec/recon_profile.git
cat recon_profile/bash_profile >> ~/.bash_profile
source ~/.bash_profile

if ! command -v go &> /dev/null; then
    echo "Installing Golang..."
    wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
    sudo tar -xvf go1.23.4.linux-amd64.tar.gz -C /usr/local
    rm go1.23.4.linux-amd64.tar.gz
    echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
    echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile
fi

echo "Don't forget to set up AWS credentials!"

echo "Creating tools directory..."
mkdir -p ~/tools
cd ~/tools

install_tools() {
    echo "Installing $1..."
    git clone "$2"
    cd "$1" || return
    $3
    cd ~/tools || return
    echo "Done installing $1"
}

install_go_tools() {
    echo "Installing $1..."
    go install "$2"@latest
    echo "Done installing $1"
}

sudo snap install chromium

install_tools "aquatone" "https://github.com/michenriksen/aquatone.git" ""
install_tools "JSParser" "https://github.com/nahamsec/JSParser.git" "sudo python3 setup.py install"
install_tools "Sublist3r" "https://github.com/aboul3la/Sublist3r.git" "pip3 install -r requirements.txt"
install_tools "teh_s3_bucketeers" "https://github.com/tomdev/teh_s3_bucketeers.git" ""
install_tools "wpscan" "https://github.com/wpscanteam/wpscan.git" "sudo gem install bundler && bundle install --without test"
install_tools "dirsearch" "https://github.com/maurosoria/dirsearch.git" ""
install_tools "lazys3" "https://github.com/nahamsec/lazys3.git" ""
install_tools "virtual-host-discovery" "https://github.com/jobertabma/virtual-host-discovery.git" ""
install_tools "sqlmap-dev" "https://github.com/sqlmapproject/sqlmap.git" ""
install_tools "knock" "https://github.com/guelfoweb/knock.git" ""
install_tools "lazyrecon" "https://github.com/nahamsec/lazyrecon.git" ""
install_tools "massdns" "https://github.com/blechschmidt/massdns.git" "make"
install_tools "asnlookup" "https://github.com/yassineaboukir/asnlookup.git" "pip3 install -r requirements.txt"
install_tools "crtndstry" "https://github.com/nahamsec/crtndstry.git" ""

install_go_tools "httprobe" "github.com/tomnomnom/httprobe"
install_go_tools "unfurl" "github.com/tomnomnom/unfurl"
install_go_tools "waybackurls" "github.com/tomnomnom/waybackurls"
install_go_tools "dnsx" "github.com/projectdiscovery/dnsx/cmd/dnsx"
install_go_tools "shuffledns" "github.com/projectdiscovery/shuffledns/cmd/shuffledns"
install_go_tools "naabu" "github.com/projectdiscovery/naabu/v2/cmd/naabu"
install_go_tools "mapcidr" "github.com/projectdiscovery/mapcidr/cmd/mapcidr"


echo "Downloading SecLists..."
git clone https://github.com/danielmiessler/SecLists.git
cd SecLists/Discovery/DNS/ || return
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools || return

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"