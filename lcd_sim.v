`timescale 1ns / 1ps

module lcd_display_tb;

reg clk;
reg rst;
wire [7:0] lcd_data;
wire lcd_rs;
wire lcd_en;
wire lcd_rw;


   Display a( .clk(clk),
    .rst(rst),
    .lcd_data(lcd_data),
    .lcd_rs(lcd_rs),
    .lcd_en(lcd_en),
    .lcd_rw(lcd_rw)
);

//////////////////////
// Clock Generation
//////////////////////
initial begin
    clk = 0;
    forever #10 clk = ~clk;   // 50 MHz clock (20ns period)
end

//////////////////////
// Stimulus
//////////////////////
initial begin
    rst = 1;
    #100;
    rst = 0;

    // Run simulation long enough
    #10_000;   
    $stop;
end

endmodule