head /private/etc/hosts | grep github.com/StevenBlack/hosts || {
  echo "downloading hosts to block malware"
  sudo curl 'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts' -a -o /private/etc/hosts
}

dscl . -read /Users/$USER UserShell | grep zsh || {
  echo "setting shell to zsh"
  sudo dscl . -create /Users/$USER UserShell $(brew --prefix)/bin/zsh
}

test -f $HOME/.dotfiles || {
  echo "cloning dotfiles"
  git clone --bare git://github.com/jedahan/dotfiles.git $HOME/.dotfiles
  mkdir .dotfiles-backup && git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
  git --git-dir=$HOME/.dotfiles --work-tree=$HOME config status.showUntrackedFiles no
}

dnsmasq --version &>/dev/null && {
  echo "making *.dev resolve to 127.0.0.1"
  echo 'address=/.dev/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
  sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
  sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
  sudo mkdir -v /etc/resolver
  sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
}
