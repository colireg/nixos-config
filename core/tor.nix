{ ... }:

{
  services.tor = {
    enable = true;
    client.enable = true;
    torsocks.enable = true;
    settings = {
      ExitNodes = "{DE}";
      ControlPort = 9051;
      DNSPort = 9053;
    };
  };
}
