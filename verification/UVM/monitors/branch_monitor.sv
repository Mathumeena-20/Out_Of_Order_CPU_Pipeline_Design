`timescale 1ns/1ps

class branch_monitor extends
      uvm_monitor;

    `uvm_component_utils(branch_monitor)

    virtual branch_if vif;

    uvm_analysis_port #(branch_transaction)
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

        if (!uvm_config_db #(virtual branch_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("BRANCH_MONITOR",
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

        branch_transaction tr;

        forever begin

            @(posedge vif.clk);

            if (vif.branch_valid) begin

                tr =
                branch_transaction::
                type_id::
                create("tr");

                tr.pc = vif.pc;

                tr.prediction =
                vif.prediction;

                tr.actual_taken =
                vif.actual_taken;

                mon_ap.write(tr);

                `uvm_info("BRANCH_MONITOR",
                          $sformatf
                          ("PC=%h PRED=%b ACT=%b",
                           tr.pc,
                           tr.prediction,
                           tr.actual_taken),
                          UVM_LOW)

            end

        end

    endtask

endclass