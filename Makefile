DIR := $(shell pwd)

install: submodule_init compile link

update: submodule_pull compile

submodule_init:
	git submodule update --init --recursive

submodule_pull:
	git submodule foreach git pull origin master

compile:
	cd vim/bundle/eregex.vim && make
	cd vim/bundle/vimproc.vim && make
	cd vim/bundle/supertab && make

link:
	ln -s $(DIR)/vimrc $(HOME)/.vimrc
	ln -s $(DIR)/vim $(HOME)/.vim

.PHONY: submodule_init compile link install update

