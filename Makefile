PRJ_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SEED:=random
TESTNAME=test1

.PHONY: run
run:
	xrun \
	-vtimescale 1ns/1ps \
	-64bit -sv -q -access +rwc -input run.tcl \
	+UVM_TESTNAME=$(TESTNAME) \
	-uvmhome CDNS-1.2 +UVM_NO_RELNOTES -svseed ${SEED} \
	fulladder_test_pkg.sv fulladder.sv tb.sv 

