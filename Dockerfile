FROM centos:latest

MAINTAINER Ryan Grothouse 

RUN yum update -y
RUN yum install -y squid logrotate cronie-anacron
ADD squid.conf /etc/squid/
ADD squid.logrotate /
ADD squid.cron /etc/cron.d/
EXPOSE 3128
VOLUME ["/var/log/squid"]

CMD sh -c '/usr/sbin/crond && /usr/sbin/squid && sleep 5 && tail -f /var/log/squid/access.log'
