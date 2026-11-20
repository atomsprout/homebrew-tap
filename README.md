# AtomSprout Homebrew Tap

Homebrew casks and formulae for AtomSprout applications. This tap contains distribution definitions, not application source code.

## Install Locus

```sh
brew update
brew tap atomsprout/tap
brew install --cask atomsprout/tap/locus
```

If Homebrew reports an untrusted cask after an update, run `brew trust --cask atomsprout/tap/locus`, then retry.

Requires **Apple silicon / macOS 26 or later** and a current Homebrew that recognizes macOS26. Locus is a rule-based proxy and network workspace with scoped HTTP(S) evidence, session-scoped header rewriting and 36 local MCP tools for agents. HTTPS inspection and Agent body reading require explicit separate approval.

Downloads are signed and notarized app archives from [atomsprout/locus-release](https://github.com/atomsprout/locus-release/releases). The cask pins the exact archive SHA-256. 1.0.0 was the first stable release; 1.0.1 fixes proxied connections that never ended. Its final archive was accepted on a macOS 27 virtual machine; physical Mac feedback is still pending.

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

## Install Remoboard preview

```sh
brew tap atomsprout/tap
brew install --cask atomsprout/tap/remoboard
```

Requires **macOS 11 or later**, Intel or Apple silicon. Remoboard for Mac connects to the Remoboard keyboard on your phone over Bluetooth or Wi-Fi, so you can type on the phone from the computer. Bluetooth mode needs the next Remoboard release on the phone, which is not in the stores yet.

The download is a signed and notarized disk image from [atomsprout/remoboard-release](https://github.com/atomsprout/remoboard-release/releases). Upgrade with `brew upgrade --cask atomsprout/tap/remoboard`, remove with `brew uninstall --cask atomsprout/tap/remoboard`.

## Preview release policy

The Locus `1.0.1,72` cask installs a stable release (1.0.0 was the first); that GitHub release is not a prerelease and has no allowlist entry. A preview cask must have its exact version declared in Homebrew's `github_prerelease_allowlist` audit metadata. Every version requires an explicit cask and checksum update.

The `remoboard` cask (`0.1.0`) follows the same policy.

## Install Analyze Anything

Analyzes any app package, installer, archive, folder or file (IPA, APK, .app, DMG, pkg, Windows installers and more) into a report in which every finding carries its evidence. Static and offline: the input is only read, never run. The command-line tool and the desktop app are installed separately and neither needs the other.

```sh
brew tap atomsprout/tap
brew install atomsprout/tap/analyze-anything                  # the command: analyze-anything
brew install --cask atomsprout/tap/analyze-anything-desktop   # the desktop app
```

Requires **Apple silicon**; the desktop app needs macOS 12 or later. Both downloads are signed with a Developer ID certificate and notarized, from [atomsprout/analyze-anything-release](https://github.com/atomsprout/analyze-anything-release/releases); the formula and the cask pin the exact SHA-256. The packages have only been run on macOS 27 so far.

```sh
analyze-anything analyze <file or folder> -o out
analyze-anything diff old/report.json new/report.json
```

The program calls itself `aa`; Homebrew installs it as `analyze-anything` because macOS already has a `/usr/bin/aa` (Apple Archive).

Upgrade with `brew upgrade atomsprout/tap/analyze-anything` and `brew upgrade --cask atomsprout/tap/analyze-anything-desktop`; the desktop app does not update itself. The desktop app keeps past reports (never the analyzed files) in `~/Library/Application Support/com.atomsprout.analyze-anything`; `brew uninstall --zap --cask atomsprout/tap/analyze-anything-desktop` removes them with the app.

Usage, known limits and feedback: [Analyze Anything release repository](https://github.com/atomsprout/analyze-anything-release).
