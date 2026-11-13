cask "locus" do
  version "0.1.0,30"
  sha256 "33ab70e76d51d0f935071cc7666588ff9e6973864670b2370e029edcdc4fa41a"

  url "https://github.com/atomsprout/locus-release/releases/download/v#{version.csv.first}-#{version.csv.second}/Locus-#{version.csv.first}-#{version.csv.second}.zip"
  name "Locus"
  desc "Rule-based proxy and connection inspector for users and agents"
  homepage "https://github.com/atomsprout/locus-release"

  livecheck do
    skip "Public preview releases are promoted manually"
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Locus.app"

  uninstall quit: "com.everettjf.locus"

  caveats <<~EOS
    Public preview: Apple silicon and macOS 27 or later are required.
    Open Locus from /Applications, keep the default route Direct, and press Start.
    macOS will ask you to approve its network extension and proxy configuration.
    Installing this cask does not enable the network extension automatically.

    Press Stop before upgrading. Before uninstalling, open Locus Settings and
    choose Remove network integration. Complete any requested restart, then run
    brew uninstall --cask atomsprout/tap/locus.
    Quitting Locus alone does not stop an already running network extension.

    Documentation and feedback: https://github.com/atomsprout/locus-release
  EOS
end
