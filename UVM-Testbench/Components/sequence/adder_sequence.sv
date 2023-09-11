class adder_sequence extends uvm_sequence;
    `uvm_object_utils(adder_sequence)
    
    function new(string name = "adder_sequence");
        super.new(name);
    endfunction
    
    adder_packet packet_to_sequencer;
    
    extern task body();
endclass


task adder_sequence::body();
    repeat(5)
    begin
        packet_to_sequencer = adder_packet::type_id::create("packet_to_sequencer");
        
        start_item(packet_to_sequencer);
        assert(packet_to_sequencer.randomize());
        finish_item(packet_to_sequencer);
    end
endtask
