{
    flake.nixosModules.fun = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
            cava
            pipes
            cbonsai
            cmatrix
            cowsay
        ];
    };
}
