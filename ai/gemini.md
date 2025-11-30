# Gemini

[Guide](https://google-gemini.github.io/gemini-cli/)

## CLI

Install and use [Node](../packages/node-npm.md)

```sh
node -v
```

Install gemini-cli

```sh
npm install -g @google/gemini-cli
```

Add API key in `~/.zshrc` or `~/.bashrc`

```sh
# Optional
export GEMINI_API_KEY="<YOUR_API_KEY>"
```

### Commands

Start cli

```sh
cd ./project/directory
gemini
```

One-off command

```sh
gemini "What is the distance between the Earth and the Moon?"
```

Include multiple directory

```sh
gemini --include-directories ../lib,../docs
```

Quit CLI

```sh
/quit
```

### MCP

List servers

```sh
gemini mcp list
```
