`timescale 1ns/1ps

class execute_sequencer extends
      uvm_sequencer #(execute_transaction);

    `uvm_component_utils(execute_sequencer)

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

        `uvm_info("EXECUTE_SEQUENCER",
                  "Execute Sequencer Build",
                  UVM_LOW)

    endfunction

endclass