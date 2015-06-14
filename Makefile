PROG=main

OCAMLFIND=ocamlfind

OCAMLC=$(OCAMLFIND) ocamlc

OCAMLOPT=$(OCAMLFIND) ocamlopt

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
	$(OCAMLC) -c amodule.mli

amodule.o: mli
	$(OCAMLC) -c amodule.ml

main.o:
	$(OCAMLC) -c amodule.cmo main.ml

compile: amodule.o main.o
	$(OCAMLC) -o $(PROG) amodule.cmo main.cmo

amodule.x: mli
	$(OCAMLOPT) -c amodule.ml

main.x:
	$(OCAMLOPT) -c amodule.cmx main.ml

compile-x: amodule.x main.x
	$(OCAMLOPT) -o $(PROG) amodule.cmx main.cmx

run:
	./$(PROG)

# dep:
# 	ocamldep *.ml *.mli > .depend

# include .depend
