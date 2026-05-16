`timescale 1ns/1ps

class cpu_driver extends
      uvm_driver #(cpu_transaction);

    `uvm_component_utils(cpu_driver)

    // -------------------------------------------------
    // Virtual Interface
    // -------------------------------------------------

    virtual cpu_if vif;

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

            `uvm_fatal("CPU_DRIVER",
                       "Virtual Interface Not Set")

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

            seq_item_port.get_next_item(tr);

            drive_transaction(tr);

            seq_item_port.item_done();

        end

    endtask

    // -------------------------------------------------
    // Drive Task
    // -------------------------------------------------

    task drive_transaction
    (
        cpu_transaction tr
    );

        @(posedge vif.clk);

        vif.valid <= 1;

        vif.instruction <= tr.instruction;

        vif.src1 <= tr.src1;
        vif.src2 <= tr.src2;

        `uvm_info("CPU_DRIVER",
                  $sformatf
                  ("INST=%h SRC1=%h SRC2=%h",
                   tr.instruction,
                   tr.src1,
                   tr.src2),
                  UVM_LOW)

        @(posedge vif.clk);

        vif.valid <= 0;

    endtask

endclass