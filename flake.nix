{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "flake:nix-darwin";
    nixos-generators.url = "flake:nixos-generators";
    home-manager.url = "flake:home-manager";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      darwinConfigurations = {
        ceres = import ./darwinConfigurations/ceres.nix flakeContext;
        eros = import ./darwinConfigurations/eros.nix flakeContext;
      };
      darwinModules = {
        brew = import ./darwinModules/brew.nix flakeContext;
        default = import ./darwinModules/default.nix flakeContext;
      };
      homeConfigurations = {
        bmc = import ./homeConfigurations/bmc.nix flakeContext;
      };
      homeModules = {
        default = import ./homeModules/default.nix flakeContext;
        editor = import ./homeModules/editor.nix flakeContext;
        shell = import ./homeModules/shell.nix flakeContext;
      };
      nixosConfigurations = {
        tycho = import ./nixosConfigurations/tycho.nix flakeContext;
      };
      nixosModules = {
        default = import ./nixosModules/default.nix flakeContext;
      };
      packages = {
        aarch64-linux = {
          pi = import ./packages/pi.nix flakeContext;
        };
      };
    };
}
