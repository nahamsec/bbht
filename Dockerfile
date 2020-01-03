FROM ubuntu:18.04
ENV go_ver 1.13.4

LABEL maintainer="Ghostrecon44"

# updates
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# downloads
RUN apt-get install -y wget
RUN wget https://dl.google.com/go/go$go_ver.linux-amd64.tar.gz

# pre-req
RUN apt-get install -y libcurl4-openssl-dev libssl-dev jq ruby-full
RUN apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN apt-get install -y python-setuptools
RUN apt-get install -y libldns-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y python-pip
RUN apt-get install -y python-dnspython
RUN apt-get install -y git
RUN apt-get install -y rename
RUN apt-get install -y nmap

# setup
RUN mkdir -p /root/tools/

# golang
RUN tar -xvf go$go_ver.linux-amd64.tar.gz
RUN rm -rf go$go_ver.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# AWS CLI
# Finish later: https://mamchenkov.net/wordpress/2016/10/31/easier-aws-cli-with-docker/
RUN pip install awscli

# Aquatone
RUN go get github.com/michenriksen/aquatone

# JSParser
RUN git clone https://github.com/nahamsec/JSParser.git /root/tools/JSParser/
RUN cd /root/tools/JSParser/ && \
	python setup.py install

# Sublist3r
RUN git clone https://github.com/aboul3la/Sublist3r.git /root/tools/Sublist3r/
RUN cd /root/tools/Sublist3r/ && \
	pip install -r requirements.txt

# teh_s3_bucketeers
RUN git clone https://github.com/tomdev/teh_s3_bucketeers.git /root/tools/teh_s3_bucketeers/

# wpscan
RUN git clone https://github.com/wpscanteam/wpscan.git /root/tools/wpscan/
RUN cd /root/tools/wpscan/ && \
	gem install bundler && bundle install --without test

RUN git clone https://github.com/maurosoria/dirsearch.git /root/tools/dirsearch/
RUN git clone https://github.com/nahamsec/lazys3.git /tools/root/nahamsec/
RUN git clone https://github.com/jobertabma/virtual-host-discovery.git /root/tools/virtual-host-discovery/
RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /root/tools/sqlmap-dev/
RUN git clone https://github.com/guelfoweb/knock.git /root/tools/knock/
RUN git clone https://github.com/blechschmidt/massdns.git /root/tools/massdns/
RUN git clone https://github.com/nahamsec/crtndstry.git /root/tools/crtndstry/

# massdns
RUN cd /root/tools/massdns/ && \
	make

# asnlookup
# currently a 404 on this repo - will fix after its available
#RUN git clone https://github.com/yassineaboukir/asnlookup.git /root/tools/asnlookup/
#RUN cd /root/tools/asnlookup/ && \
#	pip install -r requirements.txt

# even more tools
RUN go get -u github.com/tomnomnom/httprobe 
RUN go get -u github.com/tomnomnom/unfurl 
RUN go get github.com/tomnomnom/waybackurls

# SecLists
RUN git clone https://github.com/danielmiessler/SecLists.git /root/tools/SecLists/
RUN cd /root/tools/SecLists/Discovery/DNS/ && \
	cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt

RUN git clone https://github.com/nahamsec/lazyrecon.git /tools/lazyrecon/

# install nginx
RUN apt-get install -y curl gnupg2 ca-certificates lsb-release
RUN echo "deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" \
	| tee /etc/apt/sources.list.d/nginx.list
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get clean all

# Forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
