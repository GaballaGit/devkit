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
        # Defaults to postgresql
        go-api = import ./shells/go-api.nix {
          inherit pkgs;
        };

        go-api-psql = import ./shells/go-api.nix {
          inherit pkgs;
          db = "postgres";
        };

        go-api-sqlite = import ./shells/go-api.nix {
          inherit pkgs;
          db = "sqlite";
        };

        # Web Dev with Node and Wrangler
        node-wrangler = import ./shells/node-wrangler.nix {
          inherit pkgs;
        };

        node-wrangler-yarn = import ./shells/node-wrangler.nix {
          inherit pkgs;
          packageManager = pkgs.yarn;
        };

        node-wrangler-pnpm = import ./shells/node-wrangler.nix {
          inherit pkgs;
          packageManager = pkgs.pnpm;
        };

        # Rust
        rust = import ./shells/rust.nix {
          inherit pkgs;
        };
      };
    });
}
