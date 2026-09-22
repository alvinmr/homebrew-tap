cask "lentera" do
  version "0.4.0"
  sha256 "6a7435bf77be78957117096fbf34d40a0c78a5eec9f6a5fdbd9eece103d83b2c"

  url "https://github.com/alvinmr/lentera/releases/download/v#{version}/Lentera-v#{version}-macOS.dmg"
  name "Lentera"
  desc "Convert Adobe ACSM files to EPUB or PDF"
  homepage "https://github.com/alvinmr/lentera"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Lentera.app"

  zap trash: [
    "~/Library/Application Support/Lentera",
    "~/Library/Preferences/app.lentera.converter.plist",
    "~/Library/Saved Application State/app.lentera.converter.savedState",
  ]
end
