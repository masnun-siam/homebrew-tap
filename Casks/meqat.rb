cask "meqat" do
  version "1.4.0"
  sha256 "e54718e53e07f045df8c880e96d244fd7d5a046fe4db81b1838d5f8bb09647df"

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
