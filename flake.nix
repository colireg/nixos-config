{
  description = "Matty's NixOS Flake";

  nixConfig.experimental-features = [ "nix-command" "flakes" ];

  nixConfig.substituters = [
    # Use the Chinese mirror
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
  ];

  nixConfig.extra-substituters = [
    # Nix community's cache server
    "https://nix-community.cachix.org"
  ];

  nixConfig.extra-trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  inputs.home-manager = {
    url = "github:nix-community/home-manager/release-23.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, ...} : {
    nixosConfigurations.apollo = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
  };

}
