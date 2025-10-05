{
  pkgs,
  self,
  secrets,
  ...
}:

{
  nix.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  ids.gids.nixbld = 350;

  system.configurationRevision = self.rev or self.dirtyRev or null;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;

  users.users.${secrets.username} = {
    name = secrets.username;
    home = "/Users/${secrets.username}";
  };

  system.primaryUser = secrets.username;

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.4;
      tilesize = 64;
      show-recents = false;
    };
    finder = {
      FXPreferredViewStyle = "Nlsv";
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };
    menuExtraClock = {
      Show24Hour = true;
      ShowDate = 1;
      ShowDayOfWeek = true;
    };
    NSGlobalDomain = {
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
    };
  };

  environment.systemPackages = [ ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
}
