`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 01:07:44 PM
// Design Name: 
// Module Name: clk_div_timer
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


module clk_div_timer(
    input clk,
    output slow_clk
    );
    
    reg[19:0] COUNT;
    
    assign slow_clk= COUNT[19]&COUNT[18]&COUNT[17]&COUNT[16];
    
    always @(posedge clk)
    begin
    if (slow_clk)
        COUNT = 0;
    else
        COUNT = COUNT +1;
    end
    
endmodule
