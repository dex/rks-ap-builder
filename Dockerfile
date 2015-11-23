FROM ubuntu:precise
MAINTAINER Dex Chen "dex.chen@ruckuswireless.com"

ARG uid=1000

ENV BUILD_USER vagrant
ENV BUILD_UID $uid

RUN apt-get update -y

# For i386 compatibility
RUN apt-get install -y libc6-i386 lib32stdc++6

# Common
RUN apt-get install -y build-essential bison atfs autoconf flex gettext libncurses5-dev ctags sharutils zlib1g-dev gawk texinfo rsync

# For build MQTT
RUN apt-get install -y python2.7

# For ARM-QCA
RUN apt-get install -y uuid-dev uboot-mkimage

# For tensilica (i386 binary)
# We have to install gcc here due to gcc will be removed due to i386 libc
RUN apt-get install -y zlib1g-dev:i386 gcc

# For sudo
RUN apt-get install -y sudo
RUN echo "$BUILD_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# For ZD JAVA applet (Optional)
#RUN apt-get install -y ant openjdk-6-jdk openjdk-7-jdk

# Set an utf-8 locale (needed by uClibc)
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Create build user
RUN useradd -m -s /bin/bash -N -u $BUILD_UID $BUILD_USER

VOLUME ["/vagrant", "/tftpboot"]

WORKDIR /vagrant

CMD ["/bin/bash"]

USER vagrant
