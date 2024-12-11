#!/bin/bash

# Update system and install dependencies
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y libcurl4-openssl-dev libssl-dev jq ruby-full libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev libffi-dev python3-dev python3-pip git rename xargs awscli nmap snapd

# Install Go
if ! command -v go &> /dev/null; then
    echo "Installing Go..."
    wget https://dl.google.com/go/go1.21.0.linux-amd64.tar.gz
    sudo tar -xvf go1.21.0.linux-amd64.tar.gz
    sudo mv go /usr/local/bin/go
    sudo chmod +x /usr/local/bin/go
    export GOROOT=/usr/local/bin/go
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    echo 'export GOROOT=/usr/local/bin/go' >> ~/.bashrc
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
    rm go1.21.0.linux-amd64.tar.gz
    echo "Go installed."
fi

# Create tools directory
mkdir -p ~/tools
cd ~/tools

# Install tools
install_tool() {
    local name=$1
    local repo=$2
    echo "Installing $name..."
    if [ ! -d "$name" ]; then
        git clone $repo
        echo "$name installed."
    else
        echo "$name is already installed."
    fi
}

install_tool "Aquatone" "https://github.com/michenriksen/aquatone.git"
install_tool "JSParser" "https://github.com/nahamsec/JSParser.git"
cd JSParser && python3 -m venv env && source env/bin/activate && sudo python3 setup.py install && deactivate && cd ~/tools

install_tool "Sublist3r" "https://github.com/aboul3la/Sublist3r.git"
cd Sublist3r && python3 -m venv env && source env/bin/activate && pip install -r requirements.txt && deactivate && cd ~/tools

install_tool "wpscan" "https://github.com/wpscanteam/wpscan.git"
cd wpscan && sudo gem install bundler && bundle install --without test && cd ~/tools

install_tool "dirsearch" "https://github.com/maurosoria/dirsearch.git"
install_tool "lazys3" "https://github.com/nahamsec/lazys3.git"
install_tool "virtual host discovery" "https://github.com/jobertabma/virtual-host-discovery.git"
install_tool "sqlmap" "https://github.com/sqlmapproject/sqlmap.git"
install_tool "knock.py" "https://github.com/guelfoweb/knock.git"
install_tool "lazyrecon" "https://github.com/nahamsec/lazyrecon.git"
install_tool "massdns" "https://github.com/blechschmidt/massdns.git"
cd massdns && make && cd ~/tools

install_tool "asnlookup" "https://github.com/yassineaboukir/asnlookup.git"
cd asnlookup && python3 -m venv env && source env/bin/activate && pip install -r requirements.txt && deactivate && cd ~/tools

# Install Go-based tools
if ! command -v httprobe &> /dev/null; then
    go install github.com/tomnomnom/httprobe@latest
    echo "httprobe installed."
else
    echo "httprobe is already installed."
fi

if ! command -v unfurl &> /dev/null; then
    go install github.com/tomnomnom/unfurl@latest
    echo "unfurl installed."
else
    echo "unfurl is already installed."
fi

if ! command -v waybackurls &> /dev/null; then
    go install github.com/tomnomnom/waybackurls@latest
    echo "waybackurls installed."
else
    echo "waybackurls is already installed."
fi

install_tool "crtndstry" "https://github.com/nahamsec/crtndstry.git"

# Download Seclists
echo "Downloading SecLists..."
if [ ! -d "SecLists" ]; then
    git clone https://github.com/danielmiessler/SecLists.git
    cd SecLists/Discovery/DNS
    sed '$d' dns-Jhaddix.txt > clean-jhaddix-dns.txt
    cd ~/tools
else
    echo "SecLists is already downloaded."
fi

# Install Chromium
if ! command -v chromium &> /dev/null; then
    sudo snap install chromium
    echo "Chromium installed."
else
    echo "Chromium is already installed."
fi

# Completion message
echo -e "\n\nSetup completed! Tools are installed in ~/tools."
echo "Don't forget to set up AWS credentials in ~/.aws/!"
