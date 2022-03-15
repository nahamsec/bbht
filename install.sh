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
sudo apt install -y cargo
sudo apt install -y make

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

# Installing Osmedeus
echo "Installing Osmedeus"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/osmedeus/osmedeus-base/master/install.sh)"
echo "Done"

# Install Metabigor
echo "Installing metabigor"
GO111MODULE=on go get github.com/j3ssie/metabigor
echo "Done"

# Install cinfo
echo "Installing Cinfo"
GO111MODULE=on go get -u github.com/j3ssie/cinfo
echo "Done"

# Install dalfox
echo "Installing Dalfox"
go install github.com/hahwul/dalfox/v2@latest
echo "Done"

# Install Web-Cache-Vulnerability-Scanner
echo "Installing Web-Cache-Vulnerability-Scanner"
go install -v github.com/Hackmanit/Web-Cache-Vulnerability-Scanner@latest
echo "Done"

# Install gitls
echo "Installing gitls"
GO111MODULE=on go get -v github.com/hahwul/gitls
echo "Done"

# Install Licaner
echo "Installing Licaner"
go install github.com/hahwul/licaner@latest
echo "Done"

# Install URLhunter
echo "Installing URLHunter"
go get -u github.com/utkusen/urlhunter
echo "Done"

# Install puredns
echo "Installing puredns"
go install github.com/d3mondev/puredns/v2@latest
echo "Done"

# Install wadl-dumper
echo "Installing wadl-dumper"
go get github.com/dwisiswant0/wadl-dumper
echo "Done"

# Install crlfuzz
echo "Installing crlfuzz"
GO111MODULE=on go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
echo "Done"

# Install Galer
echo "Installing galer"
GO111MODULE=on go get github.com/dwisiswant0/galer
echo "Done"

# Install go-stare
echo "Installing go-stare"
GO111MODULE=on go get -v github.com/dwisiswant0/go-stare
echo "Done"

# Install findom-xss
echo "Installing findom-xss"
wget https://raw.githubusercontent.com/dwisiswant0/findom-xss/master/findom-xss.sh
chmod +x findom-xss.sh
mv findom-xss.sh /usr/bin/findomxss
echo "Done"

# Install tlder
echo "Installing Tlder"
go install github.com/dwisiswant0/tlder@latest
echo "done"

# Install go-dork
echo "Installing go-dork"
GO111MODULE=on go install dw1.io/go-dork@latest
echo "done"

# Install subzy
echo "Installing subzy"
go get -u -v github.com/lukasikic/subzy
go install -v github.com/lukasikic/subzy@latest
echo "done"

# Install cariddi
echo "Installing cariddi"
git clone https://github.com/edoardottt/cariddi.git
cd cariddi
make linux
rm -rf ../cariddi
echo "Done"

# Install bbscope
echo "Installing bbscope"
go install github.com/edoardottt/lit-bb-hack-tools/bbscope@latest
echo "Done"

# Install bbtargets
echo "Installing bbtargets"
go install github.com/edoardottt/lit-bb-hack-tools/bbtargets@latest
echo "Done"

# Install doomxss
echo "Installing doomxss"
go install github.com/edoardottt/lit-bb-hack-tools/doomxss@latest
echo "Done"

# Install eefjsf
echo "Installing eefjsf"
go install github.com/edoardottt/lit-bb-hack-tools/eefjsf@latest
echo "Done"

# Install robotstxt
echo "Installing robots.txt"
go install github.com/edoardottt/lit-bb-hack-tools/robotstxt@latest
echo "Done"

# Install proxyfor
echo "Installing proxyfor"
go install github.com/0xsha/ProxyFor@latest
echo "Done"

# Install getJS
echo "Installing getJS"
go get github.com/003random/getJS
echo "Done"

# Install ppmap
echo "Installing ppmap
go install github.com/kleiton0x00/ppmap@latest
echo "Done"

# Install Gxss
echo "Installing Gxss"
go install github.com/KathanP19/Gxss@latest
echo "Done"

