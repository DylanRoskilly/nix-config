# Nix Config

## Secrets

Create `secrets.nix` from the `secrets.example.nix` template and add your
values.

## Usage

To apply the configuration, run:

```
# On macOS
nix run home-manager -- --flake .#macos switch

# On Linux
nix run home-manager -- --flake .#linux switch
```
