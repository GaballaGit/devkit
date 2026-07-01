{
  description = "test";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachSystem [
      "x86_64-linux"
      "aarch64-darwin"
    ] (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells = {
        go-api-psql = import ./shells/go-api.nix {
          inherit pkgs;
          db = "postgres";
        };

        go-api-sqlite = import ./shells/go-api.nix {
          inherit pkgs;
          db = "sqlite";
        };
      };
    });
}
