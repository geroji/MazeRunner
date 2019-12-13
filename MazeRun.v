module MazeRun(board_clk, rst, VGA_R, VGA_G, VGA_B, hsync, vsync, clk, blank_n, up, down, left, right, levelselect);

input board_clk, rst; 
input up,down,left,right;  //direction inputs from push buttons 
input levelselect; //switch that determines the current level
output hsync, vsync, clk, blank_n; //non-color outputs to VGA (including the vga clock "clk", which is the main clock used in this project)

////clocks////
clock_converter clocks(board_clk,update,clk); //converts the board clock to VGA clock and frame update clock
wire clk; 
wire update; 
////

////player (player) generator////
player	playergy (clk,rst,up,down,left,right,update,xCount,yCount,player);
wire player;
////

////wall (obstacle) generator////
lvl1wall_generator w1(clk,update,rst,xCount,yCount,walls1);
lvl2wall_generator w2(clk,update,rst,xCount,yCount,walls2);
wire [114:0]walls1;
wire [114:0]walls2;
////

////level selection////
reg [114:0]walls;

always @(posedge clk)
	begin
		if (levelselect == 1'b0)
			walls <= walls1;
		else
			walls <= walls2;
	end
//
////
	
	
	////"end zone" that triggers a win - generator////
reg end_zone;

always @(posedge clk)
	begin
	if(levelselect == 1'b0)
		end_zone <= ((yCount >= 15) && (yCount <= 46) && (xCount >= 10) && (xCount <= 100));
	else
		end_zone <= ((yCount >= 215) && (yCount <= 250) && (xCount >= 335) && (xCount <= 360));
	end
	
	
////collision (win/lose condition) calculator////
collision WL(clk,rst,player,walls,border,end_zone,xCount,yCount,win,game_over);
wire game_over;
wire win;
////

////
	
////game area border generator////
reg  border;

always @(posedge clk) 
	begin
		border <= (((xCount >= 0) && (xCount < 15) || (xCount >= 630) && (xCount < 641)) || ((yCount >= 0) && (yCount < 15) || (yCount >= 465) && (yCount < 481)));
	end
//
////

////road line "grid" generator////
reg yellow_roadlines;  //between walls lanes going opposite ways (solid yellow)
reg white_roadlines; //between walls lanes going the same way (dashed white)

always @(posedge clk)
	begin
		yellow_roadlines <= 1'b0;                                                                                                                                                                                                                                                                                         
		white_roadlines <= 1'b0;
	end
//
////

////text/word generator////
wire game_over_text;
wire win_text;
wire level_text;
wire level_num1_text;
wire level_num2_text;
wire safezone_L4;
wire safezone_L8;
wire safezone_L13;

text words(clk,rst,xCount,yCount,game_over_text,win_text,level_text,level_num1_text,level_num2_text);
////

////display control////
wire [9:0] xCount; 
wire [9:0] yCount;
wire ScreenArea;

VGA_Controller VGA(clk, xCount, yCount, ScreenArea, hsync, vsync, blank_n);

output reg [7:0]VGA_R, VGA_G, VGA_B;

reg R;
reg G;
reg B;

always @(posedge clk)
	begin
		if (game_over == 1'b0)
			begin
				if (win == 1'b0)
					begin;
						if (levelselect == 1'b0)
							begin
								R = (( (border && !level_text && !level_num1_text) || (!player && safezone_L4) || player|| (!player && safezone_L8) || (!player && safezone_L13) || (yellow_roadlines && !player) || (white_roadlines && !player) || walls[0] || walls [1] || walls[2] || walls[3] || walls[4] || walls[5] || walls[6] || walls[7] || walls [8] || walls[9] || walls[10] || walls[11] || walls[12] || walls[13] || walls[14] || walls[15] || walls[16]|| walls [17]|| walls [18]|| walls [19]|| walls [20]|| walls [21]|| walls [22]|| walls [23] || walls [24] || walls [25] || walls[26]));
								G = ((border && !level_text && !level_num1_text)  || end_zone || safezone_L4 || safezone_L8 || safezone_L13 || yellow_roadlines || white_roadlines);
								B = (!player &&((border && !level_text && !level_num1_text) || end_zone || safezone_L4 || safezone_L8 || safezone_L13 || (white_roadlines && !player) || walls[0] || walls [1] || walls[2] || walls[3] || walls[4] || walls[5] || walls[6] || walls[7] || walls [8] || walls[9] || walls[10] || walls[11] || walls[12] || walls[13] || walls[14] || walls[15] || walls[16]|| walls [17]|| walls [18]|| walls [19]|| walls [20]|| walls[21]|| walls [22]|| walls [23] || walls [24] || walls [25] || walls [26]));
							end
						else
							begin
								R = (( (border && !level_text && !level_num1_text) || (!player && safezone_L4) || (!player && safezone_L8) || (!player && safezone_L13) || (yellow_roadlines && !player) || (white_roadlines && !player) || walls[0] || walls [1] || walls[2] || walls[3] || walls[4] || walls[5] || walls[6] || walls[7] || walls [8] || walls[9] || walls[10] || walls[11] || walls[12] || walls[13] || walls[14]|| walls[15]|| walls[16]|| walls[17]));
								G = ((border && !level_text && !level_num1_text) || player || end_zone || safezone_L4 || safezone_L8 || safezone_L13 || yellow_roadlines || white_roadlines || walls[0] || walls [1] || walls[2] || walls[3] || walls[4] || walls[5] || walls[6] || walls[7] || walls [8] || walls[9] || walls[10] || walls[11] || walls[12] || walls[13] || walls[14] || walls[15]|| walls[16]|| walls[17]);
								B = (!player &&((border && !level_text && !level_num1_text) || end_zone || safezone_L4 || safezone_L8 || safezone_L13 || (white_roadlines && !player) || walls[0] || walls [1] || walls[2] || walls[3] || walls[4] || walls[5] || walls[6] || walls[7] || walls [8] || walls[9] || walls[10] || walls[11] || walls[12] || walls[13] || walls[14]|| walls[15]|| walls[16]|| walls[17]));
							end
					end
				else
					begin
						R = 1'b0;
						G = ScreenArea & !win_text;
						B = 1'b0;
					end
			end
		else
			begin
				R = ScreenArea & !game_over_text;
				G = 1'b0;
				B = 1'b0;
			end
	end
//

always@(posedge clk)
	begin
		VGA_R = {8{R}};
		VGA_G = {8{G}};
		VGA_B = {8{B}};
	end 
//
////

endmodule
