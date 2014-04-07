DIR := $(shell pwd)

install:
	ln -s $(DIR)/vimrc $(HOME)/.vimrc
	ln -s $(DIR)/vim $(HOME)/.vim

update:
	git submodule foreach git pull

.PHONY: install update

