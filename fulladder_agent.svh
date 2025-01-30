class fulladder_agent extends uvm_agent;
    `uvm_component_utils(fulladder_agent)
    
    function new(string name = "fulladder_agent", uvm_component parent);
        super.new(name, parent);
    endfunction
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    
    //подключаем секвенсер и драйвер
    fulladder_seqr                sqr;
    
    fulladder_driver              driver;
    
    fulladder_monitor             monitor;
        
    fulladder_agent_config        agent_config;
    
endclass: fulladder_agent

function void fulladder_agent::build_phase(uvm_phase phase);

    super.build_phase(phase);
    
    if(!uvm_config_db #(fulladder_agent_config)::get(this,"","agent_config", agent_config)) begin // get from env
    `uvm_error("config_error", "uvm_config_db #(agent_config)::get cannot find resource agent_config");
    end
    
    sqr = fulladder_seqr::type_id::create("sqr", this);
    driver = fulladder_driver::type_id::create("driver", this);
    monitor = fulladder_monitor::type_id::create("monitor", this);
    
    driver.agent_config = agent_config;
    monitor.agent_config = agent_config;
    
endfunction

function void fulladder_agent::connect_phase(uvm_phase phase);

    super.connect_phase(phase);
    
    driver.seq_item_port.connect(sqr.seq_item_export);
    
endfunction