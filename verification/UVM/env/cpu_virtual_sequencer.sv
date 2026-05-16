`timescale 1ns/1ps

class cpu_virtual_sequencer extends
      uvm_sequencer;

    `uvm_component_utils
    (cpu_virtual_sequencer)

    // -------------------------------------------------
    // Handles to Sub Sequencers
    // -------------------------------------------------

    cpu_sequencer      cpu_seqr;

    fetch_sequencer    fetch_seqr;

    decode_sequencer   decode_seqr;

    execute_sequencer  execute_seqr;

    memory_sequencer   memory_seqr;

    branch_sequencer   branch_seqr;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

    endfunction

endclass