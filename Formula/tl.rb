class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "6b2015e284e6a51d6d7b638ffea7d4b5d92f1b9b17889484cd3e1613f6dc59db"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "94be1ca611a462544812a43c9ef445921841d76820b52e042a278662a4e5dc22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "537dbf4b4eb2553efc84af59545258f78db887de2c6736253edfae31baafe1e6"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "98e5a6518fa8c8e50663175f79bf51e303b84700d64435d43af4433e92890885"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
