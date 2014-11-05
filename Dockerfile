FROM centos:latest

MAINTAINER Ryan Grothouse 

RUN yum update -y
RUN yum install -y squid
ADD squid.conf /etc/squid/
EXPOSE 3128
VOLUME ["/var/log/squid"]

CMD /usr/sbin/squid && tail -f /var/log/squid/access.log
