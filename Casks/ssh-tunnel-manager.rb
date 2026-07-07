cask "ssh-tunnel-manager" do
  version "1.8.0"
  sha256 "f1006305186385a5b77d63410194c733a0915a4beb3e0a75426b16e854ee83b1"

  url "https://github.com/0fuz/ssh-tunnel-manager/releases/download/v#{version}/SSHTunnelManager.dmg"
  name "SSH Tunnel Manager"
  desc "Menu bar app for managing SSH port forwards"
  homepage "https://github.com/0fuz/ssh-tunnel-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "SSHTunnelManager.app"

  zap trash: [
    "~/Library/Application Support/SSHTunnelManager",
    "~/Library/Preferences/com.example.SSHTunnelManager.plist",
    "~/Library/Preferences/io.github.0fuz.SSHTunnelManager.plist",
  ]

  caveats <<~EOS
    SSH Tunnel Manager is not notarized. On first launch, right-click it in
    /Applications and choose Open. To skip that prompt, clear the quarantine
    flag once:

      xattr -dr com.apple.quarantine /Applications/SSHTunnelManager.app
  EOS
end
