{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixos-23.05";
    nixpkgs-darwin.url = "flake:nixpkgs/nixpkgs-23.05-darwin";
    nixpkgs-unstable.url = "flake:nixpkgs/nixpkgs-unstable";
    nixos-generators.url = "flake:nixos-generators";
    home-manager = {
      url = "flake:home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "flake:nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      darwinConfigurations = {
        ceres = import ./darwinConfigurations/ceres flakeContext;
        eros = import ./darwinConfigurations/eros flakeContext;
      };
      darwinModules = {
        default = import ./darwinModules/default.nix flakeContext;
        brew = import ./darwinModules/brew.nix flakeContext;
      };

      homeConfigurations = {
        bmc = import ./homeConfigurations/bmc flakeContext;
      };
      homeModules = {
        default = import ./homeModules/default.nix flakeContext;
        editor = import ./homeModules/editor.nix flakeContext;
        shell = import ./homeModules/shell.nix flakeContext;
      };

      nixosConfigurations = {
        tycho = import ./nixosConfigurations/tycho flakeContext;
        ganymede = import ./nixosConfigurations/ganymede flakeContext;
        phoebe = import ./nixosConfigurations/phoebe flakeContext;
      };
      nixosModules = {
        default = import ./nixosModules/default.nix flakeContext;
      };

      packages = {
        aarch64-linux = {
          pi = import ./packages/pi flakeContext;
        };
      };
    };
}
