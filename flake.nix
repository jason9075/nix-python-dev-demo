{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    oldpkgs.url = "github:nixos/nixpkgs/2bb5cbf7f8b99a8d1d6646abe5ab993f6823212f";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      oldpkgs = inputs.oldpkgs.legacyPackages.${system};
    in {
      devShells.x86_64-linux.default = import ./shell.nix {
        inherit pkgs;
	inherit oldpkgs;
      };
    };
}
