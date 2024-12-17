{
  description = "Matty's NixOS Flake ❄️";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
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
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit
                inputs
                username
                email
                pkgs-unstable
                ;
            };
            home-manager.users.${username} = import ./home.nix;
          }
        ];
      };
    };
}
