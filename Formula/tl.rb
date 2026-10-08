class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "cdbad4b34aecfc4de238e0514f0767868bd7823bbfe8415b7a9061500017fd63"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "a632b5fc18882877d46621afa3e385128e770b2c5e1d31ed128f7a265dc608ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "baa4b58d316b72c1818b36f7a6450bd4a775ff6e941147a207c4f29262a1b0c1"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "4334f5851e4a08dafd87dc550800337119ff5e405f3c2e48cb1a672917bd9fe2"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
