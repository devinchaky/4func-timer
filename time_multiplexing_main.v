`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2023 10:15:01 AM
// Design Name: 
// Module Name: time_multiplexing_main
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


module time_multiplexing_main(
    input clk,
    input reset,
    input start,
    input [1:0] m,
    input [3:0] load1,
    input [3:0] load2,
    output [3:0] an,
    output [6:0] sseg,
    output dp
//    output [2:0] state
    );
    
    wire [6:0] in0, in1, in2, in3;
    wire [3:0] time0, time1, time2, time3;
    wire slow_clk_t, slow_clk_d;
    wire [2:0] state;
    
    //Module instantiation of hextosegment decoder
    hexto7segment c1(.x(time0), .r(in0));
    hexto7segment c2(.x(time1), .r(in1));
    hexto7segment c3(.x(time2), .r(in2));
    hexto7segment c4(.x(time3), .r(in3));
    
    //Module instantiation of the clock divider
    clk_div_disp c5 (.clk(clk), .slow_clk(slow_clk_d));
    clk_div_timer c6 (.clk(clk), .slow_clk(slow_clk_t));
    
    //HLSM for states
    HLSM c8 (.clk(clk), .reset(reset), .start(start), .state(state)); 
    
    //Module instatiation for counter
    time_count timer(.clk(slow_clk_t), .state(state), .m(m), .load1(load1), .load2(load2), .time0(time0), .time1(time1), .time2(time2), .time3(time3));
    
    //Module instantiation of the multiplexer
    time_mux_state_machine c7 (
        .clk (slow_clk_d), 
        .in0 (in0),
        .in1 (in1),
        .in2 (in2),
        .in3 (in3),
        .an (an),
        .sseg (sseg),
        .dp(dp));
        
endmodule
