# homebrew-tap

Homebrew tap for my macOS apps:

- [SSH Tunnel Manager](https://github.com/0fuz/ssh-tunnel-manager) — native
  menu bar app for managing SSH port forwards
- [Hangar](https://github.com/0fuz/hangar) — native menu bar launcher for
  terminal and app snippets

## Install

```bash
brew install --cask 0fuz/tap/ssh-tunnel-manager
brew install --cask 0fuz/tap/hangar
```

The apps are not notarized. If macOS blocks the first launch, right-click the
app in `/Applications` and choose Open, or clear the quarantine flag once:

```bash
xattr -dr com.apple.quarantine /Applications/SSHTunnelManager.app
xattr -dr com.apple.quarantine /Applications/Hangar.app
```

## Update

```bash
brew upgrade --cask ssh-tunnel-manager
brew upgrade --cask hangar
```

The casks are kept in sync with the latest app releases automatically by
[`.github/workflows/update-cask.yml`](.github/workflows/update-cask.yml): it
runs daily and can also be triggered by hand from the Actions tab right after a
release.
