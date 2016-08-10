FILES = bashrc inputrc screenrc vimrc

all:
	echo $(FILES)

install:
	@for file in $(FILES); do \
		echo $$file; \
	done

update:
	@for file in $(FILES); do \
		cp ~/.$$file $$file; \
		echo cp ~/.$$file $$file; \
	done
