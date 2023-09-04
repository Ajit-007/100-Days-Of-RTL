`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2023 22:38:33
// Design Name: 
// Module Name: par_check_tb
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


module par_check_tb;
    reg [1:0] tb_data;
    wire tb_parity; // Wire for tb_parity
    wire tb_valid;

    par_gen par_gen_inst (
        .data(tb_data),
        .parity(tb_parity) // Connect tb_parity as an output wire
    );

    par_check par_check_inst (
        .data(tb_data),
        .parity(tb_parity),
        .valid(tb_valid)
    );

    initial begin
        $display("Data | Parity | Valid");
        $display("---------------------");

        // Simulate different input scenarios
        #10;
        tb_data = 2'b00;
        $display("%b   |   %b    |   %b", tb_data, tb_parity, tb_valid);

        #10;
        tb_data = 2'b01;
        $display("%b   |   %b    |   %b", tb_data, tb_parity, tb_valid);

        #10;
        tb_data = 2'b10;
        $display("%b   |   %b    |   %b", tb_data, tb_parity, tb_valid);

        #10;
        tb_data = 2'b11;
        $display("%b   |   %b    |   %b", tb_data, tb_parity, tb_valid);

        $finish;
    end

endmodule


