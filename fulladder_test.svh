class fulladder_test extends uvm_test;
    `uvm_component_utils (fulladder_test)
    function new (string name = "fulladder_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction    

    virtual tb_if intf;
    
    task test_1();
        intf.res();
        
	for(int i = 0; i < 5; i = i + 1) begin
	    intf.in(i, i+1);
	end
    endtask
    
    
    extern function void build_phase( uvm_phase phase );
    extern task main_phase( uvm_phase phase );
    
endclass: fulladder_test



function void fulladder_test::build_phase (uvm_phase phase);
    super.build_phase (phase);
//     fulladder_config cfg = sfr_config::type_id::create("cfg")
    if (!uvm_config_db #(virtual tb_if)::get(this, "", "intf", intf)) begin
      `uvm_error("interface_get", "Unable to find the intf virtual interface in the uvm_config_db")
    end
endfunction

task fulladder_test::main_phase (uvm_phase phase);
    
    
//     super.main_phase(phase);
    phase.raise_objection(this);
//     #140;
    `uvm_info(get_full_name(), "hello_world\n", UVM_NONE)
    test_1();
    `uvm_info(get_full_name(), "hello_end\n", UVM_NONE)
    
    repeat(3) @(posedge intf.clk);
    phase.drop_objection(this);
    
endtask