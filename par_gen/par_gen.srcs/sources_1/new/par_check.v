`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2023 22:36:11
// Design Name: 
// Module Name: par_check
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


module par_check (
    input [1:0] data,
    input parity,
    output valid
);

    assign valid = (data[0] ^ data[1]) == parity;

endmodule
