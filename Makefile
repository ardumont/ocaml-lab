SRC_FILE=test.ml
PROG=test

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

compile:
	ocamlc -o $(PROG) $(SRC_FILE)

run:
	./$(PROG)
