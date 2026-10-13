class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "858df732cd27df221c7e5a7965576a875fe57209412e9e8c62b8ada2845f712d"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "734e18bad962210cd15e3b3e4f56cc8540e3a9fc80706e68a4d0c19c5272475d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "20227807b26c6614b99bc279746873522658a5dccbe7c5f24d08cd4975a7ec45"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "59592c8f08be7d0fb133e62564d325ad16fe685a2115901a5aac82c9dc05ac7c"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
