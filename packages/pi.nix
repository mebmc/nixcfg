{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.self.homeConfigurations.bmc.nixosModule
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
  };
in
inputs.nixos-generators.nixosGenerate {
  system = "aarch64-linux";
  format = "iso";
  modules = [
    nixosModule
  ];
}
