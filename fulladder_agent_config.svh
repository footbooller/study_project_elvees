class fulladder_agent_config extends uvm_object;
    `uvm_object_utils(fulladder_agent_config)
    
    virtual fulladder_agent_if agent_if;

    uvm_active_passive_enum active = UVM_ACTIVE;  

    function new(string name = "fulladder_agent_config");
        super.new(name);
    endfunction
        
endclass:fulladder_agent_config
