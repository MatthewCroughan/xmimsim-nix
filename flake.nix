{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  outputs = { nixpkgs, ... }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
  in
  {
    packages.x86_64-linux = rec {
      default = xmimsim;
      xmimsim = pkgs.callPackage ./default.nix {};
    };
  };
}
