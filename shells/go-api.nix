{
  pkgs,
  db,
}: let
  db-migrate = pkgs.go-migrate.overrideAttrs (old: {
    tags = ["${db}"];
  });
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      go
      air
      db-migrate
    ];

    shellHook = ''
      echo "< ------------ >"
      echo "  Go API Shell  "
      echo "< ------------ >"
    '';
  }
