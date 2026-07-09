cask "mullion" do
  # version + sha256 are rewritten by mullion's scripts/release.sh on each release.
  # Placeholder until the first release is cut (the cask is not installable yet).
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/teotll/homebrew-tap/releases/download/mullion-v#{version}/Mullion-#{version}.dmg"
  name "Mullion"
  desc "Menu-bar window manager"
  homepage "https://github.com/teotll/mullion"

  # macOS 26 (Tahoe) or newer — the app targets .macOS(.v26).
  depends_on macos: :tahoe

  app "Mullion.app"

  # Mullion is self-signed with a stable local identity, not Apple-notarized.
  # Strip the Gatekeeper quarantine flag so the app launches without a block.
  # This is the supported in-cask replacement for the removed --no-quarantine
  # flag, allowed for custom taps.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mullion.app"]
  end

  # Quit the running menu-bar agent (LSUIElement) before removal.
  uninstall quit: "local.mullion.app"

  zap trash: [
    "~/Library/Caches/local.mullion.app",
    "~/Library/Preferences/local.mullion.app.plist",
    "~/Library/Saved Application State/local.mullion.app.savedState",
  ]
end
