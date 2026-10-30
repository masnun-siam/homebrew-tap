cask "meqat" do
  version "1.2.0"
  sha256 "60d3b2913010272722df770a1024a5456ebd11eea4474be3a38c13aa9fcff5c1"

  url "https://github.com/masnun-siam/meqat/releases/download/v#{version}/Meqat-#{version}.dmg"
  name "Meqat"
  desc "Menu bar prayer times, prohibited windows and per-event alerts"
  homepage "https://github.com/masnun-siam/meqat"

  depends_on macos: :sonoma

  app "Meqat.app"

  caveats <<~EOS
    Meqat is not notarized yet, so macOS blocks its first launch. Run once:
      xattr -dr com.apple.quarantine #{appdir}/Meqat.app
    or open it, then choose Open Anyway in System Settings > Privacy & Security.
  EOS
end
