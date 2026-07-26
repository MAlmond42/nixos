{self, ...}: {
  flake.nixosModules.users = {pkgs, ...}: {
    users.users.mats = {
      isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = ["wheel" "networkmanager"];
      initialPassword = "12345";
    };
    #home-manager.users.mats = self.homeModules.mats;
  };
}
