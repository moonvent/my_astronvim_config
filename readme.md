### Config file for AstroNVIM

#### QuickSetup:

1. Backup older nvim: <pre>mv ~/.config/nvim ~/.config/nvim.bak</pre>, or if you want cold install do this: <pre>sudo rm -r ~/.config/nvim</pre>
2. Backup older plugins: <pre>mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak</pre>, or remove it: <pre>sudor rm -r ~/.local/share/nvim/site</pre>
3. Clone AstroNVIM: <pre>git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim</pre>
4. Sync and update packages: <pre>nvim +PackerSync</pre>

Okay, AstroNVIM installed, next it install our dependencies and packages;

All next commands input in command line vim (throught :)

1. <pre>LspInstall pyright</pre>
2. <pre>TSInstall python</pre>
3. For install new packages you MUST write this packages in <pre>plugins</pre> section, and RESTART nvim, and after that write <pre>PackerInstall</pre>
4. For update AstroNVIM (if you need it ;) ) <pre>AstroUpdate</pre>

Okay, we install dependencies for developing on python, next dependencies for comfortable developing and coding:

1. Create config nvim folder: <pre>cp -r ~/.config/nvim/lua/user_example/ ~/.config/nvim/lua/user/</pre>
2. After that go to this directory <pre>cd ~/.config/nvim/lua/user/</pre> and open <pre>nvim init.lua</pre>
3. And setup config :)
4. Or, you can do <pre>git clone https://github.com/moonvent/my_astronvim_config.git</pre> and make <pre>nvim +PackerInstall</pre>
5. If in prev point you are get error, comment section after <pre>Debug</pre> and repeat it, after that uncomment this section for debugger)


