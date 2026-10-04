cask "macfan" do
  version "0.2.0"
  sha256 "743beb38adadb0ae1858fb807dfac49b05e5382f101234a243d4db73d7a9c63f"

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
