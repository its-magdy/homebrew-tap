class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "b26d12c95b6af9606375ae9eefbc3723967052eac0cbaf1bebcbf0e58703a04b"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "d0668ea21db2bdfac785fd4c843ec1c12d0302399060b07770c9491608cedc08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "3b0f7d2124b2c445669409d64c013236185525293f4691815f0b9f30c9700988"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "34aaa00b22e070279c3c2d901a1729a37ae37ec9e4677f291eefd805367efd0d"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
