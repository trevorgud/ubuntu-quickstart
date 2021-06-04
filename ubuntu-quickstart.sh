#!/usr/bin/env bash

# install misc utilities and build/dev tools
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  apt-transport-https \
  bison \
  ca-certificates \
  catch \
  cmake \
  curl \
  curl \
  firefox \
  flex \
  fzf \
  g++ \
  gdb \
  gimp \
  git \
  golang \
  host \
  inetutils-traceroute \
  libboost-date-time-dev \
  libcurl4-openssl-dev \
  libpcap-dev \
  librdkafka-dev \
  libspdlog-dev \
  libssl-dev \
  libtins-dev \
  make \
  net-tools \
  netbase \
  nlohmann-json3-dev \
  nmap \
  ntp \
  openjdk-8-jdk \
  pandoc \
  python2 \
  python3 \
  python3-pip \
  software-properties-common \
  tcpdump \
  tcpreplay \
  telnet \
  tmux \
  unzip \
  vim \
  wget \
  zlib1g-dev \

# prepare nodejs/npm
curl -sL https://deb.nodesource.com/setup_14.x | bash -

# install terraform
wget https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip
unzip terraform_0.15.5_linux_amd64.zip
mv terraform /usr/local/bin/
rm terraform_0.15.5_linux_amd64.zip

# prepare gcloud
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# prepare wireshark
add-apt-repository universe

# prepare kubectl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

# prepare sbt
echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# prepare docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# prepare scala
wget www.scala-lang.org/files/archive/scala-2.12.8.deb

# prepare zoom
wget https://zoom.us/client/latest/zoom_amd64.deb

# prepare MS teams
wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.16851_amd64.deb

# prepare sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

# prepare google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install extra utilities and build/dev tools
apt update && apt -y install \
  scala \
  sbt \
  docker-ce \
  kubectl \
  teams \
  wireshark \
  sublime-text \
  google-cloud-sdk \
  nodejs \
  ./zoom_amd64.deb \
  ./scala-2.12.8.deb \
  ./teams_1.3.00.16851_amd64.deb \
  ./google-chrome-stable_current_amd64.deb

rm ./zoom_amd64.deb \
  ./scala-2.12.8.deb \
  ./teams_1.3.00.16851_amd64.deb \
  ./google-chrome-stable_current_amd64.deb

# post docker install
usermod -aG docker ${SUDO_USER}

# upgrade npm to newest version
npm install -g npm

# run extra install steps as non-privileged user
wget https://raw.githubusercontent.com/trevorgud/ubuntu-quickstart/main/install-extras.sh
chmod +x ./install-extras.sh
su -c "./install-extras.sh" $SUDO_USER
rm install-extras.sh

# reminder for additional installation steps
echo ""
echo "TODO: import ssh keys (ensure permissions 600)"
echo "TODO: clone xvisor:                   # git clone git@github.com:ennetix/xvisor.git ~/git/xvisor"
echo "TODO: clone xvisor-deploys:           # git clone git@github.com:ennetix/xvisor-deploys.git ~/git/xvisor-deploys"
echo "TODO: authenticate for gcp:           # gcloud init"
echo "TODO: authenticate for gcp clusetr:   # gcloud container clusters get-credentials xvisor --region us-west1-a"
echo "TODO: change terminal color scheme to solarized"
echo ""
echo "TODO: reboot"
echo ""
