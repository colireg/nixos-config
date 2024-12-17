{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:

lib.mkMerge [
  {
    # Packages
    home.packages = with pkgs; [
      # Gui
      vlc
      libreoffice
      gimp
      telegram-desktop
      chromium
      tor-browser-bundle-bin
      obsidian
      imhex
      anki
      firefox
      remmina
      # Tools
      hunspell # Spell check for LibreOffice
      evince
      mpv
      papirus-icon-theme
      emacs-gtk
    ];
    programs.vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
    };
  }
  {
    # Unstable packages
    home.packages = with pkgs-unstable; [
      zed-editor
      qbittorrent
    ];
  }
  {
    # Bluetooth
    services.mpris-proxy.enable = true;
  }
  {
    # Neovim
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaConfig = builtins.readFile ./nvim/init.lua;
      extraPackages = with pkgs; [
        rust-analyzer
        lua-language-server
        nixd
        xclip
        pyright
        pylint
        elixir-ls
      ];

      plugins = with pkgs.vimPlugins; [
        # LSP
        nvim-lspconfig
        nvim-cmp
        cmp-buffer
        cmp-path
        cmp_luasnip
        cmp-nvim-lsp
        cmp-nvim-lua
        luasnip
        friendly-snippets

        {
          plugin = telescope-nvim;
          config = builtins.readFile ./nvim/telescope.lua;
          type = "lua";
        }
        {
          plugin = nvim-treesitter.withAllGrammars;
          config = builtins.readFile ./nvim/treesitter.lua;
          type = "lua";
        }
        {
          plugin = lsp-zero-nvim;
          config = builtins.readFile ./nvim/lsp-zero.lua;
          type = "lua";
        }
        {
          plugin = undotree;
          config = builtins.readFile ./nvim/undotree.lua;
          type = "lua";
        }
        {
          plugin = vim-fugitive;
          config = builtins.readFile ./nvim/fugitive.lua;
          type = "lua";
        }
      ];
    };
  }
  {
    # Misc
    home.username = "matty";
    home.homeDirectory = "/home/matty";
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  }
]
