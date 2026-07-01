{
  pkgs,
  db,
}: let
  # The snowflake driver is being pulled into the dependencies
  # and throws a panic because of CA cert failing when initialized.
  # So to get around this I override the build tag to
  # only build for one specified db
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
