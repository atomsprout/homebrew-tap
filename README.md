# AtomSprout Homebrew Tap

Homebrew casks for AtomSprout applications. This tap contains distribution definitions, not application source code.

## Install Locus public preview

```sh
brew update
brew tap atomsprout/tap
brew install --cask atomsprout/tap/locus
```

If Homebrew reports an untrusted cask after an update, run `brew trust --cask atomsprout/tap/locus`, then retry.

Requires **Apple silicon / macOS 26 or later** and a current Homebrew that recognizes macOS26. Locus is a rule-based proxy and network workspace with scoped HTTP(S) evidence and 28 local MCP tools for agents. HTTPS inspection and Agent body reading require explicit separate approval.

Downloads are signed and notarized app archives from [atomsprout/locus-release](https://github.com/atomsprout/locus-release/releases). The cask pins the exact archive SHA-256. The first release is a public preview, with physical Mac feedback still pending.

Open `/Applications/Locus.app`, choose your mode and nodes in Overview, and click **Connect**. Complete the normal macOS network-extension and proxy-configuration approvals. Homebrew installation itself does not enable network integration. After reboot, open Locus and Connect manually.

## Upgrade

Press **Disconnect** in Locus before running:

```sh
brew update
brew upgrade --cask atomsprout/tap/locus
```

## Uninstall

If you trusted the Locus CA, first remove trust in **Requests → HTTPS certificate settings**. Then use **Locus → Settings → Remove network integration**, approve removal, and restart if macOS requests it. Then:

```sh
brew uninstall --cask atomsprout/tap/locus
```

The cask removes the app bundle; it does not manually delete system-extension directories, saved rules, connection history, or Keychain credentials. Quitting the GUI alone does not stop an active extension.

Usage, supported scope, known issues and feedback: [Locus release repository](https://github.com/atomsprout/locus-release).

## Preview release policy

The current `0.4.0,59` cask intentionally installs the public preview. Its exact version is declared in Homebrew's `github_prerelease_allowlist` audit metadata; the GitHub release remains a prerelease. Future versions require an explicit cask/checksum and policy update.
