FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US.UTF-8 GOPATH=$PWD

RUN apt-get update && locale-gen "en_US.UTF-8"
RUN apt-get -y install unzip tar software-properties-common wget curl ruby ruby-dev build-essential git && \
    add-apt-repository -y ppa:ubuntu-lxc/lxd-stable && \
    add-apt-repository -y ppa:hansjorg/rust && \
    wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb && \
    dpkg -i puppetlabs-release-pc1-trusty.deb && \
    rm puppetlabs-release-pc1-trusty.deb && \
    apt-get update && \
    apt-get -y install puppet-agent golang rust-stable
RUN apt-get clean
RUN gem install --no-ri --no-rdoc librarian-puppet fpm-cookery puppet-lint

