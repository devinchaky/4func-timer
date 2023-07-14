`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 12:16:41 PM
// Design Name: 
// Module Name: time_count
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


module time_count(
    input clk,
    input [2:0] state,
    input [1:0] m,
    input [3:0] load1,
    input [3:0] load2,
    output [3:0] time0,
    output [3:0] time1,
    output [3:0] time2,
    output [3:0] time3
    );
    
    reg [14:0] count;
    reg [1:0] current_mode;
    wire [14:0] initial_load;
    
    initial count = 0;
    
    assign time0 = count % 10;
    assign time1 = (count/10) % 10;
    assign time2 = (count/100) % 10;
    assign time3 = (count/1000) % 10;
    assign initial_load = ((load2%10)*1000) + ((load1%10)*100);
    
    always@ (*) begin
        case(m)
            2'b00: current_mode = 2'b00;
            2'b01: current_mode = 2'b01;
            2'b10: current_mode = 2'b10;
            2'b11: current_mode = 2'b11;
            default : current_mode = 2'b00;
        endcase
    end
    
    always@ (posedge clk) begin
        case (current_mode)
            2'b00: case(state)
                    3'b000 : count <= 0;
                    3'b001 : begin
                        if (count >= 9999) count <= 9999;
                        else count <= count +1;
                        end
                    default : count <= count;
                  endcase
            2'b01: case(state)
                     3'b000 : count <= initial_load;
                     3'b001 : begin
                        if (count >= 9999) count <= 9999;
                        else count <= count +1;
                        end
                     default : count <= count;
                   endcase
            2'b10: case(state)
                    3'b000 : count <= 9999;
                    3'b001 : begin
                        if (count == 0) count <= 0;
                        else count <= count -1;
                        end
                    default : count <= count;
                  endcase
             2'b11: case (state)
                      3'b000: count <= initial_load;
                      3'b001 : begin
                        if (count == 0) count <= 0;
                        else count <= count -1;
                        end
                      default : count <= count;
                    endcase
            default : count <= count;
        endcase
    end
    
    
endmodule
