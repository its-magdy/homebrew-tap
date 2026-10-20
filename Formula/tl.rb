class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "1a0e1feb77102f329634f2c0c2d905096637bf74688f014d09d724175a0c786e"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "3bf50b48cd161035dc0e57aac1cfc6966510eacc3a65f16e027eb1daf99fff69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "7e3f539293b4b99f058b72605ab7de71e737dc218326b62a462ec3ad3e06d884"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "4bb9d59e037e2bf74536ae066a406f0eec14cc172e0816d731c48bdd03d34756"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
