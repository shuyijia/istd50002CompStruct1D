/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module random_position_4 (
    input clk,
    input rst,
    input [3:0] blue,
    input next,
    output reg [15:0] red,
    output reg [15:0] green
  );
  
  
  
  reg [31:0] M_seed_d, M_seed_q = 1'h0;
  reg [15:0] M_redpos_d, M_redpos_q = 1'h0;
  reg [15:0] M_greenpos_d, M_greenpos_q = 1'h0;
  reg [3:0] M_rednum_d, M_rednum_q = 1'h0;
  reg [3:0] M_greennum_d, M_greennum_q = 1'h0;
  localparam OUTPUT_state = 1'd0;
  localparam GEN_state = 1'd1;
  
  reg M_state_d, M_state_q = OUTPUT_state;
  wire [32-1:0] M_random_num;
  reg [1-1:0] M_random_next;
  reg [32-1:0] M_random_seed;
  pn_gen_7 random (
    .clk(clk),
    .rst(rst),
    .next(M_random_next),
    .seed(M_random_seed),
    .num(M_random_num)
  );
  
  always @* begin
    M_rednum_d = M_rednum_q;
    M_redpos_d = M_redpos_q;
    M_greennum_d = M_greennum_q;
    M_greenpos_d = M_greenpos_q;
    
    M_random_seed = 32'h0000000f;
    M_random_next = 1'h1;
    M_greenpos_d = 16'h0000;
    M_redpos_d = 16'h0000;
    M_greennum_d = M_random_num[0+2-:3] + 2'h2 + blue;
    M_rednum_d = M_random_num[4+1-:2] + blue + 3'h4;
    M_greenpos_d[((M_greennum_q) - ((M_greennum_q) / 5'h10) * 5'h10)*1+0-:1] = 1'h1;
    M_redpos_d[((M_rednum_q) - ((M_rednum_q) / 5'h10) * 5'h10)*1+0-:1] = 1'h1;
    red = M_redpos_q;
    green = M_greenpos_q;
  end
  
  always @(posedge clk) begin
    M_seed_q <= M_seed_d;
    M_redpos_q <= M_redpos_d;
    M_greenpos_q <= M_greenpos_d;
    M_rednum_q <= M_rednum_d;
    M_greennum_q <= M_greennum_d;
    M_state_q <= M_state_d;
  end
  
endmodule
