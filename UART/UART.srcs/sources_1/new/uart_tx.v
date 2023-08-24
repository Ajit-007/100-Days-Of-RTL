`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2023 23:45:51
// Design Name: 
// Module Name: uart_tx
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


module uart_tx (
    input       i_Clock,
    input       i_Reset,
    input       i_Tx_DV,
    input [7:0] i_Tx_Byte,
    output      o_Tx_Active,
    output reg  o_Tx_Serial,
    output      o_Tx_Done
);

    parameter CLK_FREQ_HZ = 100000000; // Clock frequency in Hz
    parameter BAUD_RATE = 115200;      // Baud rate in bps

    reg [15:0] tx_count = 0;
    reg [3:0]  bit_count = 0;
    reg        tx_active = 0;

    always @(posedge i_Clock or posedge i_Reset) begin
        if (i_Reset)
            tx_count <= 0;
        else if (i_Tx_DV) begin
            if (tx_count == 0) begin
                o_Tx_Serial <= 0; // Start bit
                bit_count <= 0;
                tx_active <= 1;
                tx_count <= CLK_FREQ_HZ / BAUD_RATE - 1;
            end else if (bit_count < 8) begin
                o_Tx_Serial <= i_Tx_Byte[bit_count];
                bit_count <= bit_count + 1;
                tx_count <= tx_count - 1;
            end else if (bit_count == 8) begin
                o_Tx_Serial <= 1; // Stop bit
                bit_count <= 0;
                tx_count <= tx_count - 1;
            end else if (bit_count == 9) begin
                o_Tx_Serial <= 1; // Idle
                bit_count <= 0;
                tx_active <= 0;
                tx_count <= 0;
            end
        end else if (tx_count > 0) begin
            tx_count <= tx_count - 1;
        end
    end

    assign o_Tx_Active = tx_active;
    assign o_Tx_Done = !tx_active;

endmodule
