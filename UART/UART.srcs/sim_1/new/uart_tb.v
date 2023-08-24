`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2023 00:12:49
// Design Name: 
// Module Name: uart_tb
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



module uart_tb;

    reg tb_Clock = 0;
    reg tb_Reset = 0;
    reg tb_Tx_DV = 0;
    reg [7:0] tb_Tx_Byte = 0;
    wire tb_Tx_Active;
    wire tb_Tx_Done;

    wire tb_Rx_DV;
    wire [7:0] tb_Rx_Byte;
    reg tb_Rx_Serial = 1'b1; // Initialize to 1

    uart_tx uut_tx (
        .i_Clock(tb_Clock),
        .i_Reset(tb_Reset),
        .i_Tx_DV(tb_Tx_DV),
        .i_Tx_Byte(tb_Tx_Byte),
        .o_Tx_Active(tb_Tx_Active),
        .o_Tx_Serial(),
        .o_Tx_Done(tb_Tx_Done)
    );

    uart_rx uut_rx (
        .i_Clock(tb_Clock),
        .i_Reset(tb_Reset),
        .i_Rx_Serial(tb_Rx_Serial),
        .o_Rx_DV(tb_Rx_DV),
        .o_Rx_Byte(tb_Rx_Byte)
    );

    always
        #(5) tb_Clock = ~tb_Clock;

    initial begin
        tb_Reset = 1;
        tb_Tx_DV = 0;
        tb_Tx_Byte = 8'hA5;

        // Release reset after a short delay
        #10 tb_Reset = 0;

        // Transmit a byte
        tb_Tx_DV = 1;
        #100;
        tb_Tx_DV = 0;

        // Wait for transmission to complete
        @(posedge tb_Clock) $display("Tx Done: %b", tb_Tx_Done);

        // Receive a byte
        tb_Rx_Serial = 0;
        #10 tb_Rx_Serial = 1;

        // Wait for reception to complete
        @(posedge tb_Clock) $display("Rx DV: %b, Rx Byte: %h", tb_Rx_DV, tb_Rx_Byte);

        $finish;
    end

endmodule


