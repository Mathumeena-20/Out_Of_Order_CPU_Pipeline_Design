`timescale 1ns/1ps

class fetch_monitor extends
      uvm_monitor;

    `uvm_component_utils(fetch_monitor)

    virtual fetch_if vif;

    uvm_analysis_port #(fetch_transaction)
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

        if (!uvm_config_db #(virtual fetch_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("FETCH_MONITOR",
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

        fetch_transaction tr;

        forever begin

            @(posedge vif.clk);

            if (vif.fetch_valid) begin

                tr =
                fetch_transaction::
                type_id::
                create("tr");

                tr.pc = vif.pc;

                mon_ap.write(tr);

                `uvm_info("FETCH_MONITOR",
                          $sformatf
                          ("PC=%h",
                           tr.pc),
                          UVM_LOW)

            end

        end

    endtask

endclass