//sequences
class fulladder_seqr extends uvm_sequencer#(fulladder_transaction);

    `uvm_component_utils(fulladder_seqr)
    
    function new(string name = "fulladder_seqr", uvm_component parent);
        super.new(name, parent);
    endfunction
   
endclass:fulladder_seqr
