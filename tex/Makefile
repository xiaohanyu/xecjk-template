XELATEX		?=		xelatex
VIEW_PDF	?=		okular
tex_files=$(wildcard data/*tex)

main.pdf: main.tex $(tex_files)
	@mkdir -p build/data
	$(XELATEX) -output-dir=build main.tex
	$(XELATEX) -output-dir=build main.tex
	@mv build/main.pdf main.pdf

html: main.tex
	tth -u main.tex

rtf: main.tex
	latex2rtf main.tex

view:
	$(VIEW_PDF)	main.pdf

clean:
	rm -rf build
	rm -rf main.pdf

clean_auctex_auto:
	rm -rf auto

clean_backup_files:
	@echo "clean backup files"
	find . -name '*~' | xargs rm -rf 		# clean emacs backup files
	find . -name '*.swp' | xargs rm -rf		# clean vim backup files 

cleanall: clean clean_auctex_auto clean_backup_files
	rm -rf main.html
	rm -rf main.rtf
