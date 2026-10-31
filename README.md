# homebrew-tap

> Homebrew formulae for [its-magdy](https://github.com/its-magdy) tools: `tl` and `dtwin`.

This tap installs `tl` and `dtwin` with `brew`. Each upstream release updates its formula automatically. Before a new version's SHA256 goes into a formula, the update workflow checks that the artifact was built by that project's own release workflow from the matching tag.

---

- [Formulae](#formulae)
- [Prerequisites](#prerequisites)
- [Install](#install)
- [Upgrade and uninstall](#upgrade-and-uninstall)
- [How formulae are updated](#how-formulae-are-updated)
- [Linting the formulae locally](#linting-the-formulae-locally)
- [License](#license)

---

## Formulae

| Formula | Description | Ships as | Platforms | Upstream |
|---------|-------------|----------|-----------|----------|
| `tl` | CLI-first translation tool with glossary enforcement and local models | Prebuilt binary from GitHub Releases | macOS and Linux, arm64 and x64 | [translate-local](https://github.com/its-magdy/translate-local) |
| `dtwin` | Design Twin CLI and MCP server: reads a Figma design to disk, no API key | npm package `@design-twin/dtwin`, run by Bun | Wherever Homebrew's `bun` installs | [design-twin](https://github.com/its-magdy/design-twin) |

`dtwin` depends on the `bun` formula, which Homebrew installs alongside it.

---

## Prerequisites

- [Homebrew](https://brew.sh) on macOS or Linux

---

## Install

Install by full name (this taps the repo automatically):

```bash
brew install its-magdy/tap/tl
brew install its-magdy/tap/dtwin
```

Or tap once, then install by short name:

```bash
brew tap its-magdy/tap
brew install tl dtwin
```

Check the install:

```bash
tl --version
dtwin --version
```

---

## Upgrade and uninstall

```bash
brew update
brew upgrade tl dtwin
```

```bash
brew uninstall tl dtwin
brew untap its-magdy/tap
```

---

## How formulae are updated

The release workflow in each upstream repo sends a `repository_dispatch` event to this tap. A workflow here then rewrites the formula and pushes the change to `main`.

| Workflow | Trigger | What it does |
|----------|---------|--------------|
| [`update-tl.yml`](.github/workflows/update-tl.yml) | `tl-release` dispatch, or manual | Downloads the four `tl-{darwin,linux}-{arm64,x64}` release binaries, verifies each one's build provenance with `gh attestation verify`, then writes the version and four SHA256s into `Formula/tl.rb` |
| [`update-dtwin.yml`](.github/workflows/update-dtwin.yml) | `dtwin-release` dispatch, or manual | Waits up to ~15 min for npm to serve the new tarball and verifies its npm SLSA provenance against design-twin's `release.yml` and the `v<version>` tag. In a job with no secrets, it then requires the tarball's `bun.lock`, installs from it with `--frozen-lockfile` into an empty cache, and loads the code. Only then does a second job, the one holding the deploy key, check it downloads the same bytes and write the URL and SHA256 into `Formula/dtwin.rb` |
| [`audit.yml`](.github/workflows/audit.yml) | Push or PR touching `Formula/**` | Runs `brew style` and `brew audit --strict` on the tap |
| [`zizmor.yml`](.github/workflows/zizmor.yml) | Push or PR touching `.github/workflows/**` | Runs a [zizmor](https://docs.zizmor.sh) static security scan of the workflows |

Both update workflows accept only a plain `X.Y.Z` version. They push with the `TAP_DEPLOY_KEY` deploy key, because the `main` branch ruleset allows direct pushes only from deploy keys and the repo admin. Dependabot opens one grouped PR a month for the SHA-pinned actions, and waits 7 days after an action's release before proposing it.

### Re-running an update by hand

If an automatic update failed (for example, npm took longer than usual to serve the tarball), dispatch the workflow with the version:

```bash
gh workflow run update-tl.yml    -R its-magdy/homebrew-tap -f version=0.5.20
gh workflow run update-dtwin.yml -R its-magdy/homebrew-tap -f version=0.1.1
```

---

## Linting the formulae locally

Run the same checks as CI from a local checkout:

```bash
brew tap its-magdy/tap "$(pwd)"
brew style its-magdy/tap
brew audit --strict --except=specs --tap its-magdy/tap
```

`--except=specs` is required: `tl.rb` keeps an explicit `version` line, which `update-tl.yml` and the release URLs depend on, and `brew audit` flags that line as redundant.

Test an installed formula:

```bash
brew test tl
brew test dtwin
```

---

## License

This repo has no license file. Each packaged tool is MIT-licensed upstream: [translate-local](https://github.com/its-magdy/translate-local), [design-twin](https://github.com/its-magdy/design-twin).
