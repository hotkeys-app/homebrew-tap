# Homebrew cask for Hotkeys, published in github.com/hotkeys-app/homebrew-tap as Casks/hotkeys.rb
#   brew install --cask hotkeys-app/tap/hotkeys
# On every release set version and sha256, Util/build-full.sh prints the checksum
cask "hotkeys" do
  version "20260924"
  sha256 "7989d7cd0d2ca069c6ad3b54a10fd2e3197d073fc32ef28d513c0adbb23a5b9b"

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