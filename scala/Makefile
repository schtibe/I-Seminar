
CLEAN_EXT := nls,ilg,aux,log,idx,out,glo,toc,lot,tex~,backup,bbl,blg,1,2,3,4,5,6,7,8,9,10,dvi,emp*mp,ooplss*mp,nlo,tdo,dvi,lof,lol

default: build

build: clean 
	pdflatex scala.tex -shell-escape -interaction=nonstopmode 1> /dev/null
	pdflatex scala.tex -shell-escape -interaction=nonstopmode 1> /dev/null

clean:
	rm -f [^scala]*.pdf
	rm -f include/*{$(CLEAN_EXT)}
	rm -f *{$(CLEAN_EXT)}
