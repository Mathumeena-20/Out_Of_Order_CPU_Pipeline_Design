interface cpu_if #(parameter XLEN = 64);

    logic                   valid;
    logic                   ready;

    logic [XLEN-1:0]        addr;
    logic [XLEN-1:0]        data;

    logic [3:0]             opcode;

    // -------------------------------------------------
    // Master Modport
    // -------------------------------------------------

    modport master (

        output valid,
        input  ready,

        output addr,
        output data,

        output opcode

    );

    // -------------------------------------------------
    // Slave Modport
    // -------------------------------------------------

    modport slave (

        input valid,
        output ready,

        input addr,
        input data,

        input opcode

    );

endinterface