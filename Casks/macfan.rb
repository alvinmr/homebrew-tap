cask "macfan" do
  version "0.1.1"
  sha256 "bbd9ebd30adb9c3a14d4b115c5789e79b0104f5bb8dd683b7e23e00d9a0c0f8c"

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
