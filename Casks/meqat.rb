cask "meqat" do
  version "1.0.0"
  sha256 "9cf034c195e9f189b5852be327e1d1491aa80e530a12fbd50b22349df4778075"

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
