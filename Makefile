
all:
		ocamlyacc -b src/opamBaseParser ./opam-file-format/src/opamBaseParser.mly 
		./node_modules/.bin/bsb -clean-world -make-world

# release should generate a package.json file based on
# opam file and create an npm release
# release:

