`timescale 1ns/1ps

class cpu_sequencer extends
      uvm_sequencer #(cpu_transaction);

    `uvm_component_utils(cpu_sequencer)

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

        `uvm_info("CPU_SEQUENCER",
                  "CPU Sequencer Build Phase",
                  UVM_LOW)

    endfunction

    // -------------------------------------------------
    // Connect Phase
    // -------------------------------------------------

    function void connect_phase
    (
        uvm_phase phase
    );

        super.connect_phase(phase);

        `uvm_info("CPU_SEQUENCER",
                  "CPU Sequencer Connected",
                  UVM_LOW)

    endfunction

endclass