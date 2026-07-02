{
  pkgs,
  nodeVersion ? pkgs.nodejs_24,
  packageManager ? null,
}:
pkgs.mkShell {
  buildInputs = with pkgs;
    [
      nodeVersion
      wrangler
    ]
    ++ pkgs.lib.optional (packageManager != null) packageManager;

  shellHook = ''
    echo "< ------------------- >"
    echo "  Node + Wrangler Env  "
    echo "< ------------------- >"
  '';
}
