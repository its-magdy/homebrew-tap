class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "5377dd59c2db0c7920bf3254cdfddf896f532dde223f89cc3e4a77a7e1ea8d08"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "dffbf633780d6d87b3e5d715c9517b1b41cb0f2d1f84cf34e5c423d195daf9ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "a538c77b09d3f6a89f7e24191e59f4250071eaf0d90372080b70c3e0a8b85ac4"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "546a398f94decd884ca912eae6858f9345631e57a5c331a10aa2d3c2cb0204a9"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
