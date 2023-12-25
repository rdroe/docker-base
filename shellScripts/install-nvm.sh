echo "Installinng nvm"                                                                                                                                
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 18

nvm use 18

npm install --global yarn
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*;  cp -r $n/{bin,lib,share} /usr/local

exec $SHELL

# below is untested--but should install nvm for all users 
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*;  cp -r $n/{bin,lib,share} /usr/local

exec 'n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; cp -r $n/{bin,lib,share} /usr/local'
