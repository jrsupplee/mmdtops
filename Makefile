
PREFIX=/usr/local
BIN_DIR=$(PREFIX)/bin
MAN_DIR=$(PREFIX)/man/man1

.PHONY: install uninstall man clean

all: man

man: mmdtops.1

mmdtops.1: mmdtops
	pod2man --center='MultiMarkDown to PostScript' --section=1 mmdtops > mmdtops.1

clean:
	rm mmdtops.1

install: man
	install -d $(BIN_DIR)
	install --mode 755 mmdtops $(BIN_DIR)
	ln -s -f $(BIN_DIR)/mmdtops $(BIN_DIR)/mmdtopdf
	install -d $(MAN_DIR)
	install --mode 644 mmdtops.1 $(MAN_DIR)
	ln -s -f $(MAN_DIR)/mmdtops.1 $(MAN_DIR)/mmdtopdf.1
	if [[ -f /etc/mmdtops.ini ]]; then \
		echo "/etc/mmdtops.ini already exists, not copied."; \
	else \
		install --mode 644 etc/mmdtops.ini /etc/mmdtops.ini; \
	fi

uninstall:
	rm $(BIN_DIR)/mmdtops
	rm $(BIN_DIR)/mmdtopdf
	rm $(MAN_DIR)/mmdtops.1
	rm $(MAN_DIR)/mmdtopdf.1
	echo "Configuration files have not been deleted."

