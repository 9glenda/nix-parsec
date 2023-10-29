{
  description = "nix-parsec";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs @ {
    flake-parts,
    treefmt-nix,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      perSystem = _: {
        treefmt = import ./treefmt.nix;
      };
      flake = {self, ...}: {
        lib = {
          lexer = import ./lexer.nix {inherit (self.lib) parsec;};
          parsec = import ./parsec.nix;
        };
      };
    };
}
