cask "ssh-tunnel-manager" do
  version "1.9.1"
  sha256 "d109ee1c103cb39b7174d96a39f0d7c4016790e7c4f97631ccebaa8f47f76171"

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
