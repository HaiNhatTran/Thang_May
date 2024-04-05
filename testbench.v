`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:10:14 12/31/2023
// Design Name:   Thang_May
// Module Name:   E:/BT_Verilog/Thang_May/testbench.v
// Project Name:  Thang_May
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Thang_May
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk;
	reg rst;
	reg sel;
	reg mode;
	reg [7:0] min;
	reg [7:0] max;

	// Outputs
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	Thang_May uut (
		.clk(clk), 
		.rst(rst), 
		.sel(sel), 
		.mode(mode), 
		.min(min), 
		.max(max), 
		.q(q)
	);

 // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    initial begin
        // Initialize Inputs
        rst = 1;
        sel = 0;
        mode = 0;
        min = 0;
        max = 7; // Gia su co 8 tang

        // Reset he thong
        #100;
        rst = 0;
        #20;
        rst = 1;
        #20;

        // Kiem tra thang may o che do moving up
        sel = 1;
        mode = 1; // Move up
        #200;
        
        // Kiem tra thang may o che do moving down
        mode = 0; // Move down
        #200;

        // Kiem tra co dat tang cao nhat khong
        mode = 1; // Move up
        #200;

        // kiem tra co dat tang thap nhat khong
        mode = 0; // Move down
        #200;

        $finish;
    end
      
endmodule

