{
    flake.nixosModules.apps = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            audacity
            bitwarden-desktop
            davinci-resolve
            gimp
            onlyoffice-desktopeditors
            libresprite
            lutris
            obs-studio
            obsidian
            postman
            prismlauncher
            mpv
            thunderbird
            virtualbox
            pkgsRocm.blender
            ardour
            heroic
            godot
            protonplus
            nautilus
            gnome.gvfs
            lmstudio
            element-desktop

        ];
    };
}
