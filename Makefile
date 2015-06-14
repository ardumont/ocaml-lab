PROG=main

install-env:
	nix-env -i env-ml

deb-env:
	sudo apt-get install -y libcurses-ocaml libcurses-ocaml-dev

start-hacking:
	load-env-ml

install-deps:
	opam install git

ocaml:
	rlwrap ocaml

clean:
	rm -f *.cmi *.cmo $(PROG)

amodule.o:
	ocamlc -c amodule.ml

main.o:
	ocamlc -c amodule.cmo main.ml

compile: amodule.o main.o
	ocamlc -o $(PROG) amodule.cmo main.cmo

run:
	./$(PROG)
