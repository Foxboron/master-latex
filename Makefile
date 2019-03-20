PROJNAME=main

.PHONY: $(PROJNAME).pdf all clean refs cleanall

all: $(PROJNAME).pdf 

$(PROJNAME).pdf: $(PROJNAME).tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

commit:
	git add .
	git c -m "$(shell date +%Y-%m-%d)"
	git push
	papis git add .
	papis git c -m "$(shell date +%Y-%m-%d)"
	papis git push
	git --work-tree=/home/fox/Notes add .
	git --work-tree=/home/fox/Notes c -m "$(shell date +%Y-%m-%d)"
	git --work-tree=/home/fox/Notes push

refs:
	papis export --bibtex -a "tags = master" > refs.bib

clean:
	latexmk -c

cleanall: clean
	latexmk -C
