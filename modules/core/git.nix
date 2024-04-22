{ username, email, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init.defaultBranch = "main";
      core.fileMode = false;
      core.pager = "cat";
      merge.tool = "vimdiff";
      user.signingkey = email;
      commit.gpgsign = true;
      user.name = username;
      user.email = email;
      alias.l = "log --graph --oneline --decorate --all";
    };
  };
}
