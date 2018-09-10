SHELL:=/bin/bash
OO=out

VPATH:=images/:exp-results/

$(OO)/main.pdf: main_filtered.bib


# Nice way for optional dependencies
maybe_shared_bib=$(wildcard /home/dhiman/wrk/group-bib/shared.bib)

main_filtered.bib: main.bib $(wildcard $(OO)/main.aux) $(maybe_shared_bib)
	aux2bib $(OO)/main.aux | tail -n +4 > $@

media/%:
	$(MAKE) -C media/ $*

include pdflatex.mk


%.sty: Master-Template-ICLR2019/%.sty
	ln -s $< $@

%.bst: Master-Template-ICLR2019/%.bst
	ln -s $< $@

Master-Template-ICLR2019/iclr2019_conference.sty: Master-Template-ICLR2019.tar.gz
	tar xzvf $<
	touch $@

Master-Template-ICLR2019.tar.gz:
	wget https://github.com/ICLR/Master-Template/archive/ICLR2019.tar.gz -O $@
	touch $@
