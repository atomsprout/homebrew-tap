cask "locus" do
  version "1.0.0,70"
  sha256 "2b744b3a7651facac6e56454cbb4e5a241f3dc37f583c427b6c195ac434caa8b"

  url "https://github.com/atomsprout/locus-release/releases/download/v#{version.csv.first}-#{version.csv.second}/Locus-#{version.csv.first}-#{version.csv.second}.zip"
  name "Locus"
  desc "Agent-ready HTTP debugger and rule-based proxy"
  homepage "https://github.com/atomsprout/locus-release"

  livecheck do
    skip "Releases are promoted manually after runtime acceptance"
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Locus.app"

  uninstall quit: "com.everettjf.locus"

  caveats <<~EOS
    Apple silicon and macOS 26 or later are required.
    Open Locus from /Applications, choose your routing mode and nodes in Overview, then press Connect.
    macOS will ask you to approve its network extension (administrator password) and proxy configuration.
    Installing this cask does not enable the network extension automatically.

    HTTPS inspection requires separate app/host approval and explicit trust in the local CA,
    system-wide or by one client (for example curl --cacert).
    Agent body access is separately approved and expires.

    Press Disconnect before upgrading. Before uninstalling, if you trusted the Locus CA,
    remove its trust in Requests > HTTPS certificate settings. Then open Settings
    and choose Remove network integration. Complete any requested restart, then run
    brew uninstall --cask atomsprout/tap/locus.
    Quitting Locus alone does not stop an already running network extension.

    Documentation and feedback: https://github.com/atomsprout/locus-release
  EOS
end
