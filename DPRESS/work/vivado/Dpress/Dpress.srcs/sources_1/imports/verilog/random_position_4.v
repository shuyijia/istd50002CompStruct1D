/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module random_position_4 (
    input clk,
    input rst,
    input [3:0] blueposindex,
    output reg [15:0] red,
    output reg [15:0] green
  );
  
  
  
  reg [15:0] M_redpos_d, M_redpos_q = 1'h0;
  reg [15:0] M_greenpos_d, M_greenpos_q = 1'h0;
  reg [3:0] M_rednum_d, M_rednum_q = 1'h0;
  reg [3:0] M_greennum_d, M_greennum_q = 1'h0;
  wire [32-1:0] M_random_num;
  reg [1-1:0] M_random_next;
  reg [32-1:0] M_random_seed;
  pn_gen_9 random (
    .clk(clk),
    .rst(rst),
    .next(M_random_next),
    .seed(M_random_seed),
    .num(M_random_num)
  );
  
  wire [16-1:0] M_alumod0_alu;
  wire [1-1:0] M_alumod0_z;
  wire [1-1:0] M_alumod0_v;
  wire [1-1:0] M_alumod0_n;
  reg [6-1:0] M_alumod0_alufn;
  reg [16-1:0] M_alumod0_a;
  reg [16-1:0] M_alumod0_b;
  alu_7 alumod0 (
    .alufn(M_alumod0_alufn),
    .a(M_alumod0_a),
    .b(M_alumod0_b),
    .alu(M_alumod0_alu),
    .z(M_alumod0_z),
    .v(M_alumod0_v),
    .n(M_alumod0_n)
  );
  
  wire [16-1:0] M_alumod1_alu;
  wire [1-1:0] M_alumod1_z;
  wire [1-1:0] M_alumod1_v;
  wire [1-1:0] M_alumod1_n;
  reg [6-1:0] M_alumod1_alufn;
  reg [16-1:0] M_alumod1_a;
  reg [16-1:0] M_alumod1_b;
  alu_7 alumod1 (
    .alufn(M_alumod1_alufn),
    .a(M_alumod1_a),
    .b(M_alumod1_b),
    .alu(M_alumod1_alu),
    .z(M_alumod1_z),
    .v(M_alumod1_v),
    .n(M_alumod1_n)
  );
  
  wire [16-1:0] M_aluadd0_alu;
  wire [1-1:0] M_aluadd0_z;
  wire [1-1:0] M_aluadd0_v;
  wire [1-1:0] M_aluadd0_n;
  reg [6-1:0] M_aluadd0_alufn;
  reg [16-1:0] M_aluadd0_a;
  reg [16-1:0] M_aluadd0_b;
  alu_7 aluadd0 (
    .alufn(M_aluadd0_alufn),
    .a(M_aluadd0_a),
    .b(M_aluadd0_b),
    .alu(M_aluadd0_alu),
    .z(M_aluadd0_z),
    .v(M_aluadd0_v),
    .n(M_aluadd0_n)
  );
  
  wire [16-1:0] M_aluadd1_alu;
  wire [1-1:0] M_aluadd1_z;
  wire [1-1:0] M_aluadd1_v;
  wire [1-1:0] M_aluadd1_n;
  reg [6-1:0] M_aluadd1_alufn;
  reg [16-1:0] M_aluadd1_a;
  reg [16-1:0] M_aluadd1_b;
  alu_7 aluadd1 (
    .alufn(M_aluadd1_alufn),
    .a(M_aluadd1_a),
    .b(M_aluadd1_b),
    .alu(M_aluadd1_alu),
    .z(M_aluadd1_z),
    .v(M_aluadd1_v),
    .n(M_aluadd1_n)
  );
  
  wire [16-1:0] M_aluadd2_alu;
  wire [1-1:0] M_aluadd2_z;
  wire [1-1:0] M_aluadd2_v;
  wire [1-1:0] M_aluadd2_n;
  reg [6-1:0] M_aluadd2_alufn;
  reg [16-1:0] M_aluadd2_a;
  reg [16-1:0] M_aluadd2_b;
  alu_7 aluadd2 (
    .alufn(M_aluadd2_alufn),
    .a(M_aluadd2_a),
    .b(M_aluadd2_b),
    .alu(M_aluadd2_alu),
    .z(M_aluadd2_z),
    .v(M_aluadd2_v),
    .n(M_aluadd2_n)
  );
  
  wire [16-1:0] M_aluadd3_alu;
  wire [1-1:0] M_aluadd3_z;
  wire [1-1:0] M_aluadd3_v;
  wire [1-1:0] M_aluadd3_n;
  reg [6-1:0] M_aluadd3_alufn;
  reg [16-1:0] M_aluadd3_a;
  reg [16-1:0] M_aluadd3_b;
  alu_7 aluadd3 (
    .alufn(M_aluadd3_alufn),
    .a(M_aluadd3_a),
    .b(M_aluadd3_b),
    .alu(M_aluadd3_alu),
    .z(M_aluadd3_z),
    .v(M_aluadd3_v),
    .n(M_aluadd3_n)
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
    M_aluadd0_a = blueposindex;
    M_aluadd0_b = 2'h2;
    M_aluadd0_alufn = 6'h00;
    M_aluadd1_a = blueposindex;
    M_aluadd1_b = 3'h4;
    M_aluadd1_alufn = 6'h00;
    M_aluadd2_a = M_random_num[0+2-:3];
    M_aluadd2_b = M_aluadd0_alu;
    M_aluadd2_alufn = 6'h00;
    M_aluadd3_a = M_random_num[3+2-:3];
    M_aluadd3_b = M_aluadd1_alu;
    M_aluadd3_alufn = 6'h00;
    M_greennum_d = M_aluadd2_alu[0+3-:4];
    M_rednum_d = M_aluadd3_alu[0+3-:4];
    M_alumod0_a = M_greennum_q;
    M_alumod0_b = 5'h10;
    M_alumod0_alufn = 6'h04;
    M_greenpos_d[(M_alumod0_alu)*1+0-:1] = 1'h1;
    M_alumod1_a = M_rednum_q;
    M_alumod1_b = 5'h10;
    M_alumod1_alufn = 6'h04;
    M_redpos_d[(M_alumod1_alu)*1+0-:1] = 1'h1;
    red = M_redpos_q;
    green = M_greenpos_q;
  end
  
  always @(posedge clk) begin
    M_redpos_q <= M_redpos_d;
    M_greenpos_q <= M_greenpos_d;
    M_rednum_q <= M_rednum_d;
    M_greennum_q <= M_greennum_d;
  end
  
endmodule