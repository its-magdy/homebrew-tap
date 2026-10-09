class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "d6a7711af4dafc1febe929110365acfbc976ce8cba59c5c69cd0e4f0b408a2ce"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "cb19a6ddcba0c3155ed7d9a401926e4519a9da5e6a7bfb3fad1e67a0751105d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "a066571c21e3fb3578fc2751b714edae19b65c546e50574cc3dce526d6d323e2"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "cf2c5c2597d49a6291f3e24b492116db401a511ec68279ca074da3f7a25a80f7"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
