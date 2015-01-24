FROM ubuntu:precise
MAINTAINER Dex Chen "dex.chen@ruckuswireless.com"

# For AP
RUN apt-get update && apt-get install -y libc6-i386 lib32stdc++6 build-essential bison atfs autoconf flex gettext libncurses5-dev ctags sharutils zlib1g-dev gawk texinfo rsync

# For ZD only
#RUN apt-get install -y ant openjdk-6-jdk openjdk-7-jdk

# Set an utf-8 locale
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
