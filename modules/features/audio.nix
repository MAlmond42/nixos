{
  flake.nixosModules.audio = {pkgs, ...}: {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    programs.pwvucontrol.enable = true;
  };
}
