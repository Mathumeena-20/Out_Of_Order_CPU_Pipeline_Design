`timescale 1ns/1ps

class memory_driver extends
      uvm_driver #(memory_transaction);

    `uvm_component_utils(memory_driver)

    virtual memory_if vif;

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

    endfunction

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

            `uvm_fatal("MEMORY_DRIVER",
                       "No Virtual Interface")

        end

    endfunction

    task run_phase
    (
        uvm_phase phase
    );

        memory_transaction tr;

        forever begin

            seq_item_port.get_next_item(tr);

            @(posedge vif.clk);

            vif.mem_valid <= 1;

            vif.addr      <= tr.addr;

            vif.data      <= tr.data;

            vif.read_en   <= tr.read_en;

            vif.write_en  <= tr.write_en;

            `uvm_info("MEMORY_DRIVER",
                      $sformatf
                      ("ADDR=%h DATA=%h",
                       tr.addr,
                       tr.data),
                      UVM_LOW)

            @(posedge vif.clk);

            vif.mem_valid <= 0;

            seq_item_port.item_done();

        end

    endtask

endclass