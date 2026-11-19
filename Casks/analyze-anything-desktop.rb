cask "analyze-anything-desktop" do
  version "0.1.1"
  sha256 "45e25eaceb292ada1ae0dbef38bc61a5319c9a7d99581ea94e1aeb0e25b0a391"

  url "https://github.com/atomsprout/analyze-anything-release/releases/download/v#{version}/Analyze-Anything-#{version}-arm64.dmg"
  name "Analyze Anything"
  desc "Analyze any app package, installer or file and read the report"
  homepage "https://github.com/atomsprout/analyze-anything-release"

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

    Documentation and feedback: https://github.com/atomsprout/analyze-anything-release
  EOS
end
