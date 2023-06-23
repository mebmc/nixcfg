{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    imports = [
      # inputs.self.homeModules.shell
    ];
    config = {
      home = {
        username = "bmc";
        homeDirectory = "/Users/bmc";
        packages = with pkgs; [
          file
          ripgrep
          fd
          magic-wormhole
          unzip
          btop
          htop
          pciutils
          ansible
          terraform
        ];

        stateVersion = "23.05";
      };
    };
  };
  nixosModule = { ... }: {
    home-manager.users.bmc = homeModule;
  };
in
(
  (
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        homeModule
      ];
      pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    }
  ) // { inherit nixosModule; }
)
