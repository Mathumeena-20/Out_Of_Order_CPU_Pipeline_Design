`timescale 1ns/1ps

class decode_sequencer extends
      uvm_sequencer #(decode_transaction);

    `uvm_component_utils(decode_sequencer)

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name,
        uvm_component parent
    );

        super.new(name, parent);

    endfunction

    // -------------------------------------------------
    // Build Phase
    // -------------------------------------------------

    function void build_phase
    (
        uvm_phase phase
    );

        super.build_phase(phase);

        `uvm_info("DECODE_SEQUENCER",
                  "Decode Sequencer Build",
                  UVM_LOW)

    endfunction

endclass