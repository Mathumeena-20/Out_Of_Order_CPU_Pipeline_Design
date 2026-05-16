`timescale 1ns/1ps

class fetch_sequencer extends
      uvm_sequencer #(fetch_transaction);

    `uvm_component_utils(fetch_sequencer)

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

        `uvm_info("FETCH_SEQUENCER",
                  "Fetch Sequencer Build",
                  UVM_LOW)

    endfunction

endclass