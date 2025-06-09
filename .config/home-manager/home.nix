{ pkgs, lib, ... }:

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

    home.packages =
    with pkgs;
    let
        fonts = [
            (iosevka-bin.override {
                variant = "SGr-IosevkaTerm";
            })
            iosevka
            noto-fonts-color-emoji
        ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
        development = [
            difftastic
            enumer
            go
            maven
            nodejs
            nodePackages.prettier
            yarn
            (python3.withPackages (python-pkgs: [
                python-pkgs.jinja2
                python-pkgs.regex
                python-pkgs.requests
                python-pkgs.bcrypt
            ]))
        ];
        security = [
            cfssl
            gitleaks
            pre-commit
            semgrep
            thc-hydra
            vault
            zap
        ];
        operations = [
            ansible
            ansible-language-server
            ansible-lint
            argocd
            cilium-cli
            fluxcd
            hubble
            krew
            kubectl
            kubectx
            kubernetes-helm
            k9s
            lazygit
            popeye
            rsync
            terraform
            tokei
            urlencode
        ];
        documenting = [
            drawio
            gimp
            inkscape
            pandoc
            zk
        ];
        network = [
            bandwhich
            grepcidr
            nekoray
            nmap
            tcpdump
            iperf
        ];
        database = [
            postgresql
        ];
        media = [
            hyprshot
            pavucontrol
            playerctl
            pulsemixer
            ueberzugpp
            vlc
        ];
        qol = [
            bat
            du-dust # du + rust
            fd
            fzf
            htop
            jq
            man-pages
            moreutils
            ranger
            ripgrep
            sd
            tldr
            tmux
            unrar
            unzip
            wl-clip-persist
            yazi
            zip
            zoxide
        ];
        containers = [
            fuse-overlayfs
            runc
            slirp4netns
            dive
        ];
        fs = [
            borgbackup
            dosfstools
            e2fsprogs
            udisks
        ];
        remote = [
            freerdp
            rdesktop
        ];
        desktop = [
            mako
            gammastep
            rofi-wayland
            waybar
        ];
    in
    containers
    ++ database
    ++ desktop
    ++ development
    ++ documenting
    ++ fonts
    ++ fs
    ++ media
    ++ network
    ++ operations
    ++ qol
    ++ remote
    ++ security
    ++ [
        transmission
    ];

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "vault"
        "unrar"
        "terraform"
        "drawio"
    ];

    fonts.fontconfig.enable = true;

    programs.waybar = {
        enable = true;
        systemd.enable = true;
    };
    programs.neovim = {
        enable = false;
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
                "kubectl"
                "kube-ps1"
            ];
            custom = "$HOME/.config/.oh-my-zsh/custom";
            theme = "catppuccin-mocha";
        };
        envExtra = ''
            DOTFILES=$HOME/.dotfiles
            PATH=$HOME/.nix-profile/bin:$PATH
            PATH=$HOME/.krew/bin:$PATH
            PATH=$HOME/.cargo/bin:$PATH
            GOPATH=$HOME/documents/code/go
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
        vim = "nvim";
        cd = "z";
        sctl = "systemctl";
        sctlu = "systemctl --user";
        jctl= "journalctl";
        jctlu = "journalctl --user";
        dotfiles = "vim $DOTFILES";
        switch = "home-manager switch";
        "так-стоп-нахуй" = "shutdown now";
        notes = "cd $HOME/documents/mind-vault && vim $HOME/documents/mind-vault/Home.md && cd -";
        pkgs = "vim $DOTFILES/.config/home-manager/home.nix";
        ktx = "kubectx";
        kns = "kubens";
        cb = "cargo build";
        cbr = "cargo build --release";
    };

    home.file = {};

    home.sessionVariables = {
      EDITOR = "nvim";
      # LC_ALL = "ru_RU.UTF-8";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
