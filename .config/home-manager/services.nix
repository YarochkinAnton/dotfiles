{ config, pkgs, ... }:

{
    systemd.user.services.transmission = {
        Unit = {
            Description = "Torrent service";
        };
        Install = {
            WantedBy = [ "multi-user.target" ];
        };
        Service = {
            ExecStart = "${pkgs.transmission}/bin/transmission-daemon --download-dir=${config.home.homeDirectory}/downloads --watch-dir=${config.home.homeDirectory}/downloads/torrents --foreground";
        };
    };
}
