module barrel_shifter
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] data_in,
    input  logic [5:0]      shift_amt,

    input  logic            shift_left,
    input  logic            arithmetic,

    output logic [XLEN-1:0] data_out
);

always_comb begin

    if (shift_left)
        data_out = data_in << shift_amt;

    else if (arithmetic)
        data_out = $signed(data_in) >>> shift_amt;

    else
        data_out = data_in >> shift_amt;

end

endmodule