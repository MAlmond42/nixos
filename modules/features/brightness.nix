{
  nixosModules.brightness = {pkgs, ...}: {
    programs.brightnessctl.enable = true;

    services.actkbd = {
      enable = true;
      bindings = [
        {
          keys = [225];
          events = ["key"];
          command = "/run/current-system/sw/bin/brightnessctl set +5%";
        }
        {
          keys = [224];
          events = ["key"];
          command = "/run/current-system/sw/bin/brightnessctl set 5%-";
        }
      ];
    };
  };
}
