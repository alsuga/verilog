module perceptron(x1, x2, w1, w2, b, clk_in, out);
  parameter N = 8;
	input clk_in;
	input [(N - 1):0] x1, x2, w1, w2;
	input [(N * 2) - 1: 0] b;
	output reg out = 0;
  
	reg [(N - 1):0] xx1, xx2, ww1, ww2;
	reg [(N * 2) - 1: 0] xw1, xw2, sum, b2 = 0;
	
	always @(posedge(clk_in)) begin
    xx1 <= x1;
    xx2 <= x2;
    ww1 <= w1;
    ww2 <= w2;
	  xw1 <= xx1 * ww1;
	  xw2 <= xx2 * ww2;
	  sum <= xw1 + xw2 + b2;
    b2  <= b;
	  if(sum < 320)
        out <= 0;
	  else
	      out <= 1; 
	end

endmodule 