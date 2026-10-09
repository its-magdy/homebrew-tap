class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "c5f8c8bf4b2215342b8a10ac7befe38ffb13ae53b48a377c29f45ae6dd86ea6c"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "50a067093d9a7235b144f5699c6cad1065defc4e887134b1a7117e334c268acf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "8e51ccd5665c56866f311d436bade9c49c02d2bad2a9fc0bafddb45f938564f6"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "951a5bed67c4c33f40339fd90ff4f6cc62b86d8f94ea859f6b13c1b791de65ae"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
