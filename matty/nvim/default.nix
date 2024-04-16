{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;
    extraPackages = with pkgs; [
      rust-analyzer
      lua-language-server
      nodePackages.typescript-language-server
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
	      config = builtins.readFile ./telescope.lua;
        type = "lua";
      }
      {
        plugin = dracula-nvim;
	      config = builtins.readFile ./dracula.lua;
        type = "lua";
      }
      {
        plugin = nvim-treesitter.withPlugins (p: [ p.javascript p.typescript p.json p.lua p.nix ]);
        config = builtins.readFile ./treesitter.lua;
        type = "lua";
      }
      {
        plugin = lsp-zero-nvim;
        config = builtins.readFile ./lsp-zero.lua;
        type = "lua";
      }
      {
        plugin = undotree;
        config = builtins.readFile ./undotree.lua;
        type = "lua";
      }
      {
        plugin = vim-fugitive;
        config = builtins.readFile ./fugitive.lua;
        type = "lua";
      }
    ];  
  };
}
