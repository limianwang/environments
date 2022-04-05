env:
	@brew install go

vim:
	@mkdir -p ~/.vim && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
		vim +PluginInstall

.PHONY: vim env
