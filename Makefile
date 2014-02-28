all:
	pdflatex jbm_resume.tex
spell:
	aspell --mode tex check ./jbm_resume.tex
publish:
	rsync -avhze ssh --progress ./jbm_resume.pdf sadbox:/var/www/sadbox.org/static/resume/
clean:
	rm *.pdf *.log *.out *.aux
clean-spell:
	rm *.tex.bak
