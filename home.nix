{ config, pkgs, ... }:

{
# TODO please change the username & home directory to your own
    home.username = "leroy";
    home.homeDirectory = "/home/leroy";

# link the configuration file in current directory to the specified location in home directory
# home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

# link all files in `./scripts` to `~/.config/i3/scripts`
# home.file.".config/i3/scripts" = {
#   source = ./scripts;
#   recursive = true;   # link recursively
#   executable = true;  # make all files executable
# };

# encode the file content in nix configuration file directly
# home.file.".xxx".text = ''
#     xxx
# '';

# set cursor size and dpi for 4k monitor
    xresources.properties = {
        "Xcursor.size" = 16;
        "Xft.dpi" = 172;
    };

# Packages that should be installed to the user profile.
    home.packages = with pkgs; [
# here is some command line tools I use frequently
# feel free to add your own or remove some of them

# gui
        firefox
            discord
            spotify
            obsidian
            emacs
            pavucontrol
            vesktop
            hyprpaper
            lxsession
            pipewire
            pulseaudio
            networkmanagerapplet
            gammastep
            dunst
            libnotify
            nwg-look
            neofetch
            yazi # terminal file manager
            rustup
            cava
            deadbeef
            zathura
            yadm
            qview
            mpv
            kitty
            gimp
            kdenlive
            ark
            pfetch

# archives
            zip
            xz
            unzip
            p7zip

# utils
            ripgrep # recursively searches directories for a regex pattern
            jq # A lightweight and flexible command-line JSON processor
            yq-go # yaml processor https://github.com/mikefarah/yq
            eza # A modern replacement for ‘ls’
            fzf # A command-line fuzzy finder

# misc
            cowsay
            file
            which
            tree
            gnused
            gnutar
            gawk
            zstd
            gnupg

            nix-output-monitor

# productivity
            hugo # static site generator
            glow # markdown previewer in terminal

            btop  # replacement of htop/nmon
            iotop # io monitoring
            iftop # network monitoring

# system tools
            sysstat
            lm_sensors # for `sensors` command
            ethtool
            pciutils # lspci
            usbutils # lsusb
            ];

# programs.hyprland.enable = true;
# programs.dunst.enable = true;
    programs.waybar.enable = true;
    programs.wofi.enable = true;
    programs.neovim.enable = true;

# basic configuration of git, please change to your own
    programs.git = {
        enable = true;
        userName = "leroy";
        userEmail = "lpdkt@proton.me";
    };

# starship - an customizable prompt for any shell
    programs.starship = {
        enable = true;
    };

# alacritty - a cross-platform, GPU-accelerated terminal emulator
    programs.alacritty = {
        enable = true;
    };

    programs.foot = {
        enable = true;
    };

    programs.bash = {
        enable = true;
        enableCompletion = true;
# TODO add your custom bashrc here
    };

(pkgs.discord.override {
  # remove any overrides that you don't want
  withOpenASAR = true;
  withVencord = true;
})



# This value determines the home Manager release that your
# configuration is compatible with. This helps avoid breakage
# when a new home Manager release introduces backwards
# incompatible changes.
#
# You can update home Manager without changing this value. See
# the home Manager release notes for a list of state version
# changes in each release.
    home.stateVersion = "23.11";

# Let home Manager install and manage itself.
    programs.home-manager.enable = true;
}
