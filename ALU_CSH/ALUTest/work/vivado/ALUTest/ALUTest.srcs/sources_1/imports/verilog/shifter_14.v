/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_14 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] op
  );
  
  
  
  reg quotient;
  reg remainder;
  
  always @* begin
    
    case (alufn[0+1-:2])
      2'h0: begin
        op = a;
        if (a == 16'h8000) begin
          op = 16'h0001;
        end
        if (a != 16'h8000) begin
          op = a << 1'h1;
        end
      end
      2'h1: begin
        op = a;
        if (a == 16'h0001) begin
          op = 16'h8000;
        end
        if (a != 16'h0001) begin
          op = a >> 1'h1;
        end
      end
      2'h3: begin
        op = $signed(a) >>> b[0+4-:5];
      end
      default: begin
        op = a;
      end
    endcase
  end
endmodule
