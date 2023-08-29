{
  description = "Matty's NixOS Flake ❄️";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    # Use the Chinese mirror
    substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    # Nix community's cache server
    extra-substituters = [ "https://nix-community.cachix.org" "https://cache.nixos.org/" ];
    extra-trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ...} : {
    nixosConfigurations.apollo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./machines/apollo
        ./modules
        ./programs
        ./shared
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.matty = import ./home.nix;
        }
      ];
    };
  };

}
