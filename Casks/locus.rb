cask "locus" do
  version "0.2.1,42"
  sha256 "40456423a82922eec65173d87e920ea9d14cba071460d958cb68f994eb48f9c7"

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
