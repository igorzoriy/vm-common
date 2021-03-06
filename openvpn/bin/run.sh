#!/bin/sh

[ -d /dev/net ] ||
    mkdir -p /dev/net
[ -c /dev/net/tun ] ||
    mknod /dev/net/tun c 10 200

cd /etc/openvpn

# pems
[ -f dh.pem ] ||
    openssl dhparam -out dh.pem 2048
[ -f key.pem ] ||
    openssl genrsa -out key.pem 2048
    chmod 600 key.pem
[ -f csr.pem ] ||
    openssl req -new -key key.pem -out csr.pem -subj /CN=OpenVPN/
[ -f cert.pem ] ||
    openssl x509 -req -in csr.pem -out cert.pem -signkey key.pem -days 36525

# ip
MY_IP_ADDR=$(curl http://myip.enix.org/REMOTE_ADDR)
[ "$MY_IP_ADDR" ] || {
    echo "Sorry, I could not figure out my public IP address."
    exit 1
}

# client config
[ -f client.ovpn ] || cat >client.ovpn <<EOF
client
nobind
dev tun
proto tcp
remote $MY_IP_ADDR 443
<key>
`cat key.pem`
</key>
<cert>
`cat cert.pem`
</cert>
<ca>
`cat cert.pem`
</ca>
<dh>
`cat dh.pem`
</dh>
EOF

iptables -t nat -A POSTROUTING -s 192.168.255.0/24 -o eth0 -j MASQUERADE
openvpn openvpn.conf
