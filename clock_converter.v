module clock_converter(board_clk,update,clk);
input board_clk;
output reg update,clk;
reg [21:0]count;	
reg a;
	
//the update clock is for controlling how fast the frog and car positions update
always@(posedge board_clk)
	begin
		count <= count + 22'd1;
		if(count == 22'd1250000)
		begin
			update <= ~update;
			count <= 22'd0;
		end	
	end
//

//converts the board clock (50MHz) to  the VGA clock (25MHz)
always@(posedge board_clk)
	begin
		a <= ~a; 
		clk <= a;
	end
//	
endmodule 