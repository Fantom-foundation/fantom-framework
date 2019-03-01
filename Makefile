#The current version of the paper
VERSION=6
FILE=LCA_arXiv_v$(VERSION)

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: $(FILE).pdf all clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: $(FILE).pdf $(FILE).html $(FILE).md

# CUSTOM BUILD RULES

# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.
# "raw2tex" and "dat2tex" are just placeholders for whatever custom steps
# you might have.

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.
# -synctex=1 generate SyncTeX data for previewers according to
#                          bits of NUMBER (`man synctex' for details)


$(FILE).pdf: $(FILE).tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode -synctex=1" -use-make $<

$(FILE).html: $(FILE).pdf
	pdftohtml -s -i -noframes $< $@

$(FILE).md: $(FILE).html
	pandoc -f html -t markdown_strict -o $@ $<

clean:
	latexmk -C
