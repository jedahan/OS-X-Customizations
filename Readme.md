# jedahan's Mavericks setup

Shell scripts for automated OSX machine setup. Requires [Xcode](https://developer.apple.com/downloads) and a network connection.

## Usage

Edit any of the *.sh files in the scripts folder to your liking and then run `engage.sh` in your terminal

`engage.sh` will ask for your root password, and then:

  1. Apply system preferences (like hostname)
  2. Install commandline and gui software
  3. Install application extensions, add-ons, and plug-ins
  5. Apply application preferences

## Software

`applications.sh` installs the following software through [Homebrew](http://brew.sh) and [Homebrew Cask](https://github.com/phinze/homebrew-cask):

### commandline software

[Zsh](www.zsh.org/‎)
, [Prezto](https://github.com/sorin-ionescu/prezto)
, [Git](http://git-scm.com)
, [Hub](https://github.com/defunkt/hub)
, [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
, [ImageMagick](http://www.imagemagick.org)
, [Node.js](http://nodejs.org)
, [Redis](http://redis.io)
, [beets]()
, [deliver](https://github.com/gerhard/deliver)
, [mongodb](https://mongodb.org)
, [nmap](nmap.org)
, [trash](http://hasseg.org/trash/)
, [watch](http://procps.sourceforge.net/)
, [httpie](httpie.org)
, [android-sdk](http://developer.android.com/sdk/index.html?hl=sk)
, [foreman](https://github.com/ddollar/foreman)
, [homesick](https://github.com/technicalpickles/homesick)
, [lolcat](https://github.com/busyloop/lolcat)
, [lolcommits](https://github.com/mroth/lolcommits)

### gui software

quicklook plugins
, [Alfred](alfredapp.com)
, [Arduino](arduino.cc)
, [atom][atom.io]
, [Cheatsheet](cheatsheetapp.com)
, [Dogecoin](github.com/dogecoin/dogecoin)
, [Dropbox](dropbox.com)
, [Firefox Beta](mozilla.org/beta)
, [iTerm2 Beta](iterm2.com)
, [Skype](skype.com)
, [Transmission](transmissionbt.com/)
, [Virtualbox](virtualbox.org)
, [Wireshark](wireshark.org)
, [XQuartz](xquartz.macosforge.org)

### dotfiles

Sets up [My Dotfiles](https://github.com/jedahan/dotfiles), and defaults

## Post Install Checklist

* Install [MacPass](https://github.com/mstarke/MacPass)
* Install [App Store](http://www.apple.com/macosx/whats-new/app-store.html) software:
    * [Twitter](https://itunes.apple.com/us/app/twitter/id409789998?mt=12)
    * [Cinch](https://itunes.apple.com/us/app/cinch/id412529613?mt=12)
    * [Vox](https://itunes.apple.com/us/app/vox/id461369673?mt=12)
* Require password immediately after sleep or screen saver begins in Security & Privacy
* Configure work email and calendar accounts
* Install [virtualbox extension pack](https://www.virtualbox.org/wiki/Downloads)
* Install obsidian menu bar
    * Customize dropbox and twitter icons
    * Add .menu to login items
* Install alfred powerpack
    * Get alfred working with homebrew cask installed apps
* Enable accessibility for zooming
* Generate/install ssh keys
