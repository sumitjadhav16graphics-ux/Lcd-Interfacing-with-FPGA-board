`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2026 08:55:39
// Design Name: 
// Module Name: Display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Display(
    input clk,rst,
    output reg lcd_rs,
    output reg lcd_rw,
    output reg lcd_en,
    output reg [7:0] lcd_data
    );
    
   reg [4:0] count;
   reg [7:0] state;
   reg flag;
   initial begin
   count <= 1'd0;
   state <= 1'd0;
   end
 always @ (posedge clk) begin
if (rst) begin
     count <= 5'd0;
     flag  <= 1'b0;
 end
 else if (count == 5'd16) begin
     count <= 8'd0;
     flag  <= 1'b1;  
 end
 else begin
     count <= count + 1'b1;
     flag  <= 1'b0;
 end
     
           end 
       always @(posedge clk) begin
       if (rst ) begin
            state <= 0; end
       else if (flag) begin
         state <= state +1;
         end
       case (state) 
       0: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h38;
            end
       1: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                  end 
         2: begin 
           lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h0c;
           end
        3: begin 
           lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                 end  
          4: begin 
              lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h06;
              end
         5: begin 
              lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                    end  
         6: begin 
             lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h01;
             end
        7: begin 
             lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;
                   end 
         8: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd1; lcd_rw <= 1'd0; lcd_data<= 8'h80;
            end
        9: begin 
            lcd_rs <= 1'd0; lcd_en <= 1'd0; lcd_rw <= 1'd0;end
           /* 10: begin  lcd_rs <= 1'd1;lcd_data <= 8'h48; lcd_en <= 1'd1; end
                11:begin lcd_rs <= 1'd1; lcd_en <= 1'd0; end
              12: begin lcd_rs <= 1'd1;lcd_data <= 8'h45; lcd_en <= 1'd1; end
                13:  begin lcd_rs <= 1'd1; lcd_en <= 1'd0; end 
             14: begin lcd_rs <= 1'd1; lcd_data <= 8'h4c; lcd_en <= 1'd1; end
              15:  begin lcd_rs <= 1'd1; lcd_en <= 1'd0; end 
               16: begin lcd_rs <= 1'd1; lcd_data <= 8'h4c; lcd_en <= 1'd1; end
                17:  begin lcd_rs <= 1'd1;lcd_en <= 1'd0; end      
             18: begin lcd_rs <= 1'd1; lcd_data <= 8'h4f; lcd_en <= 1'd1; end
                19:  begin lcd_rs <= 1'd1;lcd_en <= 1'd0; end */    
            
               10: begin lcd (1'b1 ,8'h48);end
               11:lcd (1'b1 ,8'h45);
               12:lcd (1'b1 ,8'h4c);
               13:lcd (1'b1 ,8'h4c);
               14:lcd (1'b1 ,8'h4f);                                      
            endcase
            end 
    
    
       task lcd;
                input rs;
                input [7:0] data;
            begin
                lcd_rs   <= rs;
                lcd_data <= data;
                if(clk) begin 
                 rs <= 1'd1;lcd_data <= data; lcd_en <= 1'd1;
                end else
                    lcd_rs <= 1'd1; lcd_en <= 1'd0;
                                
            end
            
            endtask 
           
              
     

   
     
endmodule
