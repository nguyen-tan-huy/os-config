let
  configDirs = [
    "hypr"
    "waybar"
    "rofi"
    "kitty"
    "Thunar"
    "pulse"
    "swaync"
    "fastfetch"
    "wallust"
    "wlogout"
    "xfce4"
    "swappy"
    "Kvantum"
  ];
in {
  home.username = "huyhappy";
  home.homeDirectory = "/home/huyhappy";
  home.stateVersion = "25.05";

  home.file = builtins.listToAttrs (map (name: {
    name = ".config/${name}";
    value = {
      source = ../../dotfiles/${name};
      recursive = true;
    };
  }) configDirs);
}
