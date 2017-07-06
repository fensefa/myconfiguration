FILES = bashrc inputrc screenrc vimrc bash_profile

help:
	@echo -e \
		"\tall : list all the tracked files\n" \
		"\tinstall : copy files to home director\n" \
		"\tupdate : copy file from home director"

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
