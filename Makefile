all:
	pdflatex jbm_resume.tex
spell:
	aspell --mode tex check ./jbm_resume.tex
clean:
	rm *.pdf *.log *.out *.aux
clean-spell:
	rm *.tex.bak
