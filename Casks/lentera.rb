cask "lentera" do
  version "1.1.0"
  sha256 "c5a2f9b9d54124a8c085fd9c8fa5b6289f7f015599e1b97c70bc6e8fae1a64ea"

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
