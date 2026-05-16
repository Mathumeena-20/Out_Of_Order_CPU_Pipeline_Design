`timescale 1ns/1ps

class cpu_monitor extends uvm_monitor;

    `uvm_component_utils(cpu_monitor)

    // -------------------------------------------------
    // Virtual Interface
    // -------------------------------------------------

    virtual cpu_if vif;

    // -------------------------------------------------
    // Analysis Port
    // -------------------------------------------------

    uvm_analysis_port #(cpu_transaction)
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

        if (!uvm_config_db #(virtual cpu_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("CPU_MONITOR",
                       "Virtual Interface Not Found")

        end

    endfunction

    // -------------------------------------------------
    // Run Phase
    // -------------------------------------------------

    task run_phase
    (
        uvm_phase phase
    );

        cpu_transaction tr;

        forever begin

            @(posedge vif.clk);

            if (vif.valid) begin

                tr =
                cpu_transaction::type_id::
                create("tr");

                tr.instruction =
                vif.instruction;

                tr.src1 = vif.src1;
                tr.src2 = vif.src2;

                mon_ap.write(tr);

                `uvm_info("CPU_MONITOR",
                          $sformatf
                          ("INST=%h SRC1=%h SRC2=%h",
                           tr.instruction,
                           tr.src1,
                           tr.src2),
                          UVM_LOW)

            end

        end

    endtask

endclass