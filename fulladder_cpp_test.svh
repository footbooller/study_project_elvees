class fulladder_cpp_test extends fulladder_base_test;
    `uvm_component_utils(fulladder_cpp_test)
    function new(string name = "fulladder_cpp_test", uvm_component parent = null);//конструктор 
        super.new(name, parent);
    endfunction
    extern task main_phase(uvm_phase phase);
    
    inheritor_of_base_tr_gen inh_class; 
    
            
endclass:fulladder_cpp_test

task fulladder_cpp_test::main_phase(uvm_phase phase);

    phase.raise_objection(this);
    
    inh_class = inheritor_of_base_tr_gen::type_id::create("inh_class");
    
    inh_class.sqr = env.agent.sqr;
    
    intf.local_base_tr_gen = inh_class;//присвоение в handle базового класса объекта унаследованного класса
    
    intf.sv_test();
    @(posedge intf.clk);
    
    phase.drop_objection(this);
    
endtask

