`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:39:57 02/20/2013 
// Design Name: 
// Module Name:    detector 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module detector(
  input 		 			clk,
	input 		 			ask_echo,
	input 			 		echo,
	output           		valid,
	output 		 			trig,
	output   reg [15:0] 	echo_time
		);
	
	reg [15:0] 	 counter;
	
	initial begin
	echo_time 		 <= 16'b0000_0000_0000_0000;
	trig 				 <= 0;
	counter 			 <= 16'b0000_0000_0000_0000;
	valid           <= 0;
	end
	
	always @(posedge ask_echo & clk) begin
		trig <= 1;
		
	always @(posedge clk)
		if (trig) begin
			   counter <= counter + 1;
			   if (counter=16'b1111_1111_1111_1111) begin
						    trig      <= 0;
						    counter   <= 16'b0000_0000_0000_0000;
						    echo_time <= 16'b1111_1111_1111_1111;
						   end
			   else if (echo) begin
			   		   echo_time <= counter;
					   valid     <= 1'b1;
					  end
					 end


endmodule
