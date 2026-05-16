`timescale 1ns/1ps

class decode_agent extends uvm_agent;

    `uvm_component_utils(decode_agent)

    // -------------------------------------------------
    // Components
    // -------------------------------------------------

    decode_driver      drv;
    decode_monitor     mon;
    decode_sequencer   seqr;

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
        decode_driver::type_id::
        create("drv", this);

        mon =
        decode_monitor::type_id::
        create("mon", this);

        seqr =
        decode_sequencer::type_id::
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