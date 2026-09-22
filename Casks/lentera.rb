cask "lentera" do
  version "1.0.1"
  sha256 "55fb5936d353b4db0e7a430ae955d1babf107ba3e2e334f47fa774ca6a6702ac"

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
