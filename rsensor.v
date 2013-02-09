module rsensor(
	       input 	  in_trig,
	       output reg out_echo
	       );
   parameter distance=0;
   parameter dist_bits=16;
   
  initial begin
     out_echo = 0;
  end
   reg [dist_bits-1:0]			  delay;
   
   initial begin
      update_delay;
   end
   always @( posedge in_trig ) begin
      out_echo <= 0;
      update_delay;
      #delay out_echo <= 1;
   end

   task update_delay;
     begin
     if (distance == 0)
	delay <= $random;
      else
	delay <= ditance;
     end
   endtask
endmodule
