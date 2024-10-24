set -euxo

# Install docker

sudo apt update
sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker ${USER}
docker --version

# Prepare deployment directory

DEPLOY_PATH=/srv/cesi-test-cicd
REPO_URL=https://github.com/togetherforgood/cesi-test-cicd.git

sudo mkdir -p ${DEPLOY_PATH}
sudo chmod ${USER} ${DEPLOY_PATH}
cd ${DEPLOY_PATH}
git clone ${REPO_URL} .

