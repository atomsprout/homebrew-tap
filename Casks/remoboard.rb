cask "remoboard" do
  version "0.1.0"
  sha256 "8e80c0ae0b698f411e71359056e03ffdc5ee8cb694f3253a5c233effc52827fe"

  url "https://github.com/atomsprout/remoboard-release/releases/download/v#{version}/Remoboard-#{version}-universal.dmg"
  name "Remoboard"
  desc "Type on your phone from your computer over Bluetooth or Wi-Fi"
  homepage "https://github.com/atomsprout/remoboard-release"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Remoboard.app"

  uninstall quit: "com.atomsprout.remoboard.desktop"

  caveats <<~EOS
    Bluetooth mode needs Remoboard 8.3 or later on the phone (part of Remoboard Pro).
    With 8.2 on the phone, use Wi-Fi.

    Open Remoboard from /Applications and allow Bluetooth when macOS asks.
    Documentation and feedback: https://github.com/atomsprout/remoboard-release
  EOS
end
