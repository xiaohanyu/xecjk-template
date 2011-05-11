tex=xelatex
tex_files=${wildcard data/*tex}

build: main.tex ${tex_files}
	@mkdir -p build/data
	${tex} -output-dir=build main.tex
	${tex} -output-dir=build main.tex
	@cp build/main.pdf main.pdf

html: main.tex
	tth -u main.tex

rtf: main.tex
	latex2rtf main.tex

view:
	okular main.pdf

clean:
	rm -rf build

clean_auctex_auto:
	rm -rf auto

clean_backup_files:
	@echo "clean backup files"
	find . -name '*~' | xargs rm -rf 		# clean emacs backup files
	find . -name '*.swp' | xargs rm -rf		# clean vim backup files 

cleanall: clean clean_auctex_auto clean_backup_files
	rm -rf main.pdf
	rm -rf main.html
	rm -rf main.rtf
