{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    homebrew = {
      brews = "rtx"
        "mas"
        "awscli";
      enable = true;
    };
  };
}
