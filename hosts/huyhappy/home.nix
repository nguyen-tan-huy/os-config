{ config, pkgs, ... }:

{
  home.username = "huyhappy";
  home.homeDirectory = "/home/huyhappy";
  home.stateVersion = "24.05"; # Thay bằng phiên bản phù hợp

  # Sao chép các thư mục cấu hình vào ~/.config/
  home.file = {
    ".config/hypr" = {
      recursive = true;
      source = ../../../hypr; # Đường dẫn tới thư mục hypr trong repo
    };
    ".config/fastfetch" = {
      recursive = true;
      source = ../../../fastfetch;
    };
    ".config/kitty" = {
      recursive = true;
      source = ../../../kitty;
    };
    ".config/Kvantum" = {
      recursive = true;
      source = ../../../Kvantum;
    };
    ".config/pulse" = {
      recursive = true;
      source = ../../../pulse;
    };
    ".config/rofi" = {
      recursive = true;
      source = ../../../rofi;
    };
    ".config/swappy" = {
      recursive = true;
      source = ../../../swappy;
    };
    ".config/swaync" = {
      recursive = true;
      source = ../../../swaync;
    };
    ".config/Thunar" = {
      recursive = true;
      source = ../../../Thunar;
    };
    ".config/wallust" = {
      recursive = true;
      source = ../../../wallust;
    };
    ".config/waybar" = {
      recursive = true;
      source = ../../../waybar;
    };
    ".config/wlogout" = {
      recursive = true;
      source = ../../../wlogout;
    };
    ".config/xfce4" = {
      recursive = true;
      source = ../../../xfce4;
    };
  };

  # Cài đặt các gói cần thiết
  home.packages = with pkgs; [
    hyprland
    hyprlock
    hypridle
    fastfetch
    kitty
    kvantum
    pulseaudio # Hoặc pipewire nếu dùng PipeWire
    rofi-wayland
    swappy
    swaynotificationcenter
    thunar
    wallust
    waybar
    wlogout
    xfce.xfce4-settings
  ];
}
