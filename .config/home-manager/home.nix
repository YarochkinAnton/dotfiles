{ config, pkgs, lib, ... }:

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

    home.packages = [
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
            python-pkgs.requests
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
        pkgs.urlencode
        pkgs.gitleaks
        pkgs.pre-commit
        pkgs.popeye
        pkgs.sd
        pkgs.hubble
        pkgs.tcpdump
        pkgs.tmux
        pkgs.kubectx
        pkgs.argocd
        pkgs.bandwhich
        pkgs.fluxcd
        pkgs.nmap
        pkgs.zap
        pkgs.wl-clip-persist
        pkgs.moreutils
        pkgs.terraform
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "terraform"
    ];

    fonts.fontconfig.enable = true;

    programs.waybar = {
        enable = true;
        systemd.enable = true;
    };
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        package = pkgs.neovim;
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
                "kubectl"
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
        notes = "cd $HOME/documents/mind-vault && vim $HOME/documents/mind-vault/Home.md && cd -";
    };

    home.file = {};

    home.sessionVariables = {
      # EDITOR = "emacs";
      # LC_ALL = "ru_RU.UTF-8";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
