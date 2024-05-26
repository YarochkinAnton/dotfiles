{ config, pkgs, ... }:

{
    imports = [
        ./services.nix
    ];
    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "poplav";
    home.homeDirectory = "/home/poplav";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # pkgs.hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
        pkgs.htop
        pkgs.vlc
        pkgs.ansible
        pkgs.ansible-language-server
        pkgs.ansible-lint
        pkgs.bat
        pkgs.borgbackup
        pkgs.butane # For coreos configuration conversion
        pkgs.cilium-cli
        pkgs.du-dust # du + rust
        pkgs.fd
        pkgs.freerdp
        pkgs.fzf
        pkgs.gimp
        pkgs.go
        pkgs.pandoc
        pkgs.kubernetes-helm
        pkgs.ranger
        # TODO: fix glfw error
        pkgs.imhex
        pkgs.hyprshot
        pkgs.jq
        pkgs.lazygit
        pkgs.mako
        # pkgs.musescore
        pkgs.nodejs
        # TODO: Apply this non-NixOS fix
        # https://github.com/ch1bo/dotfiles/blob/c17d07e783f71988b9be27185f94b75667c8b9f6/hosts/matterhorn/default.nix#L10
        pkgs.obs-studio
        pkgs.pavucontrol
        pkgs.pulsemixer
        pkgs.inkscape
        pkgs.rdesktop
        pkgs.rofi-wayland
        pkgs.rsync
        pkgs.step-cli
        pkgs.telegram-desktop
        pkgs.tldr
        pkgs.tokei
        pkgs.ueberzugpp
        pkgs.unzip
        pkgs.zip
        pkgs.transmission
        pkgs.udisks
        pkgs.e2fsprogs
        pkgs.dosfstools
        (pkgs.python3.withPackages (python-pkgs: [
            python-pkgs.jinja2
            python-pkgs.regex
        ]))
        (pkgs.iosevka-bin.override {
            variant = "SGr-IosevkaTerm";
        })
        pkgs.iosevka
        pkgs.kubectl
        pkgs.yarn
        pkgs.zoxide
        pkgs.krew
        pkgs.fuse-overlayfs
        pkgs.slirp4netns
        pkgs.runc
        pkgs.playerctl
        pkgs.xkb-switch
        pkgs.semgrep
        pkgs.terminus_font
        pkgs.maven
    ];

    fonts.fontconfig.enable = true;

    programs.waybar = {
        enable = true;
        systemd.enable = true;
    };
    #
    # nixpkgs.overlays = [
    #     (import (builtins.fetchTarball {
    #         url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    #     }))
    # ];
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    programs.ripgrep = {
        enable = true;
    };

    programs.k9s = {
        enable = true;
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
                "systemd"
                "fzf"
                "kube-ps1"
            ];
            custom = "$HOME/.config/.oh-my-zsh/custom";
            theme = "nord";
        };
        envExtra = ''
            DOTFILES=$HOME/.dotfiles
            PATH=$HOME/.nix-profile/bin:$PATH
            PATH=$HOME/.krew/bin:$PATH
        '';
        initExtra = ''
            umask 077
        '';
    };

    programs.zoxide = {
        enable = true;
    };

    programs.fzf = {
        enable = true;
    };

    home.shellAliases = {
        cd = "z";
        sctl = "systemctl";
        sctlu = "systemctl --user";
        jctl= "journalctl";
        jctlu = "journalctl --user";
        dotfiles = "vim $DOTFILES";
        switch = "home-manager switch";
        "так-стоп-нахуй" = "shutdown now";
        notes = "cd $HOME/documents/mind-vault";
    };


    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. If you don't want to manage your shell through Home
    # Manager then you have to manually source 'hm-session-vars.sh' located at
    # either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/poplav/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
      # EDITOR = "emacs";
      # LC_ALL = "ru_RU.UTF-8";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
