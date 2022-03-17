# Install dependencies again. Not sure why docker build didn't install them all
/scripts/install-dependencies.sh

# Fix up permissions
chown -R builder /home/builder

# Can't build rpm as root
sudo su builder
