PROJNAME=main

.PHONY: $(PROJNAME).pdf all clean refs cleanall

all: $(PROJNAME).pdf 

$(PROJNAME).pdf: $(PROJNAME).tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

refs:
	papis export --bibtex -a "tags = master" > refs.bib

clean:
	latexmk -c

cleanall: clean
	latexmk -C
