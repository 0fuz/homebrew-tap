# homebrew-tap

Homebrew tap for [SSH Tunnel Manager](https://github.com/0fuz/ssh-tunnel-manager),
a native macOS menu bar app for managing SSH port forwards.

## Install

```bash
brew install --cask 0fuz/tap/ssh-tunnel-manager
```

The app is not notarized. If macOS blocks the first launch, right-click it in
`/Applications` and choose Open, or skip the Gatekeeper prompt at install time:

```bash
brew install --cask --no-quarantine 0fuz/tap/ssh-tunnel-manager
```

## Update

```bash
brew upgrade --cask ssh-tunnel-manager
```

The cask is kept in sync with the latest app release automatically by
[`.github/workflows/update-cask.yml`](.github/workflows/update-cask.yml): it
runs daily and can also be triggered by hand from the Actions tab right after a
release.
