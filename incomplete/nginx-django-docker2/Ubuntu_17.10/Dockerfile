FROM scratch
ADD ubuntu-artful-core-cloudimg-amd64-root.tar.gz /

# ###################################
# SETUP UBUNTU 17.10
# ###################################

# a few minor docker-specific tweaks
# see https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap
RUN set -xe \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L40-L48
	&& echo '#!/bin/sh' > /usr/sbin/policy-rc.d \
	&& echo 'exit 101' >> /usr/sbin/policy-rc.d \
	&& chmod +x /usr/sbin/policy-rc.d \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L54-L56
	&& dpkg-divert --local --rename --add /sbin/initctl \
	&& cp -a /usr/sbin/policy-rc.d /sbin/initctl \
	&& sed -i 's/^exit.*/exit 0/' /sbin/initctl \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L71-L78
	&& echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L85-L105
	&& echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean \
	&& echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean \
	&& echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L109-L115
	&& echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L118-L130
	&& echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes \
	\
# https://github.com/docker/docker/blob/9a9fc01af8fb5d98b8eec0740716226fadb3735c/contrib/mkimage/debootstrap#L134-L151
	&& echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests

# delete all the apt list files since they're big and get stale quickly
RUN rm -rf /var/lib/apt/lists/*
# this forces "apt-get update" in dependent images, which is also good
# (see also https://bugs.launchpad.net/cloud-images/+bug/1699913)

# enable the universe
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list

# make systemd-detect-virt return "docker"
# See: https://github.com/systemd/systemd/blob/aa0c34279ee40bce2f9681b496922dedbadfca19/src/basic/virt.c#L434
RUN mkdir -p /run/systemd && echo 'docker' > /run/systemd/container

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
RUN apt-get update -y && apt-get upgrade

# ###################################
# SETUP POSTGRES 9.6
# ###################################

EXPOSE 5432
ARG pgversion
RUN apt-get install -y postgresql-"$pgversion" python-pip
RUN pip install redis
CMD ["postgres"]

# ###################################
# SETUP RODAN (Incomplete)
# ###################################

EXPOSE 8000
RUN apt-get install -y \
  git python-pip libtiff5-dev g++ python python-dev python-wxversion libpng-dev python-docutils \
  python-pygments python-wxgtk3.0 libpython-dev lib32ncurses5-dev libxml2-dev libxslt1-dev zlib1g-dev lib32z1-dev \
  libjpeg-dev libpq-dev graphicsmagick openjdk-8-jdk libxml2-utils libvips42 libvips-tools autoconf \
  cmake uuid-dev libboost-python-dev libboost-thread-dev libtool nginx subversion pkg-config \
	&& rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

RUN pip install git+https://github.com/hsnr-gamera/gamera.git --global-option="--nowx"
RUN git clone https://github.com/ruven/iipsrv && \
	cd iipsrv && \
	./autogen.sh && \
	./configure && \
	make
COPY rodan_config/iipsrv_nginx_config /etc/nginx/sites-available/iipsrv
RUN ln -s /etc/nginx/sites-available/iipsrv /etc/nginx/sites-enabled/iipsrv
EXPOSE 9003


# ###################################
# SETUP RODAN-CLIENT
# ###################################

EXPOSE 9002
RUN apt-get install -y git gnupg2 libgif-dev curl && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs \
	apk add yarn && \
	rm -rf  /var/lib/apt/lists/*

# COPY rodan_code /rodan_code/
COPY config /code/
RUN cd /code && \
	yarn && node_modules/.bin/jspm install -y
ENV RODAN_CLIENT_DEVELOP_HOST 0.0.0.0
WORKDIR /rodan_code/node_modules/.bin
CMD ["./gulp"]
