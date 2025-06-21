{ config, pkgs, ... }: {
  programs.fcitx5 = {
    enable = true;
    addons = [ pkgs.fcitx5-bamboo ];
    profile = {
      defaultLayout = "us";
      defaultInputMethod = "bamboo";
      inputMethodGroups = [
        {
          name = "Default";
          inputMethods = [
            "bamboo"
            "keyboard-us"
          ];
        }
      ];
    };
  };
}

