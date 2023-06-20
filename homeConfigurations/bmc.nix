{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    imports = [
      inputs.self.homeModules.shell
    ];
    config = {
      programs = {
        alacritty = {
          enable = true;
        };
        bat = {
          enable = true;
        };
        command-not-found = {
          enable = true;
        };
        direnv = {
          enable = true;
          enableZshIntegration = true;
        };
        exa = {
          enable = true;
          enableAliases = true;
          git = true;
          icons = true;
        };
        fzf = {
          enable = true;
          enableZshIntegration = true;
        };
        git = {
          aliases = {
            br = "branch";
            ci = "commit -v";
            clone-wt = "!sh $HOME/.scripts/git-clone-worktrees.sh";
            co = "checkout";
            last = "log -1 HEAD";
            pl = "pull";
            pu = "push";
            sm = "submodule";
            st = "status";
            unstage = "reset HEAD --";
            up = "update";
            update = "pull --ff-only";
            wt = "worktree";
          };
          delta = {
            enable = true;
          };
          enable = true;
        };
        lazygit = {
          enable = true;
        };
        man = {
          enable = true;
        };
        neovim = {
          enable = true;
        };
        tmux = {
          enable = true;
        };
        vim = {
          enable = true;
        };
        zellij = {
          enable = true;
        };
        zoxide = {
          enable = true;
          enableZshIntegration = true;
        };
        zsh = {
          enable = true;
          enableCompletion = true;
          historySubstringSearch = {
            enable = true;
          };
          oh-my-zsh = {
            enable = true;
          };
        };
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
