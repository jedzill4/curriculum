.PHONY: all clean 


SRC=$(wildcard *.tex)
PDF=$(patsubst %.tex,%.pdf,$(SRC))
OUTDIR=./outfiles

TEX=latex


default: all

all: $(PDF)

$(OUTDIR):
	mkdir -p $@

%.dvi: %.tex
	$(TEX) $<

%.ps: %.dvi
	dvips $<
	
%.pdf: %.ps | $(OUTDIR)
	ps2pdf $<
	mv $(basename $<).{aux,log,out,dvi,ps} $(OUTDIR)



clean:
	rm *.pdf *.ps *.dvi

