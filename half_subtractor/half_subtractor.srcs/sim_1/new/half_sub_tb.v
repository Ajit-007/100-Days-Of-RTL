`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2023 22:18:16
// Design Name: 
// Module Name: half_sub_tb
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


module half_sub_tb;

    reg a;
    reg b;
    wire diff;
    wire borrow;
    
    half_sub uut (
           .a(a),
           .b(b),
           .diff(diff),
           .borrow(borrow)
       );
       
    initial begin
               $display("a | b | diff | borrow");
               $display("----------------------");
               a = 0; b = 0;
               #10;
               $display("%b | %b |   %b   |   %b", a, b, diff, borrow);
       
               a = 0; b = 1;
               #10;
               $display("%b | %b |   %b   |   %b", a, b, diff, borrow);
       
               a = 1; b = 0;
               #10;
               $display("%b | %b |   %b   |   %b", a, b, diff, borrow);
       
               a = 1; b = 1;
               #10;
               $display("%b | %b |   %b   |   %b", a, b, diff, borrow);
       
               $finish;
           end
       
endmodule
