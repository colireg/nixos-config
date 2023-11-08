{
  services.pcscd.enable = true;
  programs.gnupg.agent = {
     enable = true;
     #pinentryFlavor = "tty";
     #enableSSHSupport = true;
  };
}
