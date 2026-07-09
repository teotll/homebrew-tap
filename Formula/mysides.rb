class Mysides < Formula
  desc "CLI for managing the macOS Finder sidebar (Favourites + Locations)"
  homepage "https://github.com/longestline/mysides"
  # Pinned to the exact commit audited before adoption (fork of 7onnie/mysides).
  url "https://github.com/longestline/mysides/archive/04a0b193d37d174d131ff7b792d586afbab71bad.tar.gz"
  version "1.0.11"
  sha256 "719e403a685f459ca5c61aca81318a80d4260b5ca0d25ae2d681fc9de253a25b"
  license "MIT"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/mysides"
  end

  test do
    assert_match "mysides #{version}", shell_output("#{bin}/mysides version")
  end
end
