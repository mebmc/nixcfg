{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {

    nix = {
      package = pkgs.nix;
      gc = {                                # Garbage collection
        automatic = true;
        interval.Day = 7;
        options = "--delete-older-than 7d";
      };
      extraOptions = ''
        auto-optimise-store = true
        experimental-features = nix-command flakes
      '';
    };

    time.timeZone = "Europe/London";

    fonts = {
      fontDir.enable = true;
      fonts = [
        pkgs.source-code-pro
        pkgs.font-awesome
        (pkgs.nerdfonts.override {
          fonts = [
            "FiraCode"
            "FiraMono"
            "JetBrainsMono"
            "Hack"
            "Noto"
            "NerdFontsSymbolsOnly"
            "Ubuntu"
            "UbuntuMono"
          ];
        })
      ];
    };

    system = {
      defaults = {
        NSGlobalDomain = {                  # Global macOS system settings
          KeyRepeat = 10;
          InitialKeyRepeat = 1;
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticSpellingCorrectionEnabled = false;
        };
        dock = {                            # Dock settings
          autohide = true;
          orientation = "bottom";
          showhidden = true;
          tilesize = 40;
        };
        finder = {                          # Finder settings
          QuitMenuItem = false;             # I believe this probably will need to be true if using spacebar
        };  
        trackpad = {                        # Trackpad settings
          Clicking = true;
          TrackpadRightClick = true;
        };
      };
      activationScripts.postActivation.text = ''sudo chsh -s ${pkgs.zsh}/bin/zsh''; # Since it's not possible to declare default shell, run this command after build
      stateVersion = 4;
    };

  };
}

