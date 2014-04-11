DIR := $(shell pwd)

install:
	ln -s $(DIR)/vimrc $(HOME)/.vimrc
	ln -s $(DIR)/vim $(HOME)/.vim
	git submodule update

update:
	git submodule foreach git pull origin master

.PHONY: install update

