cask "remoboard" do
  version "0.1.0"
  sha256 "8e80c0ae0b698f411e71359056e03ffdc5ee8cb694f3253a5c233effc52827fe"

  url "https://github.com/atomsprout/remoboard-release/releases/download/v#{version}/Remoboard-#{version}-universal.dmg"
  name "Remoboard"
  desc "Type on your phone from your computer over Bluetooth or Wi-Fi"
  homepage "https://github.com/atomsprout/remoboard-release"

  livecheck do
    skip "Preview releases are promoted manually"
  end

  depends_on :macos

  app "Remoboard.app"

  uninstall quit: "com.atomsprout.remoboard.desktop"

  caveats <<~EOS
    Preview: Bluetooth mode needs the next Remoboard release on the phone, which is
    not in the App Store or Google Play yet. With today's phone versions use Wi-Fi.

    Open Remoboard from /Applications and allow Bluetooth when macOS asks.
    Documentation and feedback: https://github.com/atomsprout/remoboard-release
  EOS
end
