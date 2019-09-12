FROM centos:7
LABEL maintainer SimonLai <lai@moeneko.com>

RUN yum install epel-release -y \
    && yum install rubygems ruby-devel rubugems-devel gcc rpm-build make -y \
    && yum clean all \
    && rm -rf /var/cache/yum/* 

RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/ \
    && gem update --system \
    && gem install --no-ri --no-rdoc fpm \
    && gem cleanup
