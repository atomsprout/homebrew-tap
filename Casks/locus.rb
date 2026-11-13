cask "locus" do
  version "0.1.0,36"
  sha256 "47ace94b51f41e5acd3a6c37e91825204fecb57b5d793ae73d0a05ca8254edd5"

  url "https://github.com/atomsprout/locus-release/releases/download/v#{version.csv.first}-#{version.csv.second}/Locus-#{version.csv.first}-#{version.csv.second}.zip"
  name "Locus"
  desc "Rule-based proxy and connection inspector for users and agents"
  homepage "https://github.com/atomsprout/locus-release"

  livecheck do
    skip "Public preview releases are promoted manually"
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Locus.app"

  uninstall quit: "com.everettjf.locus"

  caveats <<~EOS
    Public preview: Apple silicon and macOS 26 or later are required.
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
