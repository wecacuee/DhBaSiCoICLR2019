ifndef INCLUDED_PDFLATEX_MK
SHELL:=/bin/bash
INCLUDED_PDFLATEX_MK=1
OO?=out
PDFLATEX?=pdflatex
PDFLATEX_CMD?=TEXINPUTS=$(TEXINPUTS) $(PDFLATEX) -shell-escape -interaction=nonstopmode -file-line-error -output-directory=$(OO)
PDFLATEX_R:=$(PDFLATEX_CMD) -recorder
PWD:=$(shell pwd)
BIBTEX?=BIBINPUTS=.:$(PWD):$(BIBINPUTS) BSTINPUTS=.:$(PWD):$(BSTINPUTS) bibtex
SED:=sed --posix
GREP:=grep

define BIBTEXRECIPE =
	cd $1
	$(BIBTEX) $2.aux
	cd -
	# The bibfile is present in log output as Database file #1: <filename>
	# Parse the blg file to generate the list of dependent bib files.
	echo "$@: \\" > $1/$2.bbl.mk
	$(SED) -n 's/INPUT \(.*.bib\)$$/$(INDENT)\1 \\/p' $1/$2.fls >> $1/$2.bbl.mk
endef

-include $(OO)/*.mk

e:=
INDENT:=$(e)    $(e)

.PRECIOUS .ONESHELL:
$(OO)/%.pdf: %.tex $(OO)/.mkdir
	-$(PDFLATEX_R) $<
	### Create a dependency list in makefile format
	echo "$@: \\" > $(OO)/$*.mk
	# If some file is missing add it to dependency list (e.g $*.bbl)
	$(SED) -n 's/No file \([^ ]\+\.\w\{3,4\}\)\.\?/$(INDENT)$(OO)\/\1 \\/p' $(OO)/$*.log >> $(OO)/$*.mk
	$(SED) -n 's#LaTeX Warning: File \`\([^'\'']*\)'\'' not found.*$$#$(INDENT)\1 \\#p' $(OO)/$*.log >> $(OO)/$*.mk
	# -recorder flag will output the files that were opened by pdflatex to
	# $*.fls
	# Parse the input files into the makefile. Remove the aux file from
	# dependency list.
	$(SED) -n 's/INPUT \(.*\)$$/$(INDENT)\1 \\/p' $(OO)/$*.fls | $(GREP) -Ev '$*.(w18|aex|aux)' >> $(OO)/$*.mk
	# # Run bibtex if log file says so
	$(call BIBTEXRECIPE,$(OO),$*)
	$(PDFLATEX_R) $<
	# # Rerun pdflatex if the log file says so
	$(PDFLATEX_R) $<

.PRECIOUS:
%.bbl: %.aux
	$(call BIBTEXRECIPE,$(*D),$(*F))

.PRECIOUS: %/.mkdir
%/.mkdir:
	mkdir -p $(@D)
	touch $@

.PHONY:
%.pdf-clean:
	rm $(OO)/$*.*
	rm $*.pdf
	rm $(OO)/.mkdir
	rmdir $(OO)

endif
