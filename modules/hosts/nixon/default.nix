{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixon = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.nixonConfiguration
    ];
  };
}
