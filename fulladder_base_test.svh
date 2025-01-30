class fulladder_base_test extends uvm_test;
    `uvm_component_utils(fulladder_base_test)
    function new(string name = "fulladder_base_test", uvm_component parent = null);//конструктор 
        super.new(name, parent);
    endfunction

    virtual tb_if intf;
    virtual fulladder_agent_if agent_if;
    fulladder_agent_config agent_cfg;
    fulladder_env_config env_cfg;
    fulladder_env env;
    
    extern function void build_phase(uvm_phase phase);
    
endclass:fulladder_base_test

function void fulladder_base_test::build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    if (!uvm_config_db #(virtual tb_if)::get(this, "", "intf", intf)) begin
      `uvm_error("interface_get", "Unable to find the intf virtual interface in the uvm_config_db")
    end
    

    if (!uvm_config_db #(virtual fulladder_agent_if)::get(this, "", "agent_if", agent_if)) begin
      `uvm_error("interface_get", "Unable to find the intf virtual interface in the uvm_config_db")
    end
    
    
    env = fulladder_env::type_id::create("env", this);
    env_cfg = fulladder_env_config::type_id::create("env_cfg");
    agent_cfg = fulladder_agent_config::type_id::create("agent_cfg");
    agent_cfg.active = UVM_ACTIVE;

    
    agent_cfg.agent_if = agent_if;
    env_cfg.agent_cfg = agent_cfg;
    
    uvm_config_db #(fulladder_env_config)::set(this,"env","env_cfg", env_cfg);
        
endfunction
