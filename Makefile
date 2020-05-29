xml2rfc ?= xml2rfc
kramdown-rfc2629 ?= kramdown-rfc2629

drafts := draft-bonaventure-quic-atsss-overview.txt
xml := $(drafts:.txt=.xml)
mkd := $(drafts:.txt=.mkd)

%.txt: %.mkd 
	$(kramdown-rfc2629) $< > $(patsubst %.txt,%.xml, $@)
	$(xml2rfc) $(patsubst %.txt,%.xml, $@) > $@

%.txt: %.xml
	$(xml2rfc) $< $@

%.html: %.xml
	$(xml2rfc) --html $< $@


all: $(drafts)

spell: $(mkd)
	mdspell -n -a --en-us -r $(mkd)
