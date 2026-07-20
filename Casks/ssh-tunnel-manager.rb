cask "ssh-tunnel-manager" do
  version "1.9.0"
  sha256 "a8e4f9c785f7e8be1dd93ec546885eb1351ae774ad16bb947a44bb05e3102a31"

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
