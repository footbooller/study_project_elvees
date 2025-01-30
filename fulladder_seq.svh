  //генератор транзакций
class fulladder_seq extends uvm_sequence#(fulladder_transaction);

    `uvm_object_utils(fulladder_seq)
    fulladder_transaction transaction;
    
    function new(string name = "fulladder_seq");
        super.new(name);
    endfunction
    
    rand logic [31:0] a;
    rand logic [31:0] b;
    
    extern task body();
    
    
endclass:fulladder_seq
    
task fulladder_seq::body();
    
    transaction = fulladder_transaction::type_id::create("transaction");
        
    start_item(transaction);
    if(!transaction.randomize() with {a == local::a; b == local::b;})
        `uvm_error(get_full_name(), "transaction.randomize() is failed");
    finish_item(transaction);
        
endtask:body
