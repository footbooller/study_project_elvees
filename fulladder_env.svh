class fulladder_env extends uvm_env;

    `uvm_component_utils(fulladder_env)
    
    fulladder_agent agent;
    fulladder_env_config env_cfg;
    fulladder_checker adder_checker;

    
    function new (string name = "fulladder_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    
    function void build_phase(uvm_phase phase);
        agent = fulladder_agent::type_id::create("agent", this);
        env_cfg = fulladder_env_config::type_id::create("env_cfg"); //env_config
        adder_checker = fulladder_checker::type_id::create("adder_checker",this);
        if (!uvm_config_db #(fulladder_env_config)::get(this,"","env_cfg", env_cfg)) begin // get from test
            `uvm_error("config_error", "uvm_config_db #(agent_config)::get cannot find resource agent_config");
        end
        uvm_config_db #(fulladder_agent_config)::set(this,"agent","agent_config",env_cfg.agent_cfg);//set to agent
    endfunction
    
    extern function void  connect_phase(uvm_phase phase);
    
endclass:fulladder_env


function void fulladder_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.fulladder_ap.connect(adder_checker.analysis_export);    
endfunction
