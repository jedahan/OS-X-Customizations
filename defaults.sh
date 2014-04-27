# Transmission: Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
# Transmission: Hide the donate and legal messages
defaults write org.m0k.transmission WarningDonate -bool false
defaults write org.m0k.transmission WarningLegal -bool false
# Transmission: Setup Blocklist
defaults write org.m0k.transmission BlocklistURL -string "http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
# Transmission: Require Encryption
defaults write org.m0k.transmission EncryptionRequire -bool true
# Transmission: Minimal UI
defaults write org.m0k.transmission SmallView -bool true
defaults write org.m0k.transmission InfoVisible -bool false
defaults write org.m0k.transmission StatusBar -bool false
defaults write org.m0k.transmission AutoSize -bool true
defaults write org.m0k.transmission BadgeDownloadRate -bool false
defaults write org.m0k.transmission BadgeUploadRate -bool false
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false
defaults write org.m0k.transmission DownloadAsk -bool false

# Cinch: enable accssibility
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','com.irradiatedsoftware.Cinch',0,1,1,NULL);"
