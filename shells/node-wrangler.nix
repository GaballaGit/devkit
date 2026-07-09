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
    echo "node: ${nodeVersion.version}"
    echo "wrangler: ${pkgs.wrangler.version}"
    echo "npm: $(npm - -version)"

    if command -v pnpm >/dev/null; then
      echo "pnpm: $(pnpm --version)"
    fi

    if command -v yarn >/dev/null; then
      echo "yarn: $(yarn --version)"
    fi

  '';
}
