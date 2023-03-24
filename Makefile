env:
	@brew install go

vim:
	@mkdir -p ~/.vim && \
		rm -rf ~/.vim/bundle/Vundle.vim && \
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
		curl https://raw.githubusercontent.com/limianwang/environments/master/dotfiles/.vimrc --output ~/.vimrc && \
		vim -E +PluginInstall +qall > /dev/null

.PHONY: vim env
