`timescale 1ns/1ps

class decode_monitor extends
      uvm_monitor;

    `uvm_component_utils(decode_monitor)

    virtual decode_if vif;

    uvm_analysis_port #(decode_transaction)
    mon_ap;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

        mon_ap = new("mon_ap", this);

    endfunction

    // -------------------------------------------------
    // Build Phase
    // -------------------------------------------------

    function void build_phase
    (
        uvm_phase phase
    );

        super.build_phase(phase);

        if (!uvm_config_db #(virtual decode_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("DECODE_MONITOR",
                       "No Virtual Interface")

        end

    endfunction

    // -------------------------------------------------
    // Run Phase
    // -------------------------------------------------

    task run_phase
    (
        uvm_phase phase
    );

        decode_transaction tr;

        forever begin

            @(posedge vif.clk);

            if (vif.decode_valid) begin

                tr =
                decode_transaction::
                type_id::
                create("tr");

                tr.instruction =
                vif.instruction;

                mon_ap.write(tr);

                `uvm_info("DECODE_MONITOR",
                          $sformatf
                          ("INST=%h",
                           tr.instruction),
                          UVM_LOW)

            end

        end

    endtask

endclass