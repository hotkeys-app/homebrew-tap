# Homebrew cask for Hotkeys, published in github.com/hotkeys-app/homebrew-tap as Casks/hotkeys.rb
#   brew install --cask hotkeys-app/tap/hotkeys
# On every release set version and sha256, Util/build-full.sh prints the checksum
cask "hotkeys" do
  version "20260925"
  sha256 "ec9b57c5682f9883ca45dd4f6d02514edc77339e197dbf96886ca9b6d0a553f6"

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

  zap trash: [
    "~/Library/Application Support/hotkeys",
    "~/Library/Caches/hotkeys.io.max",
    "~/Library/HTTPStorages/hotkeys.io.max",
    "~/Library/Preferences/hotkeys.io.max.plist",
  ]
end