class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "903673ce4dded8c0217af6f28cc8a56d1c9577f811a17e5b2c34114b7607ff13"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "5e55f71bbb83fa36fbb49ba312756b2366ba219038600dfe3bc3590a9392b85a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "044aeec3d2ae0374bb1e82d8840741b196fed691dd16d65fb680b43bb4609809"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "7e244a8eaa7ba702b590b8d4712ab3e4bf003d4dfaaaeca00f29f9df37ebc580"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
