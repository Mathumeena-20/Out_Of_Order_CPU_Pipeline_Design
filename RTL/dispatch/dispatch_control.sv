module dispatch_control
(
    input  logic         valid_inst,

    input  logic         rob_full,
    input  logic         rs_full,
    input  logic         lsq_full,

    input  logic         is_load,
    input  logic         is_store,

    output logic         dispatch_enable,
    output logic         stall_pipeline
);

always_comb begin

    dispatch_enable = 0;
    stall_pipeline  = 0;

    // ROB Full
    if (rob_full) begin

        dispatch_enable = 0;
        stall_pipeline  = 1;

    end

    // RS Full
    else if (rs_full) begin

        dispatch_enable = 0;
        stall_pipeline  = 1;

    end

    // LSQ Full
    else if ((is_load || is_store) && lsq_full) begin

        dispatch_enable = 0;
        stall_pipeline  = 1;

    end

    else if (valid_inst) begin

        dispatch_enable = 1;
        stall_pipeline  = 0;

    end
end

endmodule