`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2023 00:07:49
// Design Name: 
// Module Name: uart_rx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx (
    input        i_Clock,
    input        i_Reset,
    input        i_Rx_Serial,
    output       o_Rx_DV,
    output [7:0] o_Rx_Byte
);

    parameter CLK_FREQ_HZ = 100000000; // Clock frequency in Hz
    parameter BAUD_RATE = 115200;      // Baud rate in bps

    reg [15:0] rx_count = 0;
    reg [3:0]  bit_count = 0;
    reg [7:0]  rx_byte = 0;
    reg        rx_dv = 0;

    always @(posedge i_Clock or posedge i_Reset) begin
        if (i_Reset)
            rx_count <= 0;
        else if (rx_count == 0) begin
            bit_count <= 0;
            rx_byte <= 0;
            rx_dv <= 0;
            if (i_Rx_Serial == 0) begin
                rx_count <= CLK_FREQ_HZ / BAUD_RATE - 1;
            end
        end else if (bit_count < 8) begin
            rx_byte <= {rx_byte[6:0], i_Rx_Serial};
            bit_count <= bit_count + 1;
            rx_count <= rx_count - 1;
        end else if (bit_count == 8) begin
            bit_count <= 0;
            rx_count <= rx_count - 1;
        end else if (bit_count == 9) begin
            rx_dv <= 1;
            bit_count <= 0;
            rx_count <= 0;
        end
    end

    assign o_Rx_DV = rx_dv;
    assign o_Rx_Byte = rx_byte;

endmodule
