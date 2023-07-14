`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 10:23:44 AM
// Design Name: 
// Module Name: time_mux_state_machine
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


module time_mux_state_machine(
    input clk,
    input [6:0] in0,
    input [6:0] in1,
    input [6:0] in2,
    input [6:0] in3,
    output reg [3:0] an,
    output reg [6:0] sseg,
    output reg dp
    );
    
    reg [1:0] cs;
    reg [1:0] ns;
    
    initial cs = 2'b00;
    
    always @(*) begin
        case(cs)
            2'b00 : ns = 2'b01;
            2'b01 : ns = 2'b10;
            2'b10 : ns = 2'b11;
            2'b11 : ns = 2'b00;
            default : ns = 2'b00;
         endcase
      end
      
      always @(*) begin
        case (cs)        //Multiplexer
            2'b00 : sseg = in0;
            2'b01 : sseg = in1;
            2'b10 : sseg = in2;
            2'b11 : sseg = in3;
            default : sseg = in0;
         endcase
        
        case (cs)
            2'b00 : begin
                an = 4'b1110;
                dp = 1'b1;
                end
            2'b01 : begin
                an = 4'b1101;
                dp = 1'b1;
                end
            2'b10 : begin
                an = 4'b1011;
                dp = 1'b0;
                end
            2'b11 : begin
                an = 4'b0111;
                dp = 1'b1;
                end
            default : begin
                an = 4'b1110;
                dp = 1'b1;
                end
        endcase
      end
      
      always @(posedge clk) begin
            cs <= ns;
       end
      
endmodule
