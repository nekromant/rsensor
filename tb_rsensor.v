module tb_rsensor();

   reg trig;
   wire echo;

   /* dist_bits 
    * distance == 0 : generate a random distance each query
    * distance == some_number : use a constant distance each call
    * 
    * parameter 'dist_bits'
    * How many bits delay counter should hold. 
    * This regulates the maximum distance in 
    * clock cycles. Default value == 16
    *  
    */
   rsensor #(
	     .distance(0)
	     ) r (
		  .in_trig(trig),
		  .out_echo(echo)
		  );
   
   
	     
   initial begin
      $dumpfile("out.vcd");
      $dumpvars(0,trig);
      $dumpvars(1,echo);
      $monitor("#%d trig:%d echo: %d", $time, trig, echo);
      $display ("Running rsensor testbench");
      #1 trig = 0;
      #1 trig = 1;
      #1 wait(echo==1);
      $display("sending next");
      #1 trig = 0;
      #1 trig = 1;
      #1 wait(echo==1);
      $display("sending next");
      #1 trig = 0;
      #1 trig = 1;
      #1 wait(echo==1);
      $display("sending next");
      #1 trig = 0;
      #1 trig = 1;
      #1 wait(echo==1);
      $display("sending next");
      #1 trig = 0;
      #1 trig = 1;
      #1 wait(echo==1);
      #1 $display("Done");      
   end
     
     endmodule // tb_rsensor
