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
4. For update AstroNVIM (if you need it 😁 ) <pre>AstroUpdate</pre>

Okay, we install dependencies for developing on python, next dependencies for comfortable developing and coding:

1. Create config nvim folder: <pre>cp -r ~/.config/nvim/lua/user_example/ ~/.config/nvim/lua/user/</pre>
2. After that go to this directory <pre>cd ~/.config/nvim/lua/user/</pre> and open <pre>nvim init.lua</pre>
3. And setup config :)
4. Or, you can do <pre>git clone https://github.com/moonvent/my_astronvim_config.git</pre> and make <pre>nvim +PackerInstall</pre>
5. If in prev point you are get error, comment section after <pre>Debug</pre> and repeat it, after that uncomment this section for debugger)


#### Project Setup for start working

1. **For Python debug work**  Create in root project directory file <pre>pyrightconfig.json</pre> with this data: <pre>
{
  "venv": "venv",
  "venvPath": "."
}
</pre><br>
Also, you need install debugpy <pre>pip install debugpy</pre> and a few packages for correct work:
For correct work autocompletes
<pre>pip install jedi</pre>
For correct work with nvim (a few features needed for nvim)
<pre>pip install pynvim</pre>
For correct work sftp
<pre>pip install pysftp</pre>

2. **For SFTP Work**  Create in root project directory file <pre>.hsftp</pre> <pre>
host   localhost
user   user
pass   password
port   22
remote /root/
confirm_download 0
confirm_upload 0
</pre>
- For upload use command <pre>:Hupload</pre> or <pre>leader - hsu</pre><br>
- For download use command <pre>:Hdownload</pre> or <pre>leader - hsd</pre>
- For upload all dir use command <pre>:Hupdir</pre> or <pre>leader - hsf</pre>
More details: https://github.com/hesselbom/vim-hsftp


#### What can do this config?

- [x] Analyze Python code (for dev);
- [x] Analyze Lua code (for dev nvim 😁);
- [x] Debug Python code;
- [x] Send files with protocol sftp;
- [ ] Comfortable commit tool and with it load on server new changes;
