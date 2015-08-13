## Holistic vim + tmux

#### Whatsit?


There's a lot of interest in using vim and tmux together, but it's easy to get frustrated
if you're just starting out, or even if you're upgrading from MacVim or gvim.  What should
be simple things like mouse support, or getting 256 colors to work consistently across
iTerm2, tmux, and iPad SSH clients can turn into a lot of Google. Once the basics are
working, finding the right combination of plugins, learning their idiosyncrasies, and
tailoring them so they make sense together is another time suck.

IDE-lite bundles such as [SPF13](https://github.com/spf13/spf13-vim) tend to be slow, turn
on a glut of unwanted features, and when something goes wrong it's not always obvious
where to look. Like many vim users, I started over with just a package manager (Vundle),
and added only the plugins I knew I would use. That's a growing list, but at least it
means I'm learning them one-by-one, and choosing keybindings that make sense not just for
the plugin but for vim and tmux as a whole.

If you want to do the same, fork this repo, comment out any plugin you don't recognize in
vimrc.plugins, and then start coding! Keep a separate tmux window open with your vim/tmux
config and add to it as you need features.

### Getting Started

Fork this repo to, say, `~/git/holistic-vim-tmux`

#### 256 color support

For 256 colors across devices, it's best to add an alias to your startup script:
`$ alias tmux='TERM=screen-256color-bce tmux -u'`

If you're using iTerm2, edit your profile, and under the [Terminal] tab, set the Report Terminal Type to `xterm-256color`

On an iPad, I've found vSSH to be the best client. Again, you'll need to set the "Terminal
type" to `xterm-256color` in the advanced section at the bottom.

Now back up your existing config:
```
$ cd ~
$ tmux new -s PROJECT-NAME
$ mv .vim .vim~
$ mv .vimrc .vimrc~
$ mv .tmux.conf .tmux.conf~
```

...and link in the new:

$ ln -s git/holistic-vim-tmux .vim
$ ln -s .vim/vimrc .vimrc
$ ln -s .vim/tmux.conf .tmux.conf
$ vi -c PluginInstall
```

Expect some fireworks, since none of the plugins exist yet. That's fine. Let the installer
finish, then quit and restart vim.

#### Powerline Fonts

Notice the weird characters in the status bars? That's courtesy of the Airline and
Tmuxline plugins, which rely on custom fonts to draw prettier status lines with symbols
for branching and such. You can uninstall these plugins, or else install [Powerline
fonts](https://github.com/powerline/fonts). I think "Droid Sans Mono for Powerline" is
close to perfect.



[CtrlSpace](https://github.com/szw/vim-ctrlspace)
