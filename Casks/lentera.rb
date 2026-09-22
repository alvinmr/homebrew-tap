cask "lentera" do
  version "1.0.0"
  sha256 "689b6ac1562c046c51645ee41b26e22abf57e1bbbf4fb2a85cd77b95f5e2c8fb"

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
