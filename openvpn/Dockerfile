FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y openvpn openssl iptables

ADD ./openvpn.conf /etc/openvpn/openvpn.conf
ADD ./bin /bin
RUN chmod 700 /bin/run-openvpn.sh

EXPOSE 443/tcp
CMD run-openvpn.sh
