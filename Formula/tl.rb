class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "13a86c2293fee110ddca4d45bc3dfe8673b79122272bec00c8abb8405e161bf2"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "d627c11fe843c2c9fa3fe771ca3d6599933a2c78bbf4608ba7456c62fc766be7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "7ef17e20c5e83d3bf9025c5e9d240eca65eebad5386ad348f7e5d5028f81ed03"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "3305cb0919e82b9de54cdd735eea7ae511e1931c8a4abff5cc7d70390a19c5ca"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
