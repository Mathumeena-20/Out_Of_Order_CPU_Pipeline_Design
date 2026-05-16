`timescale 1ns/1ps

module event_monitor
(
    input logic branch_mispredict,

    output logic monitor_alert
);

assign monitor_alert = branch_mispredict;

endmodule