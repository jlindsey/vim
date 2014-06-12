DIR := $(shell pwd)

install:
	git submodule update --init --recursive
	cd vim/bundle/eregex.vim && make
	cd vim/bundle/vimproc.vim && make
	cd vim/bundle/supertab && make
	ln -s $(DIR)/vimrc $(HOME)/.vimrc
	ln -s $(DIR)/vim $(HOME)/.vim

update:
	git submodule foreach git pull origin master

.PHONY: install update

