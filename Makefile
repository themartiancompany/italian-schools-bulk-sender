#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/italian-schools-bulk-sender
DATA_DIR=$(DESTDIR)$(PREFIX)/share/italian-schools-bulk-sender
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard italian-schools-bulk-sender/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-italian-schools-bulk-sender install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-italian-schools-bulk-sender:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 italian-schools-bulk-sender/italian-schools-bulk-sender "$(BIN_DIR)"

.PHONY: check install install-doc install-italian-schools-bulk-sender shellcheck
