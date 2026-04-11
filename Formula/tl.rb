class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "0ba5e865a5b9d9dd4f0602bb3c93f685f77d4094ce7e5014109ae343f1b9922f"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "4dc6ff0bf43599449b41cbe12df1ffde91a0d46328a0a2f07c1cc0cef3ded38a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "2b2e34f1736cb2937c91e40976881a53959129f3eb21c3e1861672c0c6e95a6d"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "83eef521c155361f38cec47c65b6c8b72cd4f5e083b56676db588b5a536a36a4"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
