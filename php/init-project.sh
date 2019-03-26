
echo "Starting Installation"
echo "======================="
echo "Copying keys and set necessary permission"
cd /home
cp ./id_rsa ~/.ssh/
chmod 400 ~/.ssh/id_rsa

echo "Adding host to known host"
#Add hosts to known (Replace with your gitlab url)
ssh-keyscan gitlab.com >> ~/.ssh/known_hosts

cd "/app"
echo "Cloning from repo${REPOSITORY_URL}"
git clone $REPOSITORY_URL .

#change to correct branch
git checkout master

#Execute composer update if required
composer update || echo "composer.json not found. No packages installed"

#Run server
apachectl -D FOREGROUND



