module rsensor(
	       input 	  in_trig,
	       output reg out_echo
	       );
  parameter distance = 50;
   
  initial begin
     out_echo = 0;
  end
   integer 			  delay;
   
   always @( posedge in_trig ) begin
      out_echo <= 0;
      #distance out_echo <= 1;
   end
   
endmodule
