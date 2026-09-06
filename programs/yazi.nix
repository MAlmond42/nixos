{inputs, lib, self, ...}: {
    flake.nixosModules.yazi = {pkgs, ...}: {
        programs.yazi = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.yazi;
        };
    };

    perSystem = {pkgs, ...}: {
        packages.yazi = inputs.wrapper-modules.wrappers.yazi.wrap {
            inherit pkgs;
            plugins = with pkgs.yaziPlugins; {
                git = git;
                gvfs = gvfs;
                full-border = full-border;
            };

            settings = {
                yazi = {
                    mgr = {
                        ratio = [2 3 3];
                        sort_by = "natural";
                        sort_sensitive = false;
                        sort_reverse = false;
                        sort_dir_first = true;
                        sort_translit = true;
                        linemode = "size";
                        show_hidden = true;
                        show_symlink = true;
                        mouse_events = [];
                        title_format = "{cwd}";
                    };
                    preview = {
                        wrap = "yes";
                        tab_size = 4;
                        image_filter = "triangle";
                    };
                    opener = {
                        play = [
                            {
                                run = "${lib.getExe pkgs.mpv} %s";
                                orphan = true; for = "linux";
                            }
                        ];
                        edit = [
                            {
                                run = "${lib.getExe pkgs.neovim} %s";
                                block = true; for = "linux";
                            }
                        ];
                    };
                };

                keymap = {
                    mgr = {
                        prepend_keymap = [
                            {
                                on = ["M" "m"];
                                run = "plugin gvfs -- select-then-mount --jump";
                                desc = "Select device to mount and jump to its mount point";
                            }
                            {
                                on = ["M" "R"];
                                run = "plugin gvfs -- remount-current-cwd-device --jump";
                                desc = "Remount device under cwd";
                            }
                            {
                                on = ["M" "m"];
                                run = "plugin gvfs -- select-then-unmount";
                                desc = "Select device then unmount";
                            }
                            {
                                on = ["M" "U"];
                                run = "plugin gvfs -- select-then-unmount --eject";
                                desc = "Select device then eject";
                            }
                            {
                                on = ["M" "a"];
                                run = "plugin gvfs -- add-mount";
                                desc = "Add a GVFS mount URI";
                            }
                            {
                                on = ["M" "e"];
                                run = "plugin gvfs -- edit-mount";
                                desc = "Edit a GVFS mount URI";
                            }
                            {
                                on = ["M" "r"];
                                run = "plugin gvfs -- remove-mount";
                                desc = "Remove a GVFS mount URI";
                            }
                            {
                                on = ["M" "j"];
                                run = "plugin gvfs -- jump-to-device";
                                desc = "Select device then jump to its mount point";
                            }
                        ];
                    };
                };
            };
        };
    };
}
