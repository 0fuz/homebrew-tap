cask "hangar" do
  version "1.1.0"
  sha256 "4902dbaf92021b849f519300c11947e77853f41ec756bba9ae363af1e3df4b7e"

  url "https://github.com/0fuz/hangar/releases/download/v#{version}/Hangar.dmg"
  name "Hangar"
  desc "Menu bar launcher for terminal and app snippets"
  homepage "https://github.com/0fuz/hangar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Hangar.app"

  zap trash: [
    "~/Library/Application Support/Hangar",
    "~/Library/Preferences/io.github.0fuz.Hangar.plist",
  ]

  caveats <<~EOS
    Hangar is not notarized. On first launch, right-click it in /Applications
    and choose Open. To skip that prompt, clear the quarantine flag once:

      xattr -dr com.apple.quarantine /Applications/Hangar.app
  EOS
end
