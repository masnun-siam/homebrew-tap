cask "meqat" do
  version "1.8.0"
  sha256 "7996c235c24374d1c48c1672e6a3933ec13c7e10da04e837bda25375f6ff0361"

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
