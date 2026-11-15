cask "locus" do
  version "0.4.0,59"
  sha256 "2a857bdee364eae1e47e258560070a4f7ace35f70264bdc5289b16c7849aa792"

  url "https://github.com/atomsprout/locus-release/releases/download/v#{version.csv.first}-#{version.csv.second}/Locus-#{version.csv.first}-#{version.csv.second}.zip"
  name "Locus"
  desc "Rule-based proxy and HTTP evidence workspace for users and agents"
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
    Open Locus from /Applications, choose your routing mode and nodes in Overview, then press Connect.
    macOS will ask you to approve its network extension and proxy configuration.
    Installing this cask does not enable the network extension automatically.

    HTTPS inspection requires separate app/host approval and explicit local CA trust.
    Agent body access is separately approved and expires.

    Press Disconnect before upgrading. Before uninstalling, if you trusted the Locus CA,
    remove its trust in Requests > HTTPS certificate settings. Then open Settings
    and choose Remove network integration. Complete any requested restart, then run
    brew uninstall --cask atomsprout/tap/locus.
    Quitting Locus alone does not stop an already running network extension.

    Documentation and feedback: https://github.com/atomsprout/locus-release
  EOS
end
