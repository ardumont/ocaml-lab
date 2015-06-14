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
	rm -f *.cmi *.cmo *.cmx *.o $(PROG)

mli:
	ocamlc -c amodule.mli

amodule.o: mli
	ocamlc -c amodule.ml

main.o:
	ocamlc -c amodule.cmo main.ml

compile: amodule.o main.o
	ocamlc -o $(PROG) amodule.cmo main.cmo

amodule.x: mli
	ocamlopt -c amodule.ml

main.x:
	ocamlopt -c amodule.cmx main.ml

compile-x: amodule.x main.x
	ocamlopt -o $(PROG) amodule.cmx main.cmx

run:
	./$(PROG)

# dep:
# 	ocamldep *.ml *.mli > .depend

# include .depend
