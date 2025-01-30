class fulladder_checker extends uvm_subscriber #(fulladder_transaction);
    
    `uvm_component_utils(fulladder_checker)
    
    fulladder_transaction transaction;
    fulladder_monitor monitor;
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    extern function void build_phase(uvm_phase phase);
    
    function void write(fulladder_transaction t);
//     $display("\ncheck %t", $time);
        if(t.sum !== t.a + t.b) begin 
        `uvm_error(get_type_name(),"test_error");
    end
    else begin
        `uvm_info(get_full_name(), "true", UVM_NONE);
    end
    endfunction
        
endclass:fulladder_checker

function void fulladder_checker::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction
