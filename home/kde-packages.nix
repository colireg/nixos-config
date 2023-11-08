{ pkgs, ... }:
{
  home.packages = (with pkgs.libsForQt5; [
    kate # Text editor
    kdeconnect-kde
    kcalc
    filelight # Disk usage statistics
    kcharselect # Chatacter select
    kget # Download manager
    akregator # RSS reader
    konversation # IRC client
    neochat # Matrix client
  ]) ++ (with pkgs; [
    partition-manager
  ]);
}
