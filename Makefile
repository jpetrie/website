.PHONY: clean

SOURCE_HTML = $(wildcard src/*.md)
OUTPUT_HTML = $(patsubst src/%.md, out/%.html, ${SOURCE_HTML})
SOURCE_CSS = $(wildcard src/*.css)
OUTPUT_CSS = $(patsubst src/%.css, out/%.css, ${SOURCE_CSS})

all: ${OUTPUT_HTML} ${OUTPUT_CSS}

clean:
	rm -rf out

out:
	mkdir out

out/%.html: src/%.md | out
	markdown $< | cat src/header.htmlpart - src/footer.htmlpart > $@

out/%.css: src/%.css | out
	cp $< $@
