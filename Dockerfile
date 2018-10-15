FROM josemyd/docker-centos-jdk:jdk-10

USER root

ENV ZOOKEEPER_VER 3.5.4

ENV ZOOKEEPER_HOME /opt/zookeeper

ENV PATH $ZOOKEEPER_HOME/bin:$ZOOKEEPER_HOME/sbin:$PATH

# Install needed packages
RUN yum update -y \
    && yum install -y wget unzip curl sudo \
    ant which openssh-clients wget \
    openssh-server python-setuptools git \
    && easy_install supervisor \
    && yum clean all \
    && rm -rf /var/cache/yum

WORKDIR /opt/docker

# Apache ZooKeeper
RUN wget https://github.com/apache/zookeeper/archive/release-$ZOOKEEPER_VER.tar.gz \
    && tar -xvf release-$ZOOKEEPER_VER.tar.gz -C ..\
    && mv ../zookeeper-release-$ZOOKEEPER_VER $ZOOKEEPER_HOME \
    && rm release-$ZOOKEEPER_VER.tar.gz \
    && cd $ZOOKEEPER_HOME \
    && ant \
    && rm $ZOOKEEPER_HOME/conf/*.cfg \
    && rm $ZOOKEEPER_HOME/conf/*.properties

COPY zookeeper/ $ZOOKEEPER_HOME/
COPY ./etc /etc

RUN mkdir -p /zookeeper/data \
    && mkdir -p /zookeeper/logs

ADD ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

EXPOSE 2181 2888 3888

VOLUME [ "/zookeeper/data", "/zookeeper/logs", "/opt/zookeeper/conf" ]

ENTRYPOINT ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
