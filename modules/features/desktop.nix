{self, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [
      self.nixosModules.audio
      self.nixosModules.bluetooth
      self.nixosModules.brightness
    ];

    environment.systemPackages = [
      #selfpkgs.terminal
      pkgs.ghostty
      pkgs.pcmanfm
      pkgs.git
      #selfpkgs.noctalia-shell
    ];

    programs = {
      niri.enable = true;
      neovim.enable = true;
    };

    services.xserver.displayManager.lightdm.enable = true;

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      corefonts
      unifont
      dejavu_fonts
    ];

    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };

    services.upower.enable = true;

    security.polkit.enable = true;

    hardware.enableAllFirmware = true;
  };
}
