`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2023 23:08:22
// Design Name: 
// Module Name: four_mux_tb
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


module four_mux_tb();
    reg a,b,c,d;
    reg [1:0]sel;
    wire out;
    
    four_mux dut( .a(a), .b(b), .c(c), .d(d), .sel(sel), .out(out));
    
initial begin
    sel=2'b00;a=0;b=1;c=0;d=1;
    #5
    sel=2'b01;a=0;b=1;c=0;d=1;
    #5
    sel=2'b10;a=0;b=1;c=0;d=1;
    #5
    sel=2'b11;a=0;b=1;c=0;d=1;
end    
    
endmodule
