install-env:
	nix-env -i env-ml

deb-env:
	sudo apt-get install -y libcurses-ocaml libcurses-ocaml-dev

start-hacking:
	load-env-ml

install-deps:
	opam install git; echo "true: package(git)" > _tags

ocaml:
	rlwrap ocaml

compile:
	ocamlc -o test test.ml
