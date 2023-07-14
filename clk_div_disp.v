`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 10:35:32 AM
// Design Name: 
// Module Name: clk_div_disp
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


module clk_div_disp(
    input clk,
    output slow_clk
    );
    
    reg[15:0] COUNT;
    
    assign slow_clk=COUNT[15];
    
    always @(posedge clk)
    begin
        COUNT = COUNT +1;
    end
    
endmodule
