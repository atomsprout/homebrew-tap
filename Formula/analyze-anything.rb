class AnalyzeAnything < Formula
  desc "Analyze any app package, installer or file into an evidence-backed report"
  homepage "https://github.com/atomsprout/analyze-anything-release"
  url "https://github.com/atomsprout/analyze-anything-release/releases/download/v0.2.0/aa-0.2.0-aarch64-apple-darwin.tar.gz"
  sha256 "d3e3146b0b2eeb30ab5c197dcf748e573c8f28f1beff9e3df80f06ff5f2ac561"
  license "Apache-2.0"

  livecheck do
    skip "Releases are promoted manually"
  end

  depends_on arch: :arm64
  depends_on :macos

  def install
    # The program is called `aa` upstream, but macOS has its own /usr/bin/aa (Apple Archive).
    # Installing under that name would either be hidden by it or hide it from scripts.
    bin.install "aa" => "analyze-anything"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      The command is `analyze-anything`. Start with:
        analyze-anything analyze <file or folder> -o out

      Elsewhere the program is called `aa`; macOS already has a command of that
      name (Apple Archive), so Homebrew installs it under its full name.

      The desktop app is a separate cask:
        brew install --cask atomsprout/tap/analyze-anything-desktop

      Documentation and feedback: https://github.com/atomsprout/analyze-anything-release
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/analyze-anything --version")
    # Analyzes built-in samples and compares with known results.
    assert_match "selftest passed", shell_output("#{bin}/analyze-anything selftest")
    (testpath/"hello.txt").write("see https://example.com/docs\n")
    system bin/"analyze-anything", "analyze", testpath/"hello.txt", "-o", testpath/"out", "--format", "json"
    assert_match "example.com", (testpath/"out/report.json").read
  end
end
