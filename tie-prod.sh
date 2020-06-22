!#/bin/sh

# =================
# DEPLOYMENT SCRIPT
# =================

cd ~
mkdir git-clones
mkdir tie-app
cd ~/tie-app
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get -y upgrade
apt install -y nginx
apt-get install -y certbot python3-certbot-nginx build-essential libssl-dev software-properties-common git mongodb redis-server
certbot --nginx --non-interactive --agree-tos --email info@clementlabs.com -d tie-p1.clementlabs.com
certbot renew --dry-run
git config --global user.name "nik"
git config --global user.email "nik@teamracing.ca"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
exec bash
nvm install --lts
npm i -g pm2
mkdir -p /data/db/
mongod
/etc/init.d/redis-server start
ufw allow 'Nginx HTTPS'
ufw allow 22
ufw --force enable
reboot