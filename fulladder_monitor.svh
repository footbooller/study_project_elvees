class fulladder_monitor extends uvm_monitor;

    `uvm_component_utils(fulladder_monitor)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    fulladder_transaction transaction;
    fulladder_agent_config agent_config;
    uvm_analysis_port #(fulladder_transaction) fulladder_ap;
    mailbox #(fulladder_transaction) fulladder_box;
           
    extern function void build_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);

    
endclass:fulladder_monitor

function void fulladder_monitor::build_phase(uvm_phase phase);
    fulladder_ap = new("fulladder_ap", this);
    fulladder_box = new(1);
endfunction


task fulladder_monitor::run_phase(uvm_phase phase);
    wait(agent_config.agent_if.resetn === 0);
    wait(agent_config.agent_if.resetn === 1);
    forever begin 
        @(posedge agent_config.agent_if.clk);
            
                if (fulladder_box.try_get(transaction)) begin
                    transaction.sum = agent_config.agent_if.sum;
                    `uvm_info(get_type_name(), $sformatf("value of a is  %d", transaction.a), UVM_NONE);
                    `uvm_info(get_type_name(), $sformatf("value of b is  %d", transaction.b), UVM_NONE);
                    `uvm_info(get_type_name(), $sformatf("value of sum is%d", transaction.sum), UVM_NONE);
                    fulladder_ap.write(transaction);
               end
                
                transaction = fulladder_transaction::type_id::create("fulladder_transaction", this);
                transaction.a = agent_config.agent_if.a;
                transaction.b = agent_config.agent_if.b;
                fulladder_box.put(transaction);
        
        $display("######################################################################################################################");
    end
endtask
