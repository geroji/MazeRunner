module player (clk,rst,up,down,left,right,update,xCount,yCount,playa);
input clk,rst,up,down,left,right,update;
input [9:0]xCount;
input [9:0]yCount;
output playa;

reg playa;
wire rst;
	
reg [9:0] playaX[0:31];
reg [8:0] playaY[0:31];

wire [9:0] xCount;
wire [9:0] yCount;


////controls the size of the playa////
always@(posedge clk) 
	begin	
		playa = (xCount > playaX[0] && xCount < (playaX[0]+10'd15)) && (yCount > playaY[0] && yCount < (playaY[0]+10'd15));
	end
//	
////
	
////generates the direction of the playa from the controlling inputs////
//**diagonal motions could be added by adding more states and combining inputs**

reg [2:0]S; 
reg [2:0]NS;

localparam move_up = 3'd0, move_down = 3'd1, move_left = 3'd2, move_right = 3'd3, dont_move = 3'd4;

always @(posedge update) 
	begin
		if (rst == 1'b1)
			S <= dont_move;
		else
			S <= NS;
	end
//

always @(*) 
	case (S)
		move_up:
			begin
				if(up == 1'b0)
					NS = move_up;
				else
					NS = dont_move;
			end
			
		move_down:
			begin
				if(down == 1'b0)
					NS = move_down;
				else
					NS = dont_move;
			end
		move_left:
			begin
				if(left == 1'b0)
					NS = move_left;
				else
					NS = dont_move;
			end
		move_right:
			begin
				if(right == 1'b0)
					NS = move_right;
				else
					NS = dont_move;
			end
		dont_move: 
			begin
				if(up == 1'b0)
					NS = move_up;
				else if (down == 1'b0)
					NS = move_down;
				else if (left == 1'b0)
					NS = move_left;
				else if (right == 1'b0)
					NS = move_right;
				else
					NS = dont_move;
			end
	endcase
//

always @(posedge update) 
	begin
	if (rst == 1'b1)
		begin //initial playa position
			playaX[0] <= 10'd30;
			playaY[0] <= 9'd449;
		end
	else
		case(S)
			move_up:
				playaY[0] <= (playaY[0] - 9'd4);
			move_down:
				playaY[0] <= (playaY[0] + 9'd4);
			move_left:
				playaX[0] <= (playaX[0] - 10'd4);
			move_right:
				playaX[0] <= (playaX[0] + 10'd4);
			dont_move:
				begin
					playaX[0] <= playaX[0];
					playaY[0] <= playaY[0];
				end
		endcase
	end
//
////

endmodule 