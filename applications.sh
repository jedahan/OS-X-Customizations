#!/bin/zsh

# Update software
sudo softwareupdate --install --all

brew -v && {
  brew update
  brew upgrade
  brew install ruby

  taps=(
    caskroom/cask
    homebrew/games
    neovim/neovim
    caskroom/fonts
    osx-cross/avr
    caskroom/versions
  )

  important_clis=(
    git
    zsh
    python3
    sift
  )

  important_apps=(
    gpgtools
    firefox
    iterm2-beta
    tuxera-ntfs
    font-inconsolata
  )

  clis=(
    aircrack-ng
    android-sdk
    avr-libc
    avrdude
    assh
    boot2docker
    fceux
    gnuradio
    go
    hub
    mtr
    mpv
    ngrep
    nmap
    node
    ruby
    trash
    vice
    watch
    youtube-dl
  )

  apps=(
    alfred
    android-file-transfer
    arduino
    atom
    backblaze
    battle-net
    betterzipql
    dash
    dropbox
    flickr-uploadr
    fritzing
    gitify
    hex-fiend
    horndis
    java
    mini-vmac
    spotify
    steam
    transmission
    vagrant
    virtualbox
    vlc
    xquartz
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    slack
    suspicious-package
    zulip
  )

  function brewinstall() {
    brew list $1 >/dev/null || brew install $_
  }

  function caskinstall() {
    brew cask list $1 >/dev/null || brew cask install $_
  }

  brew list neovim >/dev/null || brew install --HEAD neovim
  for cli in $important_clis; do brewinstall $cli; done
  for app in $important_apps; do brewinstall $app; done
  for cli in $clis; do brewinstall $cli; done
  for app in $apps; do caskinstall $app; done

  brew cleanup
  qlmanage -r
}

$+commands[http] || sudo easy_install httpie

# Install livestreamer
pip3 install livestreamer

# Install keybase
sudo npm install --global keybase-installer
keybase-installer

# Install emoji-cli
sudo npm install --global emoji-cli

# Install some more cli utilities
export GEM_HOME="${HOME}/.gems"
export GEM_PATH="$GEM_HOME"
gem install lolcat lolcommits
