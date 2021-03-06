/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_myBlinker_blink;
  blinker_2 myBlinker (
    .clk(clk),
    .rst(rst),
    .blink(M_myBlinker_blink)
  );
  wire [8-1:0] M_manual_ledarray1;
  wire [16-1:0] M_manual_result;
  wire [24-1:0] M_manual_io_led;
  wire [8-1:0] M_manual_io_seg;
  wire [4-1:0] M_manual_io_sel;
  reg [5-1:0] M_manual_io_button;
  reg [24-1:0] M_manual_io_dip;
  manual_3 manual (
    .clk(clk),
    .rst(rst),
    .io_button(M_manual_io_button),
    .io_dip(M_manual_io_dip),
    .ledarray1(M_manual_ledarray1),
    .result(M_manual_result),
    .io_led(M_manual_io_led),
    .io_seg(M_manual_io_seg),
    .io_sel(M_manual_io_sel)
  );
  wire [16-1:0] M_auto_result;
  wire [8-1:0] M_auto_ledarray1;
  reg [5-1:0] M_auto_io_button;
  reg [24-1:0] M_auto_io_dip;
  auto_4 auto (
    .clk(clk),
    .rst(rst),
    .io_button(M_auto_io_button),
    .io_dip(M_auto_io_dip),
    .result(M_auto_result),
    .ledarray1(M_auto_ledarray1)
  );
  localparam INIT_testmode = 2'd0;
  localparam MANUALMODE_testmode = 2'd1;
  localparam AUTOMODE_testmode = 2'd2;
  
  reg [1:0] M_testmode_d, M_testmode_q = INIT_testmode;
  
  always @* begin
    M_testmode_d = M_testmode_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_manual_io_dip = io_dip;
    M_manual_io_button = io_button;
    M_auto_io_button = io_button;
    M_auto_io_dip = io_dip;
    usb_tx = usb_rx;
    
    case (M_testmode_q)
      INIT_testmode: begin
        led = {4'h8{M_myBlinker_blink}};
        if (io_button[1+0-:1] == 1'h1) begin
          M_testmode_d = MANUALMODE_testmode;
        end
        if (io_button[4+0-:1] == 1'h1) begin
          M_testmode_d = AUTOMODE_testmode;
        end
      end
      MANUALMODE_testmode: begin
        io_led[0+7-:8] = M_manual_ledarray1;
        io_led[8+7-:8] = M_manual_result[0+7-:8];
        io_led[16+7-:8] = M_manual_result[8+7-:8];
        if (io_button[1+0-:1] == 1'h1) begin
          M_testmode_d = INIT_testmode;
        end
      end
      AUTOMODE_testmode: begin
        io_led[0+7-:8] = M_auto_ledarray1;
        io_led[8+7-:8] = M_auto_result[0+7-:8];
        io_led[16+7-:8] = M_auto_result[8+7-:8];
        if (io_button[4+0-:1] == 1'h1) begin
          M_testmode_d = INIT_testmode;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_testmode_q <= M_testmode_d;
  end
  
endmodule
