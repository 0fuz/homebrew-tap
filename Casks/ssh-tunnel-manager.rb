cask "ssh-tunnel-manager" do
  version "1.9.2"
  sha256 "03672aa7cb0322ee5bbb4d569a8f8d083ad76ae6b9ae0f2543cd896856b846d0"

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
