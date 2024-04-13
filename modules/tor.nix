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
      #UseBridges = true;
      #ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/obfs4proxy";
      #Bridge = "obfs4 45.145.95.6:27015 C5B7CD6946FF10C5B3E89691A7D3F2C122D2117C cert=TD7PbUO0/0k6xYHMPW3vJxICfkMZNdkRrb63Zhl5j9dW3iRGiCx0A7mPhe5T2EDzQ35+Zw iat-mode=0";
    };
  };
}
