package fulladder_agent_pkg;
    //uvm_package
    import uvm_pkg::*;
    import c_pkg::*;
    `include "uvm_macros.svh"
    //my_package

//     `include "fulladder_test.svh"
    `include "fulladder_agent_config.svh"
    `include "fulladder_transaction.svh"
    `include "fulladder_seq.svh"
    `include "fulladder_seqr.svh"
    `include "inheritor_of_base_tr_gen.svh"
    `include "fulladder_driver.svh"
    `include "fulladder_monitor.svh"
    
    `include "fulladder_agent.svh"
//     typedef uvm_sequencer #(fulladder_transaction) fulladder_seqr; 
    
endpackage:fulladder_agent_pkg
