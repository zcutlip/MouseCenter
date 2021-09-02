ZIPDIR=$(PWD)/build
SRCDIR=.
SOURCES := $(wildcard $(SRCDIR)/*.spoon)
SPOONS := $(patsubst $(SRCDIR)/%, $(ZIPDIR)/%.zip, $(SOURCES))
ZIP=/usr/bin/zip

all: $(ZIPDIR) $(SPOONS)

clean:
	rm -f $(ZIPDIR)/*.zip

$(ZIPDIR):
	mkdir -p "$@"

$(ZIPDIR)/%.zip: $(SRCDIR)/% $(SRCDIR)/%/*.lua
	echo $^
	echo $@
	rm -f $@
	cd $(SRCDIR) ; $(ZIP) -9 -r $@ $(patsubst $(SRCDIR)/%, %, $<)

.PHONY: clean
