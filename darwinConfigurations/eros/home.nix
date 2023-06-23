{ inputs, pkgs, ... }:
{
  config = {
    home = {
      username = "bmc";
      homeDirectory = "/Users/bmc";
      packages = with pkgs; [
        alacritty
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

    programs = {
      bash = {
        enable = true;
      };

      zsh = {                                       # Post installation script is run in configuration.nix to make it default shell
        enable = false;
        enableAutosuggestions = true;               # Auto suggest options and highlights syntax. It searches in history for options
        enableSyntaxHighlighting = true;
        history.size = 10000;
      };
    };
  };
}
