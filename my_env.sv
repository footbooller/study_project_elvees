class my_env extends uvm_env;

    'uvm_component_utils (my_env)
    function new (string name = "my_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction
endclass