`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:15 12/31/2023 
// Design Name: 
// Module Name:    Thang_May 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Thang_May #(parameter N = 8) (
    input wire clk, rst,
    input wire sel, mode,
    input wire [N-1:0] min, max, 

    output reg [N-1:0] q
);

    // signal declaration
    reg [N-1:0] r_reg;
    wire [N-1:0] r_next;

    // body, register
    always @(posedge clk or posedge rst) begin
        if (!rst)
            r_reg <= 0; // Reset ve tang cuoi cung
        else
            r_reg <= r_next;
    end

    // next state logic
    assign r_next = (sel == 0) ? r_reg : // Khong thay doi neu  sel = 0
                    (mode == 0 && r_reg > min) ? r_reg - 1 : // Move down neu khong o tang cuoi cung
                    (mode == 1 && r_reg < max) ? r_reg + 1 : // Move up neu khong o tang cao nhat
                    r_reg; // giu nguyen tang hien tai

    // Output assignment
    always @(r_reg) begin
        q <= r_reg;
    end
endmodule
