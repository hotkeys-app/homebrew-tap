# Homebrew cask for Hotkeys, published in github.com/hotkeys-app/homebrew-tap as Casks/hotkeys.rb
#   brew install --cask hotkeys-app/tap/hotkeys
# On every release set version and sha256, Util/build-release.sh prints the checksum
cask "hotkeys" do
  version "20260928"
  sha256 "613db157f869054abf528d9cbf2373a6d60f6b2d85496ab5224aaee3641781e1"

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