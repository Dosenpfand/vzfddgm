ifeq ($(strip $(shell git status --porcelain statuten.md)),)
	DOC_VERSION = $(shell git show -s --format=%h)
else
	DOC_VERSION = "ENTWURF"
endif

statuten.pdf: statuten.md metadata.tex
	pandoc -s statuten.md -o statuten.pdf

metadata.tex: FORCE
	echo "Version: " > metadata.tex
	echo $(DOC_VERSION) >> metadata.tex
	echo "- Datum: " >> metadata.tex
	git show -s --format=%ci | awk '{print $$1;}' >> metadata.tex

FORCE:
