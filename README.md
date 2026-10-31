# homebrew-tap

> Homebrew formulae for [its-magdy](https://github.com/its-magdy) tools.

## Tap

Add this tap once — then install any formula from it:

```bash
brew tap its-magdy/tap
```

## Available formulae

| Formula | Description | Repo |
|---------|-------------|------|
| `tl` | CLI-first translation tool with glossary enforcement and local models | [translate-local](https://github.com/its-magdy/translate-local) |
| `dtwin` | Design Twin CLI and MCP server: read a Figma design to disk, no API key (installs Bun) | [design-twin](https://github.com/its-magdy/design-twin) |

## Install

```bash
brew install its-magdy/tap/tl
brew install its-magdy/tap/dtwin
```

Or tap first, then install by short name:

```bash
brew tap its-magdy/tap
brew install tl     # or: brew install dtwin
```

## Upgrade

```bash
brew upgrade tl     # or: brew upgrade dtwin
```

Formulae are updated automatically when a new release is published.
