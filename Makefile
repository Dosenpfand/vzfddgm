statuten.pdf: statuten.md metadata.tex
	pandoc -s statuten.md -o statuten.pdf

metadata.tex: FORCE
	echo "Version: " > metadata.tex
	git show -s --format=%h >> metadata.tex
	echo "- Datum: " >> metadata.tex
	git show -s --format=%ci | awk '{print $$1;}' >> metadata.tex

FORCE:
