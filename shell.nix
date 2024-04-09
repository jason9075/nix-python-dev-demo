{ pkgs ? import <nixpkgs> { } }:
let
  pythonEnv = pkgs.python3.withPackages (ps:
    with ps;
    [
      # Add your other Python packages here
      opencv4
    ]);
in pkgs.mkShell {
  nativeBuildInputs = [ pythonEnv pkgs.python3Packages.virtualenv ];

  # Optional: Set environment variables
  shellHook = ''
    echo "Welcome to my Python project environment!"
  '';
}
