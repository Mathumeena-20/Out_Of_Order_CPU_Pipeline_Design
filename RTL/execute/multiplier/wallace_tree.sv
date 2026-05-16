module wallace_tree
#(
    parameter XLEN = 64
)
(
    input  logic [(2*XLEN)-1:0] partial_products,

    output logic [(2*XLEN)-1:0] result
);

assign result = partial_products;

endmodule