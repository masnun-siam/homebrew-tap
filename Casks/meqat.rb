cask "meqat" do
  version "1.3.0"
  sha256 "17f9af7734a1294d6a37ee5db1006b0216e535901873d72fae3270bd9ad8386e"

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
