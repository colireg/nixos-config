{
  description = "Matty's NixOS Flake ❄️";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      ...
    }:
    let
      username = "matty";
      email = "mattyraud@gmail.com";
      pkgs-unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.hades = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit
            inputs
            username
            email
            pkgs-unstable
            ;
        };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
        ];
      };
    };
}
