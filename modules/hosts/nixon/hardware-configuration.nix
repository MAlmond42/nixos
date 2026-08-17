{
    flake.nixosModules.nixonConfiguration = {
        config,
        lib,
        pkgs,
        modulesPath,
        ...
        }: {
            imports = [
                (modulesPath + "/installer/scan/not-detected.nix")
            ];

            boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "sdhci_pci"];
            boot.initrd.kernelModules = [];
            boot.kernelModules = ["kvm-amd"];
            boot.extraModulePackages = [];

            fileSystems."/" = {
                device = "/dev/disk/by-uuid/a01984e8-87fa-4ee1-8176-861a428733dd";
                fsType = "ext4";
            };

            fileSystems."/boot" = {
                device = "/dev/disk/by-uuid/F9A7-9682";
                fsType = "vfat";
                options = ["fmask=0077" "dmask=0077"];
            };

            swapDevices = [];

            nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
            hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
        };
}
