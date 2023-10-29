{
  projectRootFile = "flake.nix";
  programs = {
    alejandra = {
      enable = true;
    };
    deadnix = {
      enable = true;
    };
    mdformat = {
      enable = true;
    };
    taplo = {
      enable = true;
    };
    yamlfmt = {
      enable = true;
    };
    statix = {
      enable = true;
    };
  };
}
