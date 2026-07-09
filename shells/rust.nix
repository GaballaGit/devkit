{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    rustc
    cargo
  ];

  shellHook = ''
    echo "< ------------ >"
    echo "   Rust Shell  "
    echo "< ------------ >"
    echo "rustc: ${pkgs.rustc.version}"
    echo "cargo: ${pkgs.cargo.version}"
  '';
}
