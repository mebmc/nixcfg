{ inputs, pkgs, ... }:
{
  # Users
  users.users.bmc = {               # macOS user
    home = "/Users/bmc";
    shell = pkgs.zsh;                     # Default shell
  };

  # home-manager = {
  #   useGlobalPkgs = true;
  #   useUserPackages = true;
  #   # users.bmc = inputs.self.homeConfigurations.bmc.nixosModule;
  #   # users = import "${inputs.self}/users";
  #   extraSpecialArgs = {
  #     inherit inputs;
  #     headless = false;
  #     macOS = true;
  #   };
  # };

  networking = {
    hostName = "eros";
    computerName = "eros";
    knownNetworkServices = ["Wi-Fi"];
    dns = ["1.1.1.1" "1.0.0.1"];
  };

  environment = {
    shells = [ pkgs.zsh ];          # Default shell
    variables = {                         # System variables
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    systemPackages = [         # Installed Nix packages
      pkgs.git
      pkgs.tmux
      pkgs.zellij
      pkgs.ripgrep
      pkgs.zoxide
      pkgs.exa
      pkgs.fd
      pkgs.jq
      pkgs.vim
      pkgs.neovim
      pkgs.just
      pkgs.curl
      pkgs.wget
      pkgs.yadm
      pkgs.wireguard-tools
    ];
  };

  programs = {                            # Shell needs to be enabled
    zsh.enable = true;
  };

  services = {
    nix-daemon.enable = true;             # Auto upgrade daemon
    # synergy = {
    #   client.enable = true;
    #   client.serverAddress = "";
    # };
    tailscale = {
      enable = true;
      domain = "mebmc.github";
    };
    yabai = {
      enable = false;
    };
    skhd = {
      enable = false;
    };
  };

}
