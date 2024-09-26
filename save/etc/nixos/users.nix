{ config, pkgs, ... }:

{
  users.users.moose = {
    isNormalUser = true;
    createHome = true;

    shell = pkgs.zsh; 

    packages = with pkgs; [
      # general
      zsh
      yt-dlp
      rnote
      zoom-us
      oh-my-zsh

      # dev
      neovim
      rpi-imager
      android-studio
      android-tools
      python3
      cargo
      rustup

      # social
      discord

      # gaming
      steam
      prismlauncher
      minecraft-server
      mcrcon
      fabric-installer
      osu-lazer
    ];

    extraGroups = [ "wheel" ];
  };
}
