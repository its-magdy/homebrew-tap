class Dtwin < Formula
  desc "Design Twin CLI and MCP server: read a Figma design to disk, no API key"
  homepage "https://github.com/its-magdy/design-twin"
  url "https://registry.npmjs.org/@design-twin/dtwin/-/dtwin-0.1.3.tgz"
  sha256 "72a012655443d1e11e1475a2910ca919b143517c8a2a65f719b0cf53d7ade9ff"
  license "MIT"

  depends_on "bun"

  def install
    # The npm package is TypeScript that Bun runs as is: install it, then its production dependencies beside it,
    # exactly as the bun.lock it carries pins them (versions and sha512s), so the sha256 above covers them too.
    # With no lockfile `--frozen-lockfile` would resolve every range fresh, so a package without one is refused.
    libexec.install Dir["*"]
    cd libexec do
      odie "dtwin #{version}'s npm package has no bun.lock to install its dependencies from" unless File.exist?("bun.lock")
      system formula_opt_bin("bun")/"bun", "install", "--production", "--frozen-lockfile", "--ignore-scripts"
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
    # --version prints with no dependency installed: load the MCP server against what the install put there.
    system formula_opt_bin("bun")/"bun", "--cwd", opt_libexec, "--no-install", "--no-env-file",
           "-e", 'await import("./src/figma-mcp.ts")'
  end
end
