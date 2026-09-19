# Rust

## TL;DR

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc
```

```sh
rustc --version
cargo --version
```

## Rustup Install

### Install rustup

Latest version of [rustup](https://rustup.rs)

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```sh
case "$SHELL" in
  */zsh) source ~/.zshrc ;;
  */bash) source ~/.bashrc ;;
esac
```

Check version

```sh
rustc --version
cargo --version
rustup --version
```

### Manage toolchains

List installed toolchains

```sh
rustup toolchain list
```

Install a toolchain

```sh
rustup toolchain install stable
```

```sh
rustup toolchain install nightly
```

Set default toolchain

```sh
rustup default stable
```

Update toolchains

```sh
rustup update
```

### Components and targets

Add a component

```sh
rustup component add clippy
rustup component add rustfmt
```

Add a target

```sh
rustup target add wasm32-unknown-unknown
```

### Cargo basics

Create a new project

```sh
cargo new <project>
```

Build and run

```sh
cargo build
cargo run
```

Format and lint

```sh
cargo fmt
cargo clippy
```

### Uninstall rust

Uninstall rustup and toolchains

```sh
rustup self uninstall
```
