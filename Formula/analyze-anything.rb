class AnalyzeAnything < Formula
  desc "Analyze any app package, installer or file into an evidence-backed report"
  homepage "https://github.com/atomsprout/analyze-anything"
  url "https://github.com/atomsprout/analyze-anything/releases/download/v0.1.0/analyze-anything-0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "34347e74eb1e0803475e312b4c70896d513d0f7a38d1fb12bb553dc9d3dfded5"
  license "Apache-2.0"

  livecheck do
    skip "Releases are promoted manually"
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "analyze-anything"
    # The short name. (`aa` is taken on macOS: /usr/bin/aa is Apple Archive.)
    bin.install_symlink "analyze-anything" => "aaaa"
    doc.install "README.md", "NOTICE"
  end

  def caveats
    <<~EOS
      Start with:
        analyze-anything <file or folder>
      The report is written to <name>.report in the current folder. `aaaa` is the same command.

      An AI reading of the report is optional and off until you set it up:
        analyze-anything ai claude        # or: api, codex, ollama
        analyze-anything <file> --ai

      The desktop app is a separate cask:
        brew install --cask atomsprout/tap/analyze-anything-desktop

      Documentation and feedback: https://github.com/atomsprout/analyze-anything
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/analyze-anything --version")
    # Analyzes built-in samples and compares with known results.
    assert_match "selftest passed", shell_output("#{bin}/analyze-anything selftest")
    (testpath/"hello.txt").write("see https://example.com/docs\n")
    system bin/"aaaa", "hello.txt", "--format", "json"
    assert_match "example.com", (testpath/"hello.txt.report/report.json").read
  end
end
