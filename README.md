## Holistic vim + tmux

### Whatsit?

There's a lot of interest in using vim and tmux together, but it's easy to get frustrated if you're just starting out, or even if you're "upgrading" from MacVim or gvim.  What should be simple things like adding mouse support, or getting 256 colors to work consistently across clients can turn into a lot of Google. Worse, even though vim and tmux share a number of concepts, they each have their own terminology and independent key combinations to manage them. Tabs, panes, windows, sessions, workspaces, buffers... and once you start adding plug-ins, these key combinations only get more arcane, and sometimes clobber each other.

Projects such as [SPF13](https://github.com/spf13/spf13-vim) and [Janus](https://github.com/carlhuda/janus) provide a collection of plugins and mappings for vim that work well together, but (for me anyway) tend to be slow, turn on a glut of unwanted features, and when something goes wrong it's not always obvious where to look. Like many vim users, I started over with just a package manager (Vundle), and added only the plugins I knew I would use. That's a growing list, but at least it means I'm learning them one-by-one, and configuring keybindings that make sense not just for the plugin but for vim and tmux as a whole.

If you want to do the same, fork this repo, comment out any plugin you don't recognize, and then start coding!

### Installation

Fork this repo to, say, `~/git/holistic-vim-tmux`
Now back up your existing config:
```
$ cd ~
$ mv .vim .vim~
$ mv .vimrc .vimrc~
$ mv .tmux.conf .tmux.conf~
```

...link to the new:
```
$ ln -s PATH/TO/git/holistic-vim-tmux .vim
$ ln -s .vim/vimrc .vimrc
$ ln -s .vim/tmux.conf .tmux.conf
```

...and then start tmux and vim:
```
$ tmux new -s PROJECT-NAME
$ vi -c PluginInstall
```

Expect some fireworks from vim, since none of the plugins exist yet. That's fine. Let the installer finish, then quit and restart vim.

#### Powerline Fonts

Notice the weird characters in the status bars?

![status_line_borked](https://raw.githubusercontent.com/hoodslide/holistic-vim-tmux/master/assets/statusline-sans-powerline-fonts.jpg)

That's courtesy of the [Airline](https://github.com/bling/vim-airline) and [Tmuxline](https://github.com/edkolev/tmuxline.vim) plugins, which rely on custom fonts to draw prettier status lines with symbols for branching and such. You can uninstall these plugins, or else install [Powerline fonts](https://github.com/powerline/fonts). "Droid Sans Mono for Powerline" is close to perfect:

![status line](https://raw.githubusercontent.com/hoodslide/holistic-vim-tmux/master/assets/statusline.jpg)

#### Adding 256 color support

Colors look stoopid? vim/tmux support 256 colors, but your terminal may not be configured to display them properly. This may help:

* Add an alias to your startup script:
  ```
  alias tmux='TERM=screen-256color-bce tmux -u'
  ```

* If you're using iTerm2, edit your profile, and under the [Terminal] tab, set the Report Terminal Type option to `xterm-256color`
* On an iPad, [vSSH](http://www.velestar.com/Pages/VSSHIOSPage.aspx) is the best client I've found so far. Again, you'll need to set the "Terminal type" to `xterm-256color` in the advanced section at the bottom. Sadly, no support for Powerline fonts yet, though the developers are "considering it."
* Windows users, try Putty
* Linux users probably already have a system  ;)

### Plugins

Here's a very brief tour of the plugins being used. Again, turn off anything you don't want, need or understand yet via the vimrc.plugins and vimrc.keymap files. Most plugins, you can type `:help PLUGIN_NAME`, or go to the project's Github page to browse the README, wiki, and plugin source.

**Vim care & feeding**:
* [Vundle.vim](https://github.com/gmarik/Vundle.vim) - Package manager
* [vim-airline](https://github.com/bling/vim-airline) - Sexy status line for vim
* [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) - Set tmux status line to match look and feel of your vim-airline config
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes) - Lots. Here's a handy [color chart](http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg) if you want to tweak further.
* [vim-ctrlspace](https://github.com/szw/vim-ctrlspace) - Manage tabs and buffers the *right* way, save and restore workspaces, CTRL-P/Cmd-T style fuzzy search.

**Window management**:
* [vim-ctrlspace](https://github.com/szw/vim-ctrlspace) - Manage tabs and buffers the *right* way, save and restore workspaces, CTRL-P/Cmd-T style fuzzy search.
* [vim-maximizer.git](https://github.com/szw/vim-maximizer.git) - Toggle maximizing the current split-window

**Source Control**:
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)

**Editing**:
* [vim-surround](https://github.com/tpope/vim-surround)
* [HTML-AutoCloseTag](https://github.com/amirh/HTML-AutoCloseTag) - "Automatically closes HTML tags once you finish typing them."
* [vim-commentary](https://github.com/tpope/vim-commentary) - Comment out code
* [vim-repeat](https://github.com/tpope/vim-repeat)

**Navigation**:
* [nerdtree](https://github.com/scrooloose/nerdtree) - tree explorer
* [taglist.vim](https://github.com/vim-scripts/taglist.vim) - "groups and displays the functions, classes, structures, enumerations, macro definitions and other parts of a source code file in a Vim window. The taglist plugin will automatically highlight the current tag. You can jump to the definition of a tag by selecting the tag name from the taglist window."
* [MatchTag](https://github.com/gregsexton/MatchTag) - Use '%' to match HTML elements
* [vim-ctrlspace](https://github.com/szw/vim-ctrlspace) - Manage tabs and buffers the *right* way, save and restore workspaces, CTRL-P/Cmd-T style fuzzy search.

**Searching**:
* [ag.vim](https://github.com/rking/ag.vim) - "Ag can be used as a replacement for 153% of the uses of ack. You have to first [install ag](https://github.com/ggreer/the_silver_searcher) itself."
* [nerdtree-ag](https://github.com/taiansu/nerdtree-ag) - Ag searching from NerdTree

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

CtrlSpace was listed 3 times. It does the work of several plugins, and makes managing tabs and buffers just as natural as with any GUI editor. In addition it has a great fuzzy file search built it. (CtrlP is the de-facto fuzzy search, but the one included with CtrlSpace is tightly integrated with its other features). It's well worth picking up.

### Key Bindings

...
