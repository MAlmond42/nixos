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

  flake.nixosModules.nixonConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.desktop

      inputs.home-manager.nixosModules.default
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];

    nixpkgs.config.allowUnfree = true;

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;

      loader = {
        grub = {
          enable = true;
          efiSupport = true;
          device = "nodev";
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };

      kernelParams = ["quiet"];
      kernelModules = ["mt7921e"];

      plymouth.enable = true;
    };

    networking = {
      hostName = "nixon";
      networkmanager.enable = true;

      firewall = {
        enable = true;
        allowedTCPPorts = [5173];
      };
    };

    services = {
      flatpak.enable = true;
      udisks2.enable = true;
      printing.enable = true;

      tlp = {
        enable = true;
        pd.enable = true;
      };
    };

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      amdgpu.opencl.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    system.stateVersion = "25.11";
  };
}
