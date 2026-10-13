class Tl < Formula
  desc "CLI-first translation tool with glossary enforcement and local models"
  homepage "https://github.com/its-magdy/translate-local"
  version "0.5.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-arm64"
      sha256 "9f42f21a79a0dd2d68aae2a6ea9adec9f4b615d1af693b73837b424d61883ca5"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-darwin-x64"
      sha256 "fd03db7aad9bba53c6375594dc89dd6211126b893fcc4c7724d9e19352026cf9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-arm64"
      sha256 "8c4896c8d00a9af65fd1f2ea2834911530b4d5201520bfee8a8cfcce6790a9d5"
    end
    on_intel do
      url "https://github.com/its-magdy/translate-local/releases/download/v#{version}/tl-linux-x64"
      sha256 "5c8c76b8c4d5f64db0b5e6c1a6e7bca29c0bb4fa04ceac4692a57d1f45d0f6ed"
    end
  end

  def install
    bin.install Dir["tl-*"].first => "tl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tl --version")
  end
end
