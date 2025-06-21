{ pkgs, inputs, ... }: let

  python-packages = pkgs.python3.withPackages (ps: with ps; [
    requests
    pyquery
  ]);

in {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bc baobab btrfs-progs clang curl cpufrequtils duf findutils ffmpeg
    glib gsettings-qt git killall libappindicator libnotify openssl pciutils
    vim wget xdg-user-dirs xdg-utils fastfetch
    (mpv.override { scripts = [mpvScripts.mpris]; })
    inputs.ags.packages.${pkgs.system}.default
    btop brightnessctl cava cliphist loupe gnome-system-monitor grim
    gtk-engine-murrine hypridle imagemagick inxi jq kitty
    libsForQt5.qtstyleplugin-kvantum networkmanagerapplet nwg-displays nwg-look
    nvtopPackages.full pamixer pavucontrol playerctl polkit_gnome libsForQt5.qt5ct
    kdePackages.qt6ct kdePackages.qtwayland kdePackages.qtstyleplugin-kvantum
    rofi-wayland slurp swappy swaynotificationcenter swww unzip wallust
    tree
    wl-clipboard wlogout xarchiver yad yt-dlp google-chrome jetbrains.idea-ultimate
    element-desktop mongodb-compass gitkraken navicat-premium termius

    # fcitx5 và bộ gõ Bamboo
    #fcitx5
    #fcitx5-bamboo
    (pkgs.fcitx5-with-addons.override {
      addons = with pkgs; [ fcitx5-bamboo ];
    })

    # Java 11
    openjdk11
  ] ++ [ python-packages ];

  fonts = {
    packages = with pkgs; [
      dejavu_fonts fira-code fira-code-symbols font-awesome hackgen-nf-font
      ibm-plex inter jetbrains-mono material-icons maple-mono.NF minecraftia
      nerd-fonts.im-writing nerd-fonts.blex-mono noto-fonts noto-fonts-emoji
      noto-fonts-cjk-sans noto-fonts-cjk-serif noto-fonts-monochrome-emoji
      powerline-fonts roboto roboto-mono symbola terminus_font victor-mono
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    waybar.enable = true;
    hyprlock.enable = true;
    firefox.enable = true;
    git.enable = true;

    neovim.enable = true;

    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo mousepad thunar-archive-plugin thunar-volman tumbler
    ];

    virt-manager.enable = false;

    xwayland.enable = true;

    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

#    fcitx5.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        leftalt = "layer(control)";
        leftcontrol = "layer(alt)";
        capslock = "esc";
        esc = "capslock";
      };
    };
  };

  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
  
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-bamboo ];
  };
}
