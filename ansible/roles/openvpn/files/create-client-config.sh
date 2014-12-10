#!/bin/sh

cat > ~/client.ovpn <<EOF
client
nobind
dev tun
proto tcp
remote vpn.igorzoriy.com 443

<key>
`cat /etc/openvpn/key.pem`
</key>
<cert>
`cat /etc/openvpn/cert.pem`
</cert>
<ca>
`cat /etc/openvpn/cert.pem`
</ca>
<dh>
`cat /etc/openvpn/dh.pem`
</dh>
EOF
