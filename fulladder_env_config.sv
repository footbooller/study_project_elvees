class fulladder_env_config extends uvm_object;
    `uvm_object_utils(fulladder_env_config)
    
    virtual fulladder_agent_if agent_if;
    fulladder_agent_config agent_cfg;//handle на agent_config
    
    function new(string name = "fulladder_env_config");
        super.new(name);
    endfunction

endclass:fulladder_env_config

