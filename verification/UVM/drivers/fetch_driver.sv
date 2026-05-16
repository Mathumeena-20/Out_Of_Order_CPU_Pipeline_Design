`timescale 1ns/1ps

class fetch_driver extends
      uvm_driver #(fetch_transaction);

    `uvm_component_utils(fetch_driver)

    virtual fetch_if vif;

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

        if (!uvm_config_db #(virtual fetch_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("FETCH_DRIVER",
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

            seq_item_port.get_next_item(tr);

            @(posedge vif.clk);

            vif.fetch_valid <= 1;

            vif.pc <= tr.pc;

            `uvm_info("FETCH_DRIVER",
                      $sformatf
                      ("PC=%h",
                       tr.pc),
                      UVM_LOW)

            @(posedge vif.clk);

            vif.fetch_valid <= 0;

            seq_item_port.item_done();

        end

    endtask

endclass