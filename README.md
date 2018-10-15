# **zookeeper**
___

### Description
___

This image runs the official [*Apache ZooKeeper*](https://zookeeper.apache.org/) on a Centos Linux distribution.

The *latest* tag of this image is build with the [latest stable](https://zookeeper.apache.org/releases.html) release of Apache ZooKeeper on Centos 7.

You can pull it with:

    docker pull josemyd/zookeeper

You can also find other images based on different Apache Hadoop releases, using a different tag in the following form:

    docker pull josemyd/zookeeper:[zookeeper-release]

For example, if you want Apache ZooKeeper release 3.4.8 you can pull the image with:

    docker pull josemyd/zookeeper:3.5.4

Run with Docker Compose:

    docker-compose up

### Available tags

- Apache ZooKeeper 3.5.4 ([3.5.4](https://github.com/JosemyDuarte/docker-zookeeper/blob/3.5.4/Dockerfile), [latest](https://github.com/JosemyDuarte/docker-zookeeper/blob/master/Dockerfile))
