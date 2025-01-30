class fulladder_driver extends uvm_driver #(fulladder_transaction);
    `uvm_component_utils(fulladder_driver)
    
    function new(string name = "fulladder_driver", uvm_component parent);
        super.new(name, parent);
    endfunction
    
    fulladder_transaction transaction;
    fulladder_agent_config agent_config;

    extern task run_phase(uvm_phase phase);


endclass: fulladder_driver

task fulladder_driver::run_phase(uvm_phase phase);

    forever begin
        seq_item_port.get_next_item(transaction); // запрос новой транзакции 

        agent_config.agent_if.in(transaction.a, transaction.b);
                
        seq_item_port.item_done(); // окончание транзакции
    end
endtask
