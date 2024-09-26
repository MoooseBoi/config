{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./users.nix
    ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  # TZ
  time.timeZone = "Israel";

  # network
  networking.hostName = "MooseBox-NIX";
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # X11
  services.xserver.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.libinput.enable = true;

  # audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.pipewire.wireplumber.extraConfig."10-bluez" = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.headset-roles" = [
        "hsp_hs"
        "hsp_ag"
        "hfp_hf"
        "hfp_ag"
      ];
    };
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Name = "Computer";
        ControllerMode = "dual";
        FastConnectable = "true";
        Experimental = "true";
      };
      Policy = { AutoEnable = "true"; };
      LE = { EnableAdvMonInterleaveScan = "true"; };
    };
  };

  services.blueman.enable = true;

  # QMK
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.via ];

  # env variables
  environment.sessionVariables = rec {
    NIXPKGS_ALLOW_BROKEN = 1;
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    SCRIPT_HOME = "$HOME/.config/scripts";
    EDITOR = "nvim";
  };

  # shell
  environment.interactiveShellInit = ''
    alias nv='nvim'
  '';

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "afowler";
    };
  };

  # fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
  ];

  # global packages
  environment.systemPackages = with pkgs; [
    # general
    vim
    git
    tmux
    htop
    firefox

    # util
    ffmpeg
    wget
    killall
    zip
    unzip
    arp-scan
    via
    qmk

    # lib
    libGLU
    libsecret
    steam-run
    gcc11
    mesa
    jdk17
    qemu_full
    nodejs_22

    # X11
    xorg.xrandr
    xorg.xev
    xclip

    # Desktop
    bspwm
    st
    sxhkd
    rofi
    polybar
    picom
    dunst
    libnotify

    # network
    networkmanager
    networkmanagerapplet

    # bluetooth
    blueman

    # media
    pwvucontrol
    feh
    mpv
    maim

    # meme
    neofetch
    cmatrix
  ];

  # version
  system.stateVersion = "24.05";
}

