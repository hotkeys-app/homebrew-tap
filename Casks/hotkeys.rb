# Homebrew cask for Hotkeys, published in github.com/hotkeys-app/homebrew-tap as Casks/hotkeys.rb
#   brew install --cask hotkeys-app/tap/hotkeys
# On every release set version and sha256, Util/build-release.sh prints the checksum
cask "hotkeys" do
  version "20261002"
  sha256 "b35d6bce1433cdd99179163317a70907f476a6489bee2bb0950dcbfafd4d005a"

  url "https://www.hotkeys.io/updates/Hotkeys-#{version}.dmg"
  name "Hotkeys"
  desc "Hotkey manager configured with a plain-text file"
  homepage "https://www.hotkeys.io/"

  livecheck do
    url "https://www.hotkeys.io/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Hotkeys.app"

  # the password field helper is a root LaunchDaemon the app registers, it outlives the app bundle
  uninstall launchctl: "hotkeys.io.max.helper"

  zap trash: [
    "~/Library/Application Support/hotkeys",
    "~/Library/Caches/hotkeys.io.max",
    "~/Library/HTTPStorages/hotkeys.io.max",
    "~/Library/Preferences/hotkeys.io.max.plist",
  ]
end