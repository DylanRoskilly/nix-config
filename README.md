# Nix Config

## Secrets

Create `secrets.nix` from the `secrets.example.nix` template and add your
values.

Nix flakes require all files referenced by the flake to be tracked in Git. The
`pre-commit` hook prevents accidentally committing `secrets.nix`:

```bash
cp pre-commit .git/hooks/pre-commit
```

## Usage

To apply the configuration, run:

```
# On macOS
nix run home-manager -- --flake .#macos switch

# On Linux
nix run home-manager -- --flake .#linux switch
```