# Install cent
echo "Installing cent"
GO111MODULE=on go get -u github.com/xm1k3/cent
echo "Done"

# Install asnip
echo "Installing asnip"
go get -u github.com/harleo/asnip
echo "Done"

# Install knocknock
echo "Installing knocknock"
go get -u github.com/harleo/asnip
echo "Done"

# Install gotator 
echo "Installing gotator"
go get github.com/Josue87/gotator
echo "Done"

# Install sigurlfind3r
echo "Installing sigurlfind3r"
go install -v github.com/signedsecurity/sigurlfind3r/cmd/sigurlfind3r@latest
echo "Done"

# Install wordlistgen
echo "Installing wordlistgen"
go get -u github.com/ameenmaali/wordlistgen
echo "Done"

# Install jsubfinder
echo "Installing jsubfinder"
go install github.com/hiddengearz/jsubfinder@latest
echo "Done"

# Install PostmessageFinder
echo "Installing postmessageFinder"
go get github.com/pelaohxc/postMessageFinder
echo "Done"

# Install roboxtractor
echo "Installing roboxtractor"
go get -u github.com/Josue87/roboxtractor
echo "Done"

# Install fdns-search
echo "Installing fdns-search"
go install github.com/nscuro/fdnssearch/cmd/fdnssearch@latest
echo "Done"

# Install sshchecker
echo "Installing sshchecker"
go get -u -v github.com/lazytools/sshchecker/cmd/sshchecker
echo "Done"

# Install xurls
echo "Installing xurls"
go get -u github.com/vsec7/xurls
echo "Done"

# Install gctsubdomains
echo "Installing gctsubdomains"
go get github.com/lord3ver/gctsubdomains
echo "Done"

# Install redirex
echo "Installing redirex"
go install github.com/wfinn/redirex@latest
echo "Done"

# Install nicloud
echo "Installing nicloud"
go get github.com/i5nipe/nicloud
echo "Done"

# Install Meg
echo "Installing Meg"
go get -u github.com/tomnomnom/meg
echo "Done"

# Install waybackurls
echo "Installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "Done"

# Install Gf
echo "Installing gf"
go get -u github.com/tomnomnom/gf
echo "Done"

# Install httprobe
echo "Installing httprobe"
go get -u github.com/tomnomnom/httprobe
echo "Done"

# Install anew
echo "Installing anew"
go get -u github.com/tomnomnom/anew
echo "Done"

# Install assetfinder 
echo "Installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
echo "Done"

# Install qsreplace
echo "Installing qsreplace"
go get -u github.com/tomnomnom/qsreplace
echo "Done"

# Install fff
echo "Installing fff"
go get -u github.com/tomnomnom/fff
echo "Done"

echo "Installing Python tools"

mkdir ~/tools
cd ~/tools

# Install dirsearch
echo "Installing dirsearch"
git clone https://github.com/maurosoria/dirsearch
cd dirsearch
pip3 install -r requirements.txt
cd ~/tools
echo "Done"

# Install Paramspider
echo "Installing Paramspider"
git clone https://github.com/devanshbatham/ParamSpider
cd Paramspider 
pip3 install -r requirements.txt
cd ~/tools
echo "Done"

# Install VhostScan
echo "Installing VHostScan"
git clone https://github.com/codingo/VHostScan
cd VHostScan
python3 setup.py install
cd ~/tools
echo "Done"

# Install Censys-subdomain-finder
echo "Installing Censys-subdomain-finder"
git clone https://github.com/christophetd/censys-subdomain-finder
cd censys-subdomain-finder
pip3 install -r requirements.txt
cd ~/tools
echo "Done"

# Install GitRob
echo "Installing Gitrob"
git clone https://github.com/hisxo/gitGraber
cd gitGraber
pip3 install -r requirements.txt
cd ~/tools
echo "Done"

# Install apkleaks
echo "Installing APKleaks"
pip3 install apkleaks
echo "Done"

# Install dora
echo "Install Dora"
pip3 install dora
echo "Done"



