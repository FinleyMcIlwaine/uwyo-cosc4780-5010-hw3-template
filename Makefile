## Makefile for UWYO COSC 4780/5010 HW2 - Haskell side
## Author: Finley McIlwaine

.PHONY : bnfc parse test

bnfc/*.hs: CPP.cf
	bnfc -m -o bnfc $^
	cd bnfc && make

bnfc: bnfc/*.hs

parse: bnfc
	@./bnfc/TestCPP

hw3-testsuite/progs-test-hw3.o:
	cd hw3-testsuite && ghc -o progs-test-hw3 progs-test-hw3.hs

test: hw3-testsuite/progs-test-hw3.o
	@cd hw3-testsuite && ./progs-test-hw3 ../CPP.cf
