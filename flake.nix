{
  description = "Matty's NixOS Flake ❄️";

  nixConfig = {
    substituters = [ "https://cache.nixos.org/" ];
    extra-substituters = [ "https://nix-community.cachix.org" "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    extra-trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    unstable.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, unstable, home-manager, ... } : {
    nixosConfigurations.tartarus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./machines/tartarus
        ./modules/console.nix
        ./modules/gnome.nix
        ./modules/samba.nix
        ./modules/xdg.nix
        ./modules/zswap.nix
        ./modules/fonts.nix
        ./modules/gnupg.nix
        ./modules/tor.nix
        ./modules/zsh.nix
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
