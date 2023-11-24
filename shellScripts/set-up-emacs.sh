rm -rf $HOME/.emacs.d
rm -rf $HOME/.emacs
mkdir $HOME/.localhistory-emacs
cd $HOME/.localhistory-emacs
git init
cd $HOME
git clone ssh://git@161.35.117.43/var/lib/gitea/emacs-d $HOME/.emacs.d
cp $HOME/.emacs.d/.emacs $HOME/.emacs
