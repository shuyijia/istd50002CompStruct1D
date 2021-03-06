/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module auto_4 (
    input clk,
    input rst,
    output reg [15:0] result,
    output reg [7:0] ledarray1,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  wire [16-1:0] M_alu_alu;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_5 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu(M_alu_alu),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  reg [31:0] M_count_d, M_count_q = 1'h0;
  localparam INIT_teststate = 5'd0;
  localparam ADD_teststate = 5'd1;
  localparam SUB_teststate = 5'd2;
  localparam MUL_teststate = 5'd3;
  localparam DIV_teststate = 5'd4;
  localparam AND_teststate = 5'd5;
  localparam OR_teststate = 5'd6;
  localparam XOR_teststate = 5'd7;
  localparam A_teststate = 5'd8;
  localparam INVA_teststate = 5'd9;
  localparam SHL_teststate = 5'd10;
  localparam SHR_teststate = 5'd11;
  localparam SRA_teststate = 5'd12;
  localparam CMPEQ_teststate = 5'd13;
  localparam CMPLT_teststate = 5'd14;
  localparam CMPLE_teststate = 5'd15;
  localparam END_teststate = 5'd16;
  
  reg [4:0] M_teststate_d, M_teststate_q = INIT_teststate;
  
  always @* begin
    M_teststate_d = M_teststate_q;
    M_count_d = M_count_q;
    
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    M_alu_alufn = 6'h00;
    ledarray1 = 8'h00;
    result = 16'h0000;
    M_count_d = M_count_q + 1'h1;
    
    case (M_teststate_q)
      INIT_teststate: begin
        ledarray1 = 8'hff;
        if (io_button[0+0-:1] == 1'h1) begin
          M_count_d = 32'h00000000;
          M_teststate_d = ADD_teststate;
        end
      end
      ADD_teststate: begin
        ledarray1 = 8'h01;
        M_alu_alufn = 6'h00;
        M_alu_a = 16'h0007 + io_dip[0+7+0-:1];
        M_alu_b = 16'h0001;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0007 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0001;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0008) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = SUB_teststate;
        end
      end
      SUB_teststate: begin
        ledarray1 = 8'h02;
        M_alu_alufn = 6'h01;
        M_alu_a = 16'h0007 + io_dip[0+7+0-:1];
        M_alu_b = 16'h0001;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0007 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0001;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0006) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = MUL_teststate;
        end
      end
      MUL_teststate: begin
        ledarray1 = 8'h03;
        M_alu_alufn = 6'h02;
        M_alu_a = 16'h0007 + io_dip[0+7+0-:1];
        M_alu_b = 16'h0002;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0007 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0002;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h000e) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = DIV_teststate;
        end
      end
      DIV_teststate: begin
        ledarray1 = 8'h04;
        M_alu_alufn = 6'h03;
        M_alu_a = 16'h000c;
        M_alu_b = 16'h0003 + io_dip[0+7+0-:1];
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h000c;
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0003 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0004) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = AND_teststate;
        end
      end
      AND_teststate: begin
        ledarray1 = 8'h05;
        M_alu_alufn = 6'h18;
        M_alu_a = 16'h0005 + io_dip[0+7+0-:1];
        M_alu_b = 16'h000f;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0005 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h000f;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0005) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = OR_teststate;
        end
      end
      OR_teststate: begin
        ledarray1 = 8'h06;
        M_alu_alufn = 6'h1e;
        M_alu_a = 16'h0005 + io_dip[0+7+0-:1];
        M_alu_b = 16'h000a;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0005 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h000a;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h000f) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = XOR_teststate;
        end
      end
      XOR_teststate: begin
        ledarray1 = 8'h07;
        M_alu_alufn = 6'h16;
        M_alu_a = 16'h0005 + io_dip[0+7+0-:1];
        M_alu_b = 16'h000f;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0005 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h000f;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h000a) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = A_teststate;
        end
      end
      A_teststate: begin
        ledarray1 = 8'h08;
        M_alu_alufn = 6'h1a;
        M_alu_a = 16'h0005 + io_dip[0+7+0-:1];
        M_alu_b = 16'h000f;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0005 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h000f;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0005) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = INVA_teststate;
        end
      end
      INVA_teststate: begin
        ledarray1 = 8'h09;
        M_alu_alufn = 6'h1f;
        M_alu_a = 16'hfff0 + io_dip[0+7+0-:1];
        M_alu_b = 16'h0001;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'hfff0 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0001;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h000f) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = SHL_teststate;
        end
      end
      SHL_teststate: begin
        ledarray1 = 8'h0a;
        M_alu_alufn = 6'h20;
        M_alu_a = 16'h000f + io_dip[0+7+0-:1];
        M_alu_b = 16'h0001;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h000f + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0001;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h001e) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = SHR_teststate;
        end
      end
      SHR_teststate: begin
        ledarray1 = 8'h0b;
        M_alu_alufn = 6'h21;
        M_alu_a = 16'he000;
        M_alu_b = 16'h0008 + io_dip[0+7+0-:1];
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'he000;
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0008 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h00e0) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = SRA_teststate;
        end
      end
      SRA_teststate: begin
        ledarray1 = 8'h0c;
        M_alu_alufn = 6'h23;
        M_alu_a = 16'he000;
        M_alu_b = 16'h0008 + io_dip[0+7+0-:1];
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'he000;
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0008 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'hffe0) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = CMPEQ_teststate;
        end
      end
      CMPEQ_teststate: begin
        ledarray1 = 8'h0d;
        M_alu_alufn = 6'h31;
        M_alu_a = 16'h000d + io_dip[0+7+0-:1];
        M_alu_b = 16'h000d;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h000d + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h000d;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0001) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = CMPLT_teststate;
        end
      end
      CMPLT_teststate: begin
        ledarray1 = 8'h0e;
        M_alu_alufn = 6'h32;
        M_alu_a = 16'h0006 + io_dip[0+7+0-:1];
        M_alu_b = 16'h0007;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0006 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0007;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0001) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = CMPLE_teststate;
        end
      end
      CMPLE_teststate: begin
        ledarray1 = 8'h0f;
        M_alu_alufn = 6'h33;
        M_alu_a = 16'h0007 + io_dip[0+7+0-:1];
        M_alu_b = 16'h0007;
        if (M_count_q[27+1-:2] == 2'h0) begin
          result = 16'h0007 + io_dip[0+7+0-:1];
        end
        if (M_count_q[27+1-:2] == 2'h1) begin
          result = 16'h0007;
        end
        if (M_count_q[27+1-:2] == 2'h2) begin
          result = M_alu_alu;
          if (M_alu_alu == 16'h0001) begin
            ledarray1[7+0-:1] = 1'h1;
          end
        end
        if (M_count_q[27+1-:2] == 2'h3) begin
          M_count_d = 32'h00000000;
          M_teststate_d = INIT_teststate;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_teststate_q <= M_teststate_d;
    
    if (rst == 1'b1) begin
      M_count_q <= 1'h0;
    end else begin
      M_count_q <= M_count_d;
    end
  end
  
endmodule
