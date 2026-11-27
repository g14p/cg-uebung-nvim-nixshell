# My NVF Config
{
  pkgs,
  lib,
  ...
}: {
  vim = {
    viAlias = false;
    vimAlias = false;
    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };

    # vim.opts and vim.options are aliased
    options = {
      shiftwidth = 2; # Number of spaces to use for each step of (auto)indent
      tabstop = 2; # Number of spaces a <Tab> in the file counts for
      softtabstop = 2; # Number of spaces that <Tab> counts for while editing
      expandtab = true; # Convert tabs to spaces
      spelllang = lib.mkForce "en_us,de_de";
    };
    # Netrw -------------------------------------------------------------------------------
    globals.netrw_winsize = 20;
    globals.netrw_banner = 0;
    globals.netrw_liststyle = 3;

    #Oil replaces netrw for dired xp
    utility.oil-nvim = {
      enable = true;
      setupOpts = {
        #default_file_explorer = true; # Overwrite netrw
        columns = [
          "icon"
          #"permissions"
          #"size"
          #"mtime"
        ];
      };
    };
    #extraPlugins."netrw.nvim".package = pkgs.vimPlugins.netrw-nvim;
    extraPlugins = {
      netrw-nvim = {
        package = pkgs.vimPlugins.netrw-nvim;
        setup = ''
          require("netrw").setup({
            use_devicons = true,
          })
        '';
      };
    };

    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
    };

    lsp = {
      # This must be enabled for the language modules to hook into
      # the LSP API.
      enable = true;

      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = !true; # conflicts with blink in maximal
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    # This section does not include a comprehensive list of available language modules.
    # To list all available language module options, please visit the nvf manual.
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      # Languages that will be supported in default and maximal configurations.
      nix.enable = true;
      markdown.enable = true;

      # Languages that are enabled in the maximal configuration.
      bash.enable = true;
      clang.enable = true;
      cmake.enable = true;
      css.enable = true;
      scss.enable = true;
      html.enable = true;
      json.enable = true;
      sql.enable = true;
      java.enable = true;
      kotlin.enable = true;
      typescript.enable = true;
      go.enable = true;
      lua.enable = true;
      zig.enable = true;
      python.enable = true;
      typst.enable = true;
      toml.enable = true;
      xml.enable = true;
      tex.enable = true;
      docker.enable = true;
      env.enable = true;
      glsl.enable = true;
      csharp.enable = true;
      fish.enable = true;
      make.enable = true;
      assembly.enable = true;
      awk.enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = false;
      neoscroll-nvim.enable = false;
      twilight-nvim.enable = false;
      satellite-nvim.enable = false;
      nvim-web-devicons.enable = true; # ------------- also for netrw tis nice
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      #blink-indent.enable = true; -------------------------------------------------------------readd if u want a indent blink
      indent-blankline.enable = true;

      # Fun
      cellular-automaton.enable = false;
    };

    statusline = {
      lualine = {
        enable = false; #-------------------------------------------------------------readd if u want no macro help anymore. given the statusline was kinda cool

        integrations.breadcrumbs = {
          vanilla.enable = !true;
          nvim-navic.enable = true;
          navbuddy.enable = true;
          lspsaga.enable = false;
        };
      };
    };

    theme.style = "dark";

    autopairs.nvim-autopairs.enable = true;

    # nvf provides various autocomplete options. The tried and tested nvim-cmp
    # is enabled in default package, because it does not trigger a build. We
    # enable blink-cmp in maximal because it needs to build its rust fuzzy
    # matcher library.
    autocomplete = {
      nvim-cmp.enable = !true;
      blink-cmp.enable = true;
    };

    snippets.luasnip.enable = true;

    filetree = {
      neo-tree = {
        enable = false;
      };
    };

    tabline = {
      nvimBufferline.enable = false; # NOTE letsee
    };

    treesitter.context.enable = false; # NOTE treesitter context is annoying

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = false; # i dont think i need coming from vim
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
      neogit.enable = true;
    };

    utility = {
      ccc.enable = false;
     diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      qmk-nvim.enable = false; # requires hardware specific options
      icon-picker.enable = true;
      surround.enable = true;
      leetcode-nvim.enable = true;
      multicursors.enable = false;
      smart-splits.enable = true;
      undotree.enable = true;
      nvim-biscuits.enable = true;

      images = {
        image-nvim.enable = false;
        img-clip.enable = true;
      };
    };

    notes = {
      todo-comments.enable = true; # nothing TODO here
    };

    terminal = {
      toggleterm = {
        enable = true;
        setupOpts.direction = "horizontal"; # NOTE i think it helps
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      dropbar-nvim.enable = false;
      colorizer.enable = true;
      modes-nvim.enable = false; # the theme looks terrible with catppuccin
      illuminate.enable = true;
      smartcolumn = {
        enable = false;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        cmp.enable = true;
      };
      codecompanion-nvim.enable = false;
      avante-nvim.enable = false; # prevent lib loading errors
    };
    comments = {
      comment-nvim.enable = true;
    };

    #----------------------------------------------------- my personal configuration
    additionalRuntimePaths = ["~/configs/nvim"];

    filetype.pattern = {
      "%.env%..*" = "sh"; # .env.local, .env.production, ...
      "^%.env$" = "sh"; # plain .env (or use vim.filetype.filename.".env" instead)
    };
    # ----------------------------------------------------
    # Keymaps I needs.
    # ----------------------------------------------------
    keymaps = [
      # Map M-e (Alt+e) to toggle Netrw in Normal Mode
      {
        key = "<M-e>";
        mode = ["n"];
        action = ":aboveleft 30vnew | Oil<CR>";
        silent = true;
      }
      {
        key = "<M-x>";
        mode = ["n"];
        action = "10<C-w>hZZ<C-w>h";
        silent = true;
      }


      # Fast Scrolling..
      {
        key = "<S-j>";
        mode = ["n"];
        action = "2<C-e>2j";
        silent = true;
      }
      {
        key = "<S-k>";
        mode = ["n"];
        action = "2<C-y>2k";
        silent = true;
      }
    ];
  };
}
