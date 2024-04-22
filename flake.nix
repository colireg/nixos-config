{
  description = "Matty's NixOS Flake ❄️";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      username = "matty";
      email = "mattyraud@gmail.com";
    in
    {
      nixosConfigurations.tartarus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs username email; };
        modules = [
          ./tartarus
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username email; };
            home-manager.users.matty = import ./matty;
          }
        ];
      };
    };
}
