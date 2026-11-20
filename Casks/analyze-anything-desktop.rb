cask "analyze-anything-desktop" do
  version "0.1.1"
  sha256 "c3a6be7614755ffa31fc28b1fe46230388b1b3884d148c0dc6047ba3f2b79371"

  url "https://github.com/atomsprout/analyze-anything/releases/download/v#{version}/Analyze-Anything-#{version}-arm64.dmg"
  name "Analyze Anything"
  desc "Analyze any app package, installer or file and read the report"
  homepage "https://github.com/atomsprout/analyze-anything"

  livecheck do
    skip "Releases are promoted manually"
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Analyze Anything.app"

  uninstall quit: "com.atomsprout.analyze-anything"

  zap trash: [
    "~/Library/Application Support/com.atomsprout.analyze-anything",
    "~/Library/Caches/com.atomsprout.analyze-anything",
    "~/Library/Saved Application State/com.atomsprout.analyze-anything.savedState",
    "~/Library/WebKit/com.atomsprout.analyze-anything",
  ]

  caveats <<~EOS
    Open Analyze Anything from /Applications and drop a file or folder on its window.
    The input is only read, never run or installed, and nothing is sent anywhere.

    Past reports are kept in ~/Library/Application Support/com.atomsprout.analyze-anything
    (reports only, never the analyzed files). Uninstalling leaves them; `brew uninstall
    --zap --cask atomsprout/tap/analyze-anything-desktop` removes them too.

    The command-line tool is a separate formula:
      brew install atomsprout/tap/analyze-anything

    Documentation and feedback: https://github.com/atomsprout/analyze-anything
  EOS
end
