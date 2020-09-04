{ pkgs, ... }:

{
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable

  programs.git.enable = true;

  programs.git.package = pkgs.buildEnv {
    name  = "myGitEnv";
    paths = with pkgs.gitAndTools; [
      git
      delta # better diff presentation
      gh    # GitHub CLI tool
      hub   # wrapper that augments git
    ];
  };

  programs.git.aliases = {
    # Basic commands
    a   = "add";
    aa  = "add --all";
    d   = "diff";
    pl  = "pull";
    pu  = "push";
    puf = "push --force";
    s   = "status";

    # Checkout commands
    co  = "checkout";
    cob = "checkout -b";
    com = "checkout master";

    # Commit commands
    amend = "commit --amend --no-edit";
    ca    = "commit -a";
    cam   = "commit -a -m";
    cm    = "commit -m";

    # Rebase commands
    rb  = "rebase";
    rba = "rebase --abort";
    rbc = "rebase --continue";
    rbi = "rebase --interactive";
    rbs = "rebase --skip";

    # Reset commands
    r      = "reset HEAD";
    r1     = "reset HEAD^";
    r2     = "reset HEAD^^";
    rhard  = "reset --hard";
    rhard1 = "reset HEAD^ --hard";
    rhard2 = "reset HEAD^^ --hard";

    # Stash commands
    spo  = "stash pop";
    spu  = "stash push";
    spua = "stash push --all";

    # Other commands
    lg = "log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) - %C(green)(%ar)%C(reset) %s %C(italic)- %an%C(reset)%C(magenta bold)%d%C(reset)' --all";
  };

  programs.git.extraConfig = {
    core.editor = "${pkgs.neovim-remote}/bin/nvr --remote-wait-silent -cc split";
    diff.colorMoved = "default";
    pull.rebase = true;
  };
  programs.git.userEmail = "mbourgon@gmail.com";
  programs.git.userName  = "Malo Bourgon";

  # Enhaced diffs
  programs.git.delta.enable = true;
  programs.git.delta.options = {
    theme = "ansi-dark";
  };
}
