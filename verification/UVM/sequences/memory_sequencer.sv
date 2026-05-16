`timescale 1ns/1ps

class memory_sequencer extends
      uvm_sequencer #(memory_transaction);

    `uvm_component_utils(memory_sequencer)

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

        `uvm_info("MEMORY_SEQUENCER",
                  "Memory Sequencer Build",
                  UVM_LOW)

    endfunction

endclass