{
  description = "Matty's NixOS Flake ❄️";

  nixConfig = {
    substituters = [ "https://cache.nixos.org/" ];
    extra-substituters = [ "https://nix-community.cachix.org" "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    extra-trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, unstable, home-manager, ... } : {
    nixosConfigurations.tartarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./machines/tartarus
        ./modules
       home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; }; 
          home-manager.users.matty = import ./home;
        }
      ];
    };
  };
}
