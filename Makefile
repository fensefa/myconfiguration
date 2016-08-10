FILES = bashrc inputrc screenrc vimrc

all: $(FILES)
	@echo $(FILES)

install: $(FILES)
	@for file in $(FILES); do \
		echo cp $$file ~/.$$file; \
	done

update:
	@for file in $(FILES); do \
		cp ~/.$$file $$file; \
		echo cp ~/.$$file $$file; \
	done
