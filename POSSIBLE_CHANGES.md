- hot key for clearing out the highlighting for the last search (:noh)
- Make it so flash doesn't cause all the text to go dark. Or at least make it so the text is more readable. Probably want to turn off the text change for `f`
- I hate how enter accepts the first suggested option. If anything does, it should be tab
- Make text wrap and undo mapping j to gj and k to gk
- 'H' and 'L' and mapped to next/previous buffer in normal mode. Not super useful without the buffer tabs but I don't think I want to bring those back. Maybe the ideal would be to get harpoon and map those to the next/previous harpoon pages. (in normal vim 'H' moves cursor to top of page and 'L' moves cursor to bottom of page... I don't really feel like I need those specifically)
- <c-s>for save feels awkward
- By default, I want text to wrap and not scroll left/right (actually turning on wrap seems to disable scroll)
- Make the keybinding for splitting a neovim pane match tmux


### Future
Remember the key bindings I used back in the VSCode days?
- key bindings to run simple tasks. Can I make these project specific? It'd be kinda funny to use a .vscode folder and dump scripts in it that I want to use, as long as I use different files names they probably won't be overwritten and most people use vscode so that directory is probably already ignored by git. I could also just maintain it separately, like I did with the tooling folder at LS and then have tmuxifier source the correct script
