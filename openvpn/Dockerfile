FROM ubuntu:xenial
RUN apt-get update -q
RUN apt-get install -yq openvpn openssl iptables
ADD ./openvpn.conf /etc/openvpn/openvpn.conf
ADD ./bin /bin
RUN chmod 700 /bin/run.sh
EXPOSE 443/tcp
CMD run.sh
