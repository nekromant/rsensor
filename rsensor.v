module rsensor(
	       input 	  in_trig,
	       output reg out_echo
	       );
   
  initial begin
     out_echo = 0;
  end
   integer 			  delay;
   
   always @( posedge in_trig ) begin
      delay = $random;
      out_echo = 0;
      #delay out_echo <= 1;
   end
   
endmodule
