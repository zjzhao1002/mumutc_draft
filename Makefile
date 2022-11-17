TEX = pdflatex
BIB = bibtex

BASE=eetc

TEXFILE=$(BASE).tex
BIBFILE=$(BASE).bib
AUXFILE=$(BASE).aux
BBLFILE=$(BASE).bbl

PDFFILE=$(BASE).pdf

all: $(PDFFILE)

$(PDFFILE): $(TEXFILE) $(BBLFILE)
	$(TEX) $(TEXFILE)

$(BBLFILE): $(AUXFILE) $(BIBFILE)
	$(BIB) $(AUXFILE)

$(AUXFILE): $(TEXFILE) $(BIBFILE)
	$(TEX) $(TEXFILE) -draftmode

clean:
	rm *.aux
	rm *.bbl
	rm *.blg
	rm *.log
	rm *.out
	rm *.toc
