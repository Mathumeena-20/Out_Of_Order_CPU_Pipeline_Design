`timescale 1ns/1ps

class decode_driver extends
      uvm_driver #(decode_transaction);

    `uvm_component_utils(decode_driver)

    virtual decode_if vif;

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

    endfunction

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

            `uvm_fatal("DECODE_DRIVER",
                       "No Virtual Interface")

        end

    endfunction

    task run_phase
    (
        uvm_phase phase
    );

        decode_transaction tr;

        forever begin

            seq_item_port.get_next_item(tr);

            @(posedge vif.clk);

            vif.decode_valid <= 1;

            vif.instruction <= tr.instruction;

            `uvm_info("DECODE_DRIVER",
                      $sformatf
                      ("Instruction=%h",
                       tr.instruction),
                      UVM_LOW)

            @(posedge vif.clk);

            vif.decode_valid <= 0;

            seq_item_port.item_done();

        end

    endtask

endclass