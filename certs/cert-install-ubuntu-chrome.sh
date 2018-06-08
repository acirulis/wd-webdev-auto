sudo apt install -y libnss3-tools
certutil -d sql:$HOME/.pki/nssdb -A -t "P,," -n whitedigital.local.crt -i whitedigital.local.crt 
certutil -d sql:$HOME/.pki/nssdb -L

#Remove
# certutil -D -d sql:$HOME/.pki/nssdb -n whitedigital.local.crt



#Global Ubuntu CA store
# apt-get install ca-certificates

#alt1
# cp cacert.pem /usr/share/ca-certificates
# dpkg-reconfigure ca-certificates

#alt2
# sudo cp my.crt /usr/local/share/ca-certificates/
# sudo update-ca-certificates
