{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "user";
  home.homeDirectory = "/home/user";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    anki
    bunnyfetch
    calibre
    cava
    cbonsai
    cmatrix
    cowsay
    ente-auth
    fastfetch
    ffmpeg
    figlet
    gh
    git
    gitea
    hyfetch
    hyprland
    lolcat
    mat2
    motrix
    mullvad-browser
    neofetch
    neovim
    nitch
    nodejs_23
    ollama
    pfetch
    pnpm_10
    ponysay
    protonvpn-gui
    pwgen
    ripgrep
    sass
    simplex-chat-desktop
    thefuck
    tor-browser
    tty-clock
    ungoogled-chromium
    unzip
    virtualbox
    wezterm
    yarn
    yt-dlp
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "xNyfPtx";
    userEmail = "55147963+xNyfPtx@users.noreply.github.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      l = "ls";
      c = "cd";
      r = "rm";
      m = "mkdir";
    };
  };

  programs.firefox = {
  enable = true;
  package = pkgs.librewolf;
  policies = {
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    Preferences = {
      "privacy.resistFingerprinting" = true;
      "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" = true;
    };
    ExtensionSettings = {
      "7esoorv3@alefvanoon.anonaddy.me" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/libredirect/latest.xpi";
        installation_mode = "force_installed";
      };
      "tridactyl.vim@cmcaine.co.uk" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim
	/latest.xpi";
        installation_mode = "force_installed";
      };
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
      };
    };
  };
};

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
