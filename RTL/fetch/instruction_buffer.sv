module instruction_buffer
#(
    parameter DEPTH = 8
)
(
    input  logic             clk,
    input  logic             rst,

    input  logic             write_en,
    input  logic [31:0]      instruction_in,

    input  logic             read_en,

    output logic [31:0]      instruction_out,
    output logic             empty,
    output logic             full
);

logic [31:0] buffer [DEPTH-1:0];

logic [$clog2(DEPTH):0] wr_ptr;
logic [$clog2(DEPTH):0] rd_ptr;
logic [$clog2(DEPTH+1)-1:0] count;

assign empty = (count == 0);
assign full  = (count == DEPTH);

always_ff @(posedge clk) begin

    if (rst) begin

        wr_ptr <= 0;
        rd_ptr <= 0;
        count  <= 0;

    end

    else begin

        // Write
        if (write_en && !full) begin

            buffer[wr_ptr] <= instruction_in;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;

        end

        // Read
        if (read_en && !empty) begin

            instruction_out <= buffer[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;

        end

    end
end

endmodule