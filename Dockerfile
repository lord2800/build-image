FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US.UTF-8 GOPATH=$PWD

RUN apt-get update && apt-get -y dist-upgrade && locale-gen "en_US.UTF-8"

RUN apt-get -y install unzip tar software-properties-common wget curl ruby ruby-dev build-essential git

RUN add-apt-repository -y ppa:ubuntu-lxc/lxd-stable && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb && \
    rm puppetlabs-release-pc1-xenial.deb && \
    curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get update

RUN apt-get -y install puppet-agent golang-1.6 rustc cargo nodejs && \
	gem install --no-ri --no-rdoc librarian-puppet fpm-cookery puppet-lint bundler && \
	apt-get clean
