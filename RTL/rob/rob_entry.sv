module rob_entry
(
    input  logic             clk,
    input  logic             rst,

    input  logic             allocate,

    input  logic [5:0]       dest_phys_reg,
    input  logic [63:0]      pc,

    input  logic             writeback_valid,
    input  logic [63:0]      writeback_data,

    input  logic             flush,

    output logic             valid,
    output logic             completed,

    output logic [5:0]       dest_reg,
    output logic [63:0]      result,
    output logic [63:0]      rob_pc
);

always_ff @(posedge clk) begin

    if (rst || flush) begin

        valid      <= 0;
        completed  <= 0;

        dest_reg   <= 0;
        result     <= 0;
        rob_pc     <= 0;

    end

    else begin

        // Allocate Entry
        if (allocate) begin

            valid      <= 1;
            completed  <= 0;

            dest_reg   <= dest_phys_reg;
            rob_pc     <= pc;

        end

        // Writeback
        if (writeback_valid && valid) begin

            completed  <= 1;
            result     <= writeback_data;

        end
    end
end

endmodule