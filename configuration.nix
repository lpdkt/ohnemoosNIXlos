{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    
    boot.initrd.kernelModules = [ "amdgpu" ];
    networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
        networking.networkmanager.enable = true;
# Set your time zone.
    time.timeZone = "Europe/Berlin";

# Select internationalisation properties.
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

# Configure keymap in X11
    services.xserver = {
        layout = "en";
        xkbVariant = "us";
    };

# Configure console keymap
    console.keyMap = "us";

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.leroy = {
        isNormalUser = true;
        description = "leroy";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.pulseaudio = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
            wget
            curl
            git
	    pulseaudio
		pipewire

    ];
    nixpkgs.config.permittedInsecurePackages = [
        "electron-25.9.0"
    ];

    environment.variables.EDITOR = "vim";
    users.users.leroy.shell = pkgs.zsh;
    users.users.leroy.useDefaultShell = true;

    programs.hyprland.enable = true;
    programs.zsh.enable = true;
    programs.thunar.enable = true;
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    system.stateVersion = "23.11"; # Did you read the comment?


        fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" ]; })
        ];


}
