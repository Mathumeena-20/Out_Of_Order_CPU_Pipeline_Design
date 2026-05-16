`timescale 1ns/1ps

class cpu_virtual_sequence extends
      uvm_sequence;

    `uvm_object_utils
    (cpu_virtual_sequence)

    // -------------------------------------------------
    // Virtual Sequencer Handle
    // -------------------------------------------------

    cpu_virtual_sequencer vseqr;

    // -------------------------------------------------
    // Sub Sequences
    // -------------------------------------------------

    cpu_transaction cpu_tr;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "cpu_virtual_sequence"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Body Task
    // -------------------------------------------------

    task body();

        `uvm_info("CPU_VSEQ",
                  "Starting CPU Virtual Sequence",
                  UVM_LOW)

        #100;

        `uvm_info("CPU_VSEQ",
                  "Ending CPU Virtual Sequence",
                  UVM_LOW)

    endtask

endclass