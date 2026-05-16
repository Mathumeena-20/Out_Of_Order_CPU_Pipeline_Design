`timescale 1ns/1ps

class branch_agent extends uvm_agent;

    `uvm_component_utils(branch_agent)

    // -------------------------------------------------
    // Components
    // -------------------------------------------------

    branch_driver      drv;
    branch_monitor     mon;
    branch_sequencer   seqr;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

    endfunction

    // -------------------------------------------------
    // Build Phase
    // -------------------------------------------------

    function void build_phase
    (uvm_phase phase);

        super.build_phase(phase);

        drv =
        branch_driver::type_id::
        create("drv", this);

        mon =
        branch_monitor::type_id::
        create("mon", this);

        seqr =
        branch_sequencer::type_id::
        create("seqr", this);

    endfunction

    // -------------------------------------------------
    // Connect Phase
    // -------------------------------------------------

    function void connect_phase
    (uvm_phase phase);

        drv.seq_item_port.connect
        (seqr.seq_item_export);

    endfunction

endclass