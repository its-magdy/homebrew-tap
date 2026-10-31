class Dtwin < Formula
  desc "Design Twin CLI and MCP server: read a Figma design to disk, no API key"
  homepage "https://github.com/its-magdy/design-twin"
  url "https://registry.npmjs.org/@design-twin/dtwin/-/dtwin-0.1.1.tgz"
  sha256 "287b8151eed80957cde76981dd19f3835ba9c77378830b4db6d1766b2559bedc"
  license "MIT"

  depends_on "bun"

  def install
    # The npm package is TypeScript that Bun runs as is: install it, then its production dependencies beside it.
    libexec.install Dir["*"]
    cd libexec do
      system formula_opt_bin("bun")/"bun", "install", "--production", "--ignore-scripts", "--no-save"
    end

    # The package bin's shebang flags: no auto-install from the registry, and the project's .env stays out.
    # Spelt through opt, so an absolute path dtwin derives from its own location survives `brew upgrade`.
    (bin/"dtwin").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("bun")}/bun" --no-install --no-env-file "#{opt_libexec}/src/figma-pull.ts" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dtwin --version")
  end
end
