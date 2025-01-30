class fulladder_test extends fulladder_base_test;
    `uvm_component_utils(fulladder_test)
    function new(string name = "fulladder_test", uvm_component parent = null);//конструктор 
        super.new(name, parent);
    endfunction
    extern task main_phase(uvm_phase phase);
    
endclass:fulladder_test

task fulladder_test::main_phase(uvm_phase phase);
  
    fulladder_seq test_seq;
    
    phase.raise_objection(this);

    test_seq = fulladder_seq::type_id::create("test_seq");
    
     intf.res();
    repeat(10) begin 
    if(!test_seq.randomize())
        `uvm_error(get_full_name(), "test_seq.randomize() is failed");
        test_seq.start(env.agent.sqr);
    end
    @(posedge intf.clk);
    
    phase.drop_objection(this);
    
endtask