class inheritor_of_base_tr_gen extends base_tr_gen;
    
    `uvm_object_utils(inheritor_of_base_tr_gen)
    
    fulladder_seq test_seq;
    fulladder_seqr sqr;
    
    function new(string name = "inheritor_of_base_tr_gen");
        super.new(name);
    endfunction
    
    virtual task tr_gen(int a, int b);
    
        test_seq = fulladder_seq::type_id::create("test_seq");
         
        if(!test_seq.randomize() with {a == local::a; b == local::b;}) 
            `uvm_error(get_full_name(), "transaction.randomize() is failed");
        test_seq.start(sqr);
    endtask
        
endclass:inheritor_of_base_tr_gen
