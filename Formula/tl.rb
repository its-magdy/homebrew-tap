class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "6209755a16039200573de4bebdfc76a1df86e942ba23dbb1feb33a50d0e38b4a"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "ae9cc4c3a7209936ff4f6613ca2c5a49a76f0ea4097c4ebf79d439b6e0ca1bc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "09d5cd29d893783b6a02bb46dcec23b60797c4d15aba9fe67905f116ca624109"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "ba28054ed993d35dffb84435ca58a97f9384e300b303d6d96e3dadbd4d67a36c"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
