### Config file for AstroNVIM

#### QuickSetup:

1. Backup older nvim: `mv ~/.config/nvim ~/.config/nvim.bak`, or if you want cold install do this: `sudo rm -r ~/.config/nvim`
2. Backup older plugins: `mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak`, or remove it: `sudor rm -r ~/.local/share/nvim/site`
3. Clone AstroNVIM: `git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim`
4. Sync and update packages: `nvim +PackerSync`

Okay, AstroNVIM installed, next it install our dependencies and packages;

All next commands input in command line vim (throught :)

1. `LspInstall pyright`
2. `TSInstall python`
3. For install new packages you MUST write this packages in `plugins` section, and RESTART nvim, and after that write `PackerInstall`
4. For update AstroNVIM (if you need it ;) ) `AstroUpdate`

Okay, we install dependencies for developing on python, next dependencies for comfortable developing and coding:

1. Create config nvim folder: `cp -r ~/.config/nvim/lua/user_example/ ~/.config/nvim/lua/user/`
2. After that go to this directory `cd ~/.config/nvim/lua/user/` and open `nvim init.lua`
3. And setup config :)
4. Or, you can do `git clone https://github.com/moonvent/my_astronvim_config.git` and make `nvim +PackerInstall`
5. If in prev point you are get error, comment section after `Debug` and repeat it, after that uncomment this section for debugger)


