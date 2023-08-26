`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2023 22:14:24
// Design Name: 
// Module Name: four_mux
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

//4 X 1 MUX using case statement

module four_mux(a,b,c,d,sel,out);

input a,b,c,d;
input [1:0]sel;
output out;
reg out;

always@(a or b or c or d or sel)begin
    case(sel)
        2'b00: out = a;
        2'b01: out = b;
        2'b10: out = c;
        2'b11: out = d;
    endcase
end
    
endmodule

//4 X 1 MUX using Behavioural Modelling

//module four_mux(a,b,c,d,sel,out);
//input a,b,c,d;
//input [1:0]sel;
//output out;
//reg out;

//always@(*)begin
//    if(sel == 2'b00)
//        out = a;
//    else if(sel == 2'b01)
//        out = b;
//    else if(sel == 2'b10)
//        out = c;
//    else if(sel == 2'b11)
//        out = d;
//end

//endmodule
