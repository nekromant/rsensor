`timescale 1ps / 1ps


module tb_detector();

   reg   			clk;
   reg 				ask_echo;
   reg				echo;
   wire           	valid;
   wire 		 	trig;
   wire  	 [15:0] echo_time;
   
   parameter distance=0;
   
   detector d(
	     .clk(clk),
	     .ask_echo(ask_echo),
		 .echo(echo),
		 valid(valid),
		 trig(trig),
		 echo_time(echo_time)
	     );
   

  
   
   initial begin
        forever #5 clk <= ~clk;     	
	end

   initial begin
      $dumpfile("out.vcd");
      //$dumpvars(0,trig);
      //$dumpvars(1,echo);
      $monitor("#%d ask_echo:%d echo: %d echo_time: %d", $time, ask_echo, echo, echo_time);
      $display ("Running detector testbench");
      #1 ask_echo = 0;
      #1 ask_echo = 1;
	  update_delay;
      #delay;
	  #1 echo = 1;
	  #10;
      $display("sending next");
	  #1 ask_echo = 0;
      #1 ask_echo = 1;
	  update_delay;
      #delay;
	  #1 echo = 1;
	  #10;
      
      $display("sending next");
      #1 ask_echo = 0;
      #1 ask_echo = 1;
	  update_delay;
      #delay;
	  #1 echo = 1;
	  #10;
      $display("sending next");
      #1 ask_echo = 0;
      #1 ask_echo = 1;
	  update_delay;
      #delay;
	  #1 echo = 1;
	  #10;
      $display("sending next");
      #1 ask_echo = 0;
      #1 ask_echo = 1;
	  update_delay;
      #delay;
	  #1 echo = 1;
	  #10;
      #1 $display("Done");      
   end
   
   task update_delay;
     begin
     if (distance == 0)
	delay <= $random;
      else
	delay <= distance;
     end
   endtask
     
     endmodule // tb_rsensor
