msg "downloading winhelp hosts.txt to block malware"
sudo curl 'winhelp2002.mvps.org/hosts.txt' -a -o /private/etc/hosts

msg "installing inconsolata font"
curl http://levien.com/type/myfonts/Inconsolata.otf -o ${HOME}/Library/Fonts/Inconsolata.otf

msg "setting iterm2 preferences directory to ${HOME}/.iterm2"
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/.iterm2"

msg "installing prezto for zsh"
local pdir="${ZDOTDIR:-$HOME}/.zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git $pdir
pushd $pdir/modules
git submodule add https://github.com/sindresorhus/pure.git pure
ln -s $pdir/modules/pure/pure.zsh prompt/functions/prompt_pure_setup
popd

msg "symlinking dotfiles to home directory"
homesick clone jedahan/dotfiles && homesick symlink dotfiles

msg "setting shell to zsh"
chsh -s /bin/zsh

msg "setting the boot logo"
sudo cp boot/{BootLogo.png,DefaultDesktop.jpg} /System/Library/CoreServices/

dnsmasq --version &>/dev/null && {
  msg "making *.dev resolve to 127.0.0.1"
  echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
  sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
  sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo mkdir -v /etc/resolver
  sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
}

vboxmanage --version &>/dev/null && {
  msg "installing the virtualbox extension pack"
  virtualbox_version=`vboxmanage --version | cut -d'r' -f1`
  pushd $TMPDIR
  curl -OL "http://download.virtualbox.org/virtualbox/${virtualbox_version}/Oracle_VM_VirtualBox_Extension_Pack-${virtualbox_version}.vbox-extpack"
  vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-${virtualbox_version}.vbox-extpack
  popd
}
