## Holistic vim + tmux

Chances are if you're here, you already know the advantages of using tmux: you can leave your computer at work, and with a little SSH-fu pick up exactly where you left off, whether from home or from a tablet in a coffee shop. Remote pairing is as easy as having someone else connect to your tmux session.

Of course this requires console-mode vim (or emacs, or pico, or...). For those coming from MacVim or gvim, that means giving up GUI menus, some of your favorite key-bindings (ANSI terminals don't know WTF a Cmd key is), and learning to live with 256 colors. It's worth it.

vim and tmux share a number of concepts, but frustratingly different terminology: tabs, panes, windows, sessions, buffers... worse, the key-bindings to manage these are very different out of the box. These vim/tmux config files aim to add some predictability to the key-bindings between vim, tmux, and even some plugins.

These are just simple config files, not a massive project such as [SPF13](https://github.com/spf13/spf13-vim) or [Janus](https://github.com/carlhuda/janus). Those projects also provide collections of plugins and mappings for vim only that work well together. In my experience they tend to be slow, turn on a glut of unwanted features, and alter the vim ecosystem such that *when* something goes wrong, it's not obvious where to look. Like many vim users, I started over with just a package manager, then added plugins as I needed them. It's a growing list, but at least it means I'm learning and configuring them one-by-one. It's a great way to learn.

If you want to do the same, this is for you.

### Installation

Fork this repo to, say, `~/git/holistic-vim-tmux`, and back up your existing config:
```
$ cd ~
$ mv .vim .vim-
$ mv .vimrc .vimrc-
$ mv .tmux.conf .tmux.conf-
```

...link your config files to the forked repo:
```
$ ln -s PATH/TO/git/holistic-vim-tmux .vim
$ ln -s .vim/vimrc .vimrc
$ ln -s .vim/tmux.conf .tmux.conf
```

...and then start vim (but not tmux), telling it to install missing plugins:
```
$ vi -c PluginInstall
```

Expect some fireworks from vim, since none of the plugins exist yet. That's fine. Let the installer finish, then quit and restart vim. 

#### Powerline Fonts

Notice the weird characters in the status bars?

![status_line_borked](https://raw.githubusercontent.com/hoodslide/holistic-vim-tmux/master/assets/statusline-sans-powerline-fonts.jpg)

That's courtesy of the [Airline](https://github.com/bling/vim-airline) and [Tmuxline](https://github.com/edkolev/tmuxline.vim) plugins, which rely on custom fonts to draw prettier status lines with symbols for branching and such. You can uninstall these plugins, or else install [Powerline fonts](https://github.com/powerline/fonts) so the special characters will render properly. "Droid Sans Mono for Powerline" is a good choice:

![status line](https://raw.githubusercontent.com/hoodslide/holistic-vim-tmux/master/assets/statusline.jpg)

#### Adding 256 color support

Colors look stoopid? vim/tmux support 256 colors, but your terminal may not be configured to display them properly. Try this:

Add an alias to your shell's startup script:

```alias tmux='TERM=screen-256color-bce tmux -u'```

Weirdly, just setting `export TERM=...` before calling tmux, or setting utf8 from within the tmux.conf rather than passing in `-u`, was *not* sufficient to enable 256 colors consistently across various terminal clients.
* If you're using iTerm2, edit your profile, and under the [Terminal] tab, set the Report Terminal Type option to `xterm-256color`
* On an iPad, [vSSH](http://www.velestar.com/Pages/VSSHIOSPage.aspx) is a great choice. It even supports mouse mode, if you want easy scrolling and the ability to drag-resize tmux and vim panes. Again, you'll need to set the "Terminal type" to `xterm-256color` in the advanced section at the bottom. Sadly, no support for Powerline fonts yet, though the developers are "considering it."
* Windows users, try Putty
* Linux users probably already have a system  ;)

Once done, you'll need to completely quit and restart tmux (you can't just detach). Ensure the alias is set before restarting.

### Plugins

Here's the plugins being used. Again, turn off anything you don't want, need or understand yet via the vimrc.plugins and vimrc.keymap files. Most plugins, you can type `:help PLUGIN_NAME`, or go to the project's Github page to browse the README, wiki, and plugin source.

**Vim care & feeding**:
* [Vundle.vim](https://github.com/gmarik/Vundle.vim) - Package manager
* [vim-airline](https://github.com/bling/vim-airline) - Sexy status line for vim
* [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) - Set tmux status line to match look and feel of your vim-airline config
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes) - Lots of themes to play with. Here's a [color chart](http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg) if you want to tweak further.
* [vim-ctrlspace](https://github.com/szw/vim-ctrlspace) - Save and restore workspaces, preserving all of your tabs, panes and buffers. Yes!

**Window management**:
* [vim-ctrlspace](https://github.com/szw/vim-ctrlspace) - Allow each tab to manage its own unique set of buffers; shortcuts for quickly renaming and moving tabs.
* [vim-maximizer.git](https://github.com/szw/vim-maximizer.git) - Toggle maximizing the current split-window

**Editing**:
* [vim-commentary](https://github.com/tpope/vim-commentary) - Comment out code
* [vim-surround](https://github.com/tpope/vim-surround) - Surround code with things and stuff
* [HTML-AutoCloseTag](https://github.com/amirh/HTML-AutoCloseTag) - "Automatically closes HTML tags once you finish typing"
* [vim-repeat](https://github.com/tpope/vim-repeat) - Extend the vim "repeat" functionality ('.') to supported plugins

**Navigation**:
* [nerdtree](https://github.com/scrooloose/nerdtree) - tree explorer extraordinaire
* [taglist.vim](https://github.com/vim-scripts/taglist.vim) - "groups and displays the functions, classes, structures, enumerations, macro definitions and other parts of a source code file in a Vim window."
* [MatchTag](https://github.com/gregsexton/MatchTag) - Use '%' to also match HTML elements

**Source Control**:
* [vim-fugitive](https://github.com/tpope/vim-fugitive) - Above average perfectly legal Git integration
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Show uncommited changes you've made within the current file
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) - Show changes to files in the tree explorer

**Searching**:
* [ag.vim](https://github.com/rking/ag.vim) - "Ag can be used as a replacement for 153% of the uses of ack. You have to first [install ag](https://github.com/ggreer/the_silver_searcher) itself."
* [nerdtree-ag](https://github.com/taiansu/nerdtree-ag) - Ag searching from NerdTree
* [vim-ctrlspace](https://github.com/szw/vim-ctrlspace) - CtrlP/Cmd-T style fuzzy searching, tightly integrated with other CtrlSpace features.

**Ruby/Rails**:
* [vim-rails](https://github.com/tpope/vim-rails) - swiss army chainsaw
* [vim-rubytest](https://github.com/janx/vim-rubytest) - kick off tests from within vim

**Documentation**:
* [dash.vim](https://github.com/rizzatti/dash.vim) - "Dash stores snippets of code and instantly searches offline documentation sets for 150+ APIs"

**Syntax checking and highlighting**:
* [syntastic](https://github.com/scrooloose/syntastic) - "runs files through external syntax checkers and displays any resulting errors to the user"
* [nginx-vim-syntax](https://github.com/evanmiller/nginx-vim-syntax)
* [vim-less](https://github.com/groenewege/vim-less)
* [vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)
* [jQuery](https://github.com/vim-scripts/jQuery)
* [vim-javascript-syntax](https://github.com/jelera/vim-javascript-syntax)
* [simple-javascript-indenter](https://github.com/jiangmiao/simple-javascript-indenter)
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [html5-syntax.vim](https://github.com/othree/html5-syntax.vim)
* [javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
* [puppet-syntax-vim](https://github.com/puppetlabs/puppet-syntax-vim)
* [vim-haml](https://github.com/tpope/vim-haml)
* [vim-markdown](https://github.com/tpope/vim-markdown)

CtrlSpace was listed 3 times because it does the work of several plugins, and makes managing tabs and buffers just as natural as with any GUI editor. It's well worth the effort.

### Key Bindings

...
