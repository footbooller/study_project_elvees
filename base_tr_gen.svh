class base_tr_gen extends uvm_object;
    
    `uvm_object_utils(base_tr_gen)
    
    function new(string name = "base_tr_gen");
        super.new(name);
    endfunction
    
    virtual task tr_gen(int a, int b);
        $display("a");
    endtask
    
endclass
