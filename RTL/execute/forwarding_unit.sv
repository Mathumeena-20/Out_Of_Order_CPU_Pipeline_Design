module forwarding_unit
(
    input  logic [5:0] ex_dest,
    input  logic [5:0] mem_dest,

    input  logic [5:0] rs1,
    input  logic [5:0] rs2,

    output logic       forward_a,
    output logic       forward_b
);

always_comb begin

    forward_a = 0;
    forward_b = 0;

    if (rs1 == ex_dest)
        forward_a = 1;

    if (rs2 == mem_dest)
        forward_b = 1;

end

endmodule