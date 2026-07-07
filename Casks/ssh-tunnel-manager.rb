cask "ssh-tunnel-manager" do
  version "1.7.1"
  sha256 "8d101af080f993a803997fab11bb85513d7baeebef0b3614167f75265e1fb83e"

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
    SSH Tunnel Manager is not notarized. If macOS blocks the first launch,
    right-click the app in /Applications and choose Open, or reinstall with:

      brew install --cask --no-quarantine ssh-tunnel-manager
  EOS
end
