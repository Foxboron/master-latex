PROJNAME=main

.PHONY: $(PROJNAME).pdf all clean

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

cleanall:
	latexmk -C

clean:
	latexmk -c
