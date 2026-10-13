class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "d0be31bfd5e0d593f67cea5c0a99e5adedbc29f8c9a524f52eef6a086ec8b1fa"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "5fc271a818ea999c32c4734ebfa3ad52c3d288e01f5064db780157aa4429a2b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "c47c1c7eeb143f4591453d2ee4872eb7ef48e533d2d5ca9606e0b2768b996489"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "e598a29c77444a2f9462b8a00b5123d50f0400a1850b8248a6e68a82103e5702"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
