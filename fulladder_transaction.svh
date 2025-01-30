//описание транзакции
class fulladder_transaction extends uvm_sequence_item;
    `uvm_object_utils(fulladder_transaction)
    
    function new(string name = "fulladder_transaction");
        super.new(name);
    endfunction
        
    rand logic [31:0] a;
    rand logic [31:0] b;
    logic [31:0] sum;
    
    constraint c_phase_v {
        a inside {[0:100]};
        b inside {[0:100]};
    }
    
endclass:fulladder_transaction
