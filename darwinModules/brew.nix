{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    homebrew = {                            # Declare Homebrew using Nix-Darwin
      enable = true;
      onActivation = {
        autoUpdate = false;                 # Auto update packages
        upgrade = false;
        cleanup = "zap";                    # Uninstall not listed packages and casks
      };
      brews = [
        "rtx"
        "mas"
        "awscli"
        "cdk8s"
      ];
      casks = [
        "1password-cli"
        "raycast"
        "superkey"
        "tunnelblick"
      ];
      masApps = {
        "Amphetamine" = 937984704;
        "DaisyDisk" = 411643860;
        "Developer" = 640199958;
        "Microsoft Outlook" = 985367838;
        "Moom" = 419330170;
        "PopClip" = 445189367;
        "Telegram" = 747648890;
        "TestFlight" = 899247664;
        "Xcode" = 497799835;
        "Microsoft Remote Desktop" = 1295203466;
        "OpenIn" = 1643649331;
        "Save to Raindrop.io" = 1549370672;
        "Tailscale" = 1475387142;
        "rcmd" = 1596283165;
      };
    };
  };
}
