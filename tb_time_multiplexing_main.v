`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2023 02:38:56 PM
// Design Name: 
// Module Name: tb_time_multiplexing_main
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


module tb_time_multiplexing_main;

reg clk;
reg reset;
reg start;
reg m;

wire [3:0]an;
wire [6:0]sseg;
wire dp;
wire [2:0] state;

time_multiplexing_main uut(.clk(clk), .reset(reset), .start(start), .m(m), .an(an), .sseg(sseg), .dp(dp), .state(state));

initial
begin

clk = 0;
reset = 0;
start = 0;
m = 0;

#20;

start = 1;

#20;

start = 0;

#200;

start = 1;

#10;

start = 0;

#50;

start = 1;

#30;
start = 0;

#100;

reset=1;

#200; 

reset = 0;

#50;

m = 1;

#20;

start = 1;

#10;

start = 0;

end

always
#5 clk = ~clk;


endmodule
