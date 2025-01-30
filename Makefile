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
	-incdir ./fulladder_agent \
	-incdir ./env \
	-incdir ./tests \
	-incdir ./cpp_test \
	./cpp_test/fulladder_c_generation.c \
	./cpp_test/c_pkg.sv \
	tb_if.sv \
	./fulladder_agent/fulladder_agent_if.sv \
	./fulladder_agent/fulladder_agent_pkg.sv \
	./env/fulladder_env_pkg.sv \
	./tests/fulladder_test_pkg.svh \
	fulladder.sv \
	tb.sv
		

