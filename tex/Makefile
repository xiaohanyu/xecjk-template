tex=xelatex

build: main.tex
	@mkdir -p build/data
	${tex} -output-dir=build main.tex
	${tex} -output-dir=build main.tex
	@cp build/main.pdf main.pdf

html:
	tth -u main.tex

rtf:
	latex2rtf main.tex

view:
	okular main.pdf

clean:
	rm -rf build

clean_auctex_auto:
	rm -rf auto

clean_backup_files:
	@echo "clean backup files"
	rm -rf main.tex~

cleanall: clean clean_auctex_auto clean_backup_files
	rm -rf main.pdf
	rm -rf main.html
