`timescale 1ns/1ps

class execute_monitor extends
      uvm_monitor;

    `uvm_component_utils(execute_monitor)

    virtual execute_if vif;

    uvm_analysis_port #(execute_transaction)
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

        if (!uvm_config_db #(virtual execute_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("EXECUTE_MONITOR",
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

        execute_transaction tr;

        forever begin

            @(posedge vif.clk);

            if (vif.execute_valid) begin

                tr =
                execute_transaction::
                type_id::
                create("tr");

                tr.src1 = vif.src1;
                tr.src2 = vif.src2;

                tr.alu_op = vif.alu_op;

                tr.result = vif.result;

                mon_ap.write(tr);

                `uvm_info("EXECUTE_MONITOR",
                          $sformatf
                          ("SRC1=%h SRC2=%h RESULT=%h",
                           tr.src1,
                           tr.src2,
                           tr.result),
                          UVM_LOW)

            end

        end

    endtask

endclass