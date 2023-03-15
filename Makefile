MAIN = main

all: $(MAIN).pdf


TEX_SOURCES := $(shell find data/* -type f)
FIGURES := $(shell find figures/* -type f)
SHELL = /bin/bash

once:
	pdflatex: $(MAIN)

$(MAIN).pdf: $(TEX_SOURCES) $(FIGURES)
	xelatex $(MAIN)
	bibtex $(MAIN)
	xelatex $(MAIN)
	xelatex $(MAIN)
	#latexmk -pdf $(MAIN)

clean:
	@rm -f $(MAIN).pdf
	@rm -f $(MAIN).log
	@rm -f $(MAIN).blg
	@rm -f $(MAIN).bbl
	@rm -f $(MAIN).aux
	@rm -f $(MAIN).out
	@rm -f $(MAIN).toc
	@rm -f $(MAIN).idx
	@rm -f $(MAIN).bcf
	@rm -f $(MAIN).run
	@rm -f $(MAIN).xml
	@rm -f $(MAIN).ind
	@rm -f $(MAIN).ilg
	@rm -f $(MAIN).fls
	@rm -f $(MAIN).fdb_latexmk
	@rm -f $(MAIN).lot
	@rm -f $(MAIN).lof
	@rm -f $(MAIN).dvi
.PHONY: clean all
