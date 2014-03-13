all:
	tries=0 ; \
	while [ $$tries -lt 5 ] && [ ! -f jbm_resume.log ] || grep -q "Rerun to get cross-references right." jbm_resume.log; do \
		pdflatex jbm_resume.tex ; \
		tries=$$((tries + 1)) ; \
	done ;
spell:
	aspell --mode tex check ./jbm_resume.tex
publish:
	rsync -avhze ssh --progress ./jbm_resume.pdf sadbox:/var/www/sadbox.org/static/resume/
clean:
	rm *.pdf *.log *.out *.aux
clean-spell:
	rm *.tex.bak
