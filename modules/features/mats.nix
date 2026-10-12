{self, ...}: {
  flake.nixosModules.mats = {pkgs, ...}: {
    users.users.mats = {
      isNormalUser = true;
      shell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
      extraGroups = ["audio" "input" "networkmanager" "wheel" "seat" "video"];
      initialPassword = "12345";
    };

    home-manager.users.mats = self.homeModules.mats;
  };

  flake.homeModules.mats = {pkgs, ...}: {
    imports = [
      self.homeModules.stylix
      self.homeModules.noctalia
      self.homeModules.tmux
      self.homeModules.bluetooth
    ];

    home = {
      username = "mats";
      homeDirectory = "/home/mats";
    };

    home.stateVersion = "26.05";
  };
}
