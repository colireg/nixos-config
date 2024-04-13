{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init.defaultBranch = "main";
      core.fileMode = false;
      core.pager = "cat";
      merge.tool = "vimdiff";
      user.signingkey = "8CC13F3CE583BF17387569202694C8669C1CF28E";
      commit.gpgsign = true;
      user.name = "matty";
      user.email = "mattyraud@gmail.com";
      alias.l = "log --graph --oneline --decorate --all";
    };
  };
}
