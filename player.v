module player (clk,rst,up,down,left,right,up_right,up_left,down_right,down_left,update,xCount,yCount,playa);
input clk,rst,up,down,left,right,up_right,up_left,down_right,down_left,update;
input [9:0]xCount;
input [9:0]yCount;
output playa;

reg playa;
wire rst;
	
reg [9:0] playaX[0:25];
reg [8:0] playaY[0:25];

wire [9:0] xCount;
wire [9:0] yCount;


////controls the size of user////
always@(posedge clk) 
	begin	
		playa = (xCount > playaX[0] && xCount < (playaX[0]+10'd15)) && (yCount > playaY[0] && yCount < (playaY[0]+10'd15));
	end
//	
////
	
////generates the direction of the playa from the controlling inputs////
//**diagonal motions could be added by adding more states and combining inputs**

reg [3:0]S; 
reg [3:0]NS;

localparam move_up 	   = 4'd0000, 
			  move_down    = 4'd0001, 
			  move_left    = 4'd0011, 
			  move_right   = 4'd0100, 
			  dont_move 	= 4'd0101,
			  upright 		= 4'd0111,
			  upleft  		= 4'd1000,
			  downright 	= 4'd1001,
			  downleft 		= 4'd1010;

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
//		upright:
//			begin
//				if(up == 1'b0 || right == 1'b0)
//					NS = upright;
//				else
//					NS = dont_move;
			//end
			
			
			
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
//			upright:
//				playaX[0] <= (playaX[0] + 10'd4) || playaY[0] <= (playaY[0] - 9'd4);
//			upleft:
//				playaX[0] <= (playaX[0] - 10'd4 + playaY[0] + 10'd4);
//			downright:
//				playaX[0] <= (playaX[0] - 10'd4 + playaY[0] + 10'd4);
//			downleft:
//				playaX
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