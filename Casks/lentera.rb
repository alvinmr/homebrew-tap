cask "lentera" do
  version "1.2.0"
  sha256 "3ffa0c638164832c898ce91cb3e4459e235017e001f10759aaabfa40d5a699af"

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
