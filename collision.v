module collision(clk,rst,player,walls,border,safe_,xCount,yCount,win,game_over); 

input clk, rst, player, border, safe_;
input [114:0]walls;
input [9:0]xCount;
input [9:0]yCount;
output win, game_over; 
	
wire player;
wire safe_;
wire border;
wire [114:0]walls;

wire [9:0] xCount;
wire [9:0] yCount;

reg game_over; 
reg win; 
	
//collision calculator
wire thump; 
wire solved; 
wire bounce;

assign solved = player && safe_;
assign thump = (player && border) || (player && (walls[0] || walls[1] || walls[2] || walls[3] || walls[4] || walls[5] || walls[6] || walls[7] || walls[8] || walls[9] || walls[10] || walls [11] || walls[12] || walls[13] || walls[14] || walls[15] || walls[16] || walls[17] || walls[18] ||  walls[19] ||  walls[20] ||  walls[21] ||  walls[22] ||  walls[23] ||  walls[24] ||  walls[25] ||  walls[26]));
localparam alive = 2'd0, winner = 2'd1, loser = 2'd2;
reg [2:0]S;
reg [2:0]NS;
 
always @(posedge clk)
	begin
		if (rst == 1'b1)
			S <= alive;
		else
			S <= NS;
	end

always @(*) 
	case (S)
		alive: 
			begin
				if (solved == 1'b1)
					NS = winner;
				else if (thump == 1'b1)
					NS = loser;
				else
					NS = alive;
			end
		winner:							//the winner and loser states loop into themselves until the reset is triggered (fixes "win after loss" and "loss after win" bugs)
			NS = winner;
		loser:
			NS = loser;
	endcase

always @(posedge clk) 
	begin
		if (rst == 1'b1)
			begin
				win <= 1'b0;
				game_over <= 1'b0;
			end
		else
			begin
				case (S)
					alive:
						begin
							win <= 1'b0;
							game_over <= 1'b0;
						end
					winner:
						win <= 1'b1;
					loser:
						game_over <= 1'b1;
				endcase
			end
		
	end
endmodule
