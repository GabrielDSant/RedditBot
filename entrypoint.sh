#!/bin/bash
set -e

# Executa o script install.sh
bash /app/install.sh -y

# install coisas do tiktok
cd /tiktok
pip install hatch
hatch build
pip install -e .
apt install ./google-chrome.deb -y

if [ ! -L "/usr/local/bin/chromedriver" ]; then
    ln -s /tiktok/chrome/chromedriver/chromedriver /usr/local/bin/chromedriver
fi

chmod +x /usr/local/bin/chromedriver

# install coisas steam
cd /steam
pip install -r requirements.txt

# Mantém o container ativo
exec tail -f /dev/null
