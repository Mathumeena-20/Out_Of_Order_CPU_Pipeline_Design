`timescale 1ns/1ps

class branch_driver extends
      uvm_driver #(branch_transaction);

    `uvm_component_utils(branch_driver)

    virtual branch_if vif;

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

    endfunction

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

            `uvm_fatal("BRANCH_DRIVER",
                       "No Virtual Interface")

        end

    endfunction

    task run_phase
    (
        uvm_phase phase
    );

        branch_transaction tr;

        forever begin

            seq_item_port.get_next_item(tr);

            @(posedge vif.clk);

            vif.branch_valid <= 1;

            vif.pc <= tr.pc;

            vif.prediction   <= tr.prediction;

            vif.actual_taken <= tr.actual_taken;

            `uvm_info("BRANCH_DRIVER",
                      $sformatf
                      ("PC=%h PRED=%b ACT=%b",
                       tr.pc,
                       tr.prediction,
                       tr.actual_taken),
                      UVM_LOW)

            @(posedge vif.clk);

            vif.branch_valid <= 0;

            seq_item_port.item_done();

        end

    endtask

endclass