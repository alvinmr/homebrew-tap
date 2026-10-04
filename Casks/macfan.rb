cask "macfan" do
  version "0.1.2"
  sha256 "4fa6b41fc890e0e4811d9399f5c5c1d72ae23bd858f6cbafc7a33c862330495c"

  url "https://github.com/alvinmr/macfan/releases/download/v#{version}/MacFan-v#{version}-macOS.dmg"
  name "MacFan"
  desc "Temperature monitor and fan control"
  homepage "https://github.com/alvinmr/macfan"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "MacFan.app"

  # The fan-control helper runs as root; make sure it's gone with the app.
  uninstall launchctl: "io.github.alvinmr.MacFan.helper",
            quit:      "io.github.alvinmr.MacFan"

  zap trash: [
    "~/Library/Application Support/MacFan",
    "~/Library/Caches/io.github.alvinmr.MacFan",
    "~/Library/HTTPStorages/io.github.alvinmr.MacFan",
    "~/Library/Preferences/io.github.alvinmr.MacFan.plist",
  ]
end
