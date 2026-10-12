{
  flake.nixosModules.bluetooth = {pkgs, ...}: {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Name = "Nixon";
          ControllerMode = "dual";
          FastConnectable = "true";
          Experimental = "true";
        };
        Policy = {
          AutoEnable = "true";
        };
      };
    };

    services.blueman.enable = true;
  };

  flake.homeModules.bluetooth = {pkgs, ...}: {
    services.mpris-proxy.enable = true;
  };
}
