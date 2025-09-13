# The home manager config. This thing is awesome.
# I think I should probably make it into a repo in github so I don't
# lose it

{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  home.username = "grants";
  home.homeDirectory = "/home/grants";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    obsidian
    nerd-fonts.fira-code
      (vscode-with-extensions.override {
        vscodeExtensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide
          eamodio.gitlens
          mhutchie.git-graph
        ];
      })
  ];

  home.file = {
  };

  home.sessionVariables = {
    DIRENV_LOG_FORMAT="";
  };

  programs = {

    home-manager = {
      enable = true;
    };

    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "git"
          "direnv"
        ];
      };
    };

    git = {
      enable = true;
      userName = "GSmithApps";
      userEmail = "14.gsmith.14@gmail.com";
    };

    kitty = {
      enable = true;
      settings = {
        font_family = "FiraCode Nerd font";
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.90;
        font.normal.family = "FiraCode Nerd font";
      };
    };

  };
}
