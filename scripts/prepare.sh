# Fix up permissions
chown -R builder /home/builder

cd /home/builder

# Can't build rpm as root
sudo su builder
