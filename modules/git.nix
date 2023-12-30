{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init.defaultBranch = "main";
      core.fileMode = false;
      user.name = "matty";
      user.email = "mattyraud@gmail.com";
    };
  };
}
