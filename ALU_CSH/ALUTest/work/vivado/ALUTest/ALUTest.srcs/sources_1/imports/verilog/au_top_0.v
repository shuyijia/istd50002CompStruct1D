/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input button,
    input start,
    output reg [15:0] red,
    output reg [15:0] blue,
    output reg [15:0] green,
    output reg [15:0] seg,
    input usb_rx,
    output reg usb_tx
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [16-1:0] M_game_red;
  wire [16-1:0] M_game_green;
  wire [16-1:0] M_game_blue;
  wire [8-1:0] M_game_score;
  reg [1-1:0] M_game_button;
  reg [1-1:0] M_game_start;
  game_2 game (
    .clk(clk),
    .rst(rst),
    .button(M_game_button),
    .start(M_game_start),
    .red(M_game_red),
    .green(M_game_green),
    .blue(M_game_blue),
    .score(M_game_score)
  );
  
  wire [8-1:0] M_seven_seg0_seg;
  reg [4-1:0] M_seven_seg0_char;
  seven_seg_3 seven_seg0 (
    .char(M_seven_seg0_char),
    .seg(M_seven_seg0_seg)
  );
  
  wire [8-1:0] M_seven_seg1_seg;
  reg [4-1:0] M_seven_seg1_char;
  seven_seg_3 seven_seg1 (
    .char(M_seven_seg1_char),
    .seg(M_seven_seg1_seg)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    usb_tx = usb_rx;
    M_game_button = button;
    M_game_start = start;
    red = M_game_red;
    blue = M_game_blue;
    green = M_game_green;
    M_seven_seg0_char = (M_game_score) - ((M_game_score) / 4'ha) * 4'ha;
    M_seven_seg1_char = (M_game_score) / 4'ha;
    seg[0+7-:8] = M_seven_seg0_seg;
    seg[8+7-:8] = M_seven_seg1_seg;
  end
endmodule