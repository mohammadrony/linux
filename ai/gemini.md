# Gemini

[Guide](https://google-gemini.github.io/gemini-cli/)

## CLI

Install and use [Node](../packages/node-npm.md)

```bash
node -v
```

Install gemini-cli

```bash
npm install -g @google/gemini-cli
```

Add API key in `~/.zshrc` or `~/.bashrc`

```bash
# Optional
export GEMINI_API_KEY="<YOUR_API_KEY>"
```

### Commands

Start cli

```bash
cd ./project/directory
gemini
```

One-off command

```bash
gemini "What is the distance between the Earth and the Moon?"
```

Include multiple directory

```bash
gemini --include-directories ../lib,../docs
```

Quit CLI

```bash
/quit
```

### MCP

List servers

```bash
gemini mcp list
```
