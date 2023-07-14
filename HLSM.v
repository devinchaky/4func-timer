`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 06:20:30 PM
// Design Name: 
// Module Name: HLSM
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


module HLSM(
    input clk,
    input reset,
    input start,
    output [2:0] state
    );
    
    reg [2:0] current_state;
    reg[2:0] next_state;
    
    assign state = current_state;
    
    localparam STATE0 = 3'b000,
               STATE1 = 3'b001,
               STATE2 = 3'b010,
               STATE3 = 3'b011,
               STATE4 = 3'b100,
               STATE5 = 3'b101;
    
    initial current_state = STATE0;
    
    always @(*) begin
        case (current_state)
            STATE0: begin
                if(start) next_state = STATE3;
                //else if(reset) next_state = STATE0;
                else next_state = STATE0;
                end
            STATE1: begin
                if (reset) next_state = STATE4;
                else if (start) next_state = STATE5;
                else next_state = STATE1;
                end
            STATE2 : begin
                if (reset) next_state = STATE4;
                else if (start) next_state = STATE3;
                else next_state = STATE2;
                end
            STATE3 : begin
                if (!start) next_state = STATE1;
                else next_state = STATE3;
                end
            STATE4: begin
                if (!reset) next_state = STATE0;
                else next_state = STATE4;
                end
            STATE5: begin
                if (!start) next_state = STATE2;
                else next_state = STATE5;
                end
            default : begin
                if(reset && !start) next_state = STATE4;
                else if (start && !reset) next_state = STATE3;
                else if (start && reset) next_state = STATE3;
                else if (!start && !reset) next_state = STATE0;
                else next_state = STATE0;
                end
       endcase
    end
    
    always @(posedge clk) begin
        current_state <= next_state;
    end
    
    
    
endmodule
