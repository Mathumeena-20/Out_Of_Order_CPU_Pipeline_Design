`timescale 1ns/1ps

class memory_monitor extends
      uvm_monitor;

    `uvm_component_utils(memory_monitor)

    virtual memory_if vif;

    uvm_analysis_port #(memory_transaction)
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

        if (!uvm_config_db #(virtual memory_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("MEMORY_MONITOR",
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

        memory_transaction tr;

        forever begin

            @(posedge vif.clk);

            if (vif.mem_valid) begin

                tr =
                memory_transaction::
                type_id::
                create("tr");

                tr.addr = vif.addr;

                tr.data = vif.data;

                tr.read_en  = vif.read_en;

                tr.write_en = vif.write_en;

                mon_ap.write(tr);

                `uvm_info("MEMORY_MONITOR",
                          $sformatf
                          ("ADDR=%h DATA=%h",
                           tr.addr,
                           tr.data),
                          UVM_LOW)

            end

        end

    endtask

endclass