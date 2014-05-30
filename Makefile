all:
	[ -f jbm_resume.pdf ] && echo "\n\nPDF already exists..." && exit 1 ; \
	while [ $${tries:=0} -lt 5 ] && [ ! -f jbm_resume.log ] || grep -q "Rerun to get" jbm_resume.log; do \
		pdflatex jbm_resume.tex ; \
		tries=$$((tries + 1)) ; \
	done ; \
	if [ $${tries} -eq 5 ]; then \
		echo "Could not finish PDF after 5 attempts, please check the log." ; \
		exit 1 ; \
	else \
		echo "\n\nPDF finished after $${tries} runs." ; \
	fi
spell:
	aspell --mode tex check ./jbm_resume.tex
publish:
	rsync -avhze ssh --progress ./jbm_resume.pdf sadbox:/tmp/jbm_resume.pdf && ssh -t sadbox sudo mv -v /tmp/jbm_resume.pdf /home/sadbox-web/static/resume/
clean:
	rm *.pdf *.log *.out *.aux
clean-spell:
	rm *.tex.bak
