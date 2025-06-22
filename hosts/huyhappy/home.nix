{ config, pkgs, ... }:

{
  home.username = "huyhappy";
  home.homeDirectory = "/home/huyhappy";
  home.stateVersion = "25.05"; # Thay bằng phiên bản phù hợp

  # Sao chép các thư mục cấu hình vào ~/.config/
  home.file = {
    ".config/hypr" = {
      recursive = true;
      source = ../../dotfiles/hypr;
    };
    ".config/fastfetch" = {
      recursive = true;
      source = ../../dotfiles/fastfetch;
    };
    ".config/kitty" = {
      recursive = true;
      source = ../../dotfiles/kitty;
    };
    ".config/pulse" = {
      recursive = true;
      source = ../../dotfiles/pulse;
    };
    ".config/rofi" = {
      recursive = true;
      source = ../../dotfiles/rofi;
    };
    ".config/swappy" = {
      recursive = true;
      source = ../../dotfiles/swappy;
    };
    ".config/swaync" = {
      recursive = true;
      source = ../../dotfiles/swaync;
    };
    ".config/Thunar" = {
      recursive = true;
      source = ../../dotfiles/Thunar;
    };
    ".config/wallust" = {
      recursive = true;
      source = ../../dotfiles/wallust;
    };
    ".config/waybar" = {
      recursive = true;
      source = ../../dotfiles/waybar;
    };
    ".config/wlogout" = {
      recursive = true;
      source = ../../dotfiles/wlogout;
    };
    ".config/xfce4" = {
      recursive = true;
      source = ../../dotfiles/xfce4;
    };
  };

  # Cài đặt các gói cần thiết
  home.packages = with pkgs; [
    pulseaudio # Hoặc pipewire nếu dùng PipeWire
    swaynotificationcenter
    xfce.thunar
    wallust
    wlogout
    xfce.xfce4-settings
  ];
}
