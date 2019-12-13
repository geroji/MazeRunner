module text(clk,rst,xCount,yCount,game_over_text,win_text,level_text,level_num1_text,level_num2_text);
input clk,rst;
input [9:0]xCount;
input [9:0] yCount;
wire [9:0] xCount;
wire [9:0] yCount;

output game_over_text;
output win_text;
output level_text;
output level_num1_text;
output level_num2_text;


////game over text////
wire game_over_text;
assign game_over_text = (go1 || go2 || go3 || go4 || go5 || go6 || go7 || go8 || go9 || go10);
reg [9:0] game_overX[0:31];
reg [8:0] game_overY[0:31];

//the words "GAME OVER" are displayed with "GAME" above "OVER" and are written with 5 blocks of 10 horizontal pixels (letters are 50 pixels tall) with a 10 pixel gap between the words

//"GAME"
reg go1, go2, go3, go4, go5;

//10 pixel gap

//"OVER"
reg go6, go7, go8, go9, go10;

always@(posedge clk) 
	begin	
			if (rst == 1'b1)
				begin
					game_overX[0] = 10'd200;
					game_overY[0] = 9'd200;
					
				end
			else
				begin
					//"GAME"
					go1 =  ((yCount >= (game_overY[0] + 9'd0))  &&(yCount < (game_overY[0] + 9'd10)))  &&  ( ( (xCount >= (game_overX[0] + 10'd10)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd90)) && (xCount < (game_overX[0] + 10'd100)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd150)) ) || ( (xCount >= (game_overX[0] + 10'd180)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd260)) )  );
					go2 = ((yCount >= (game_overY[0] + 9'd10)) && (yCount < (game_overY[0] + 9'd20)))  &&  ( ( (xCount >= (game_overX[0] + 10'd0)) && (xCount < (game_overX[0] + 10'd10)) ) || ( (xCount >= (game_overX[0] + 10'd80)) && (xCount < (game_overX[0] + 10'd90)) ) || ( (xCount >= (game_overX[0] + 10'd100)) && (xCount < (game_overX[0] + 10'd110)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd160)) ) || ( (xCount >= (game_overX[0] + 10'd170)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd220)) ) );
					go3 = ((yCount >= (game_overY[0] + 9'd20)) && (yCount < (game_overY[0] + 9'd30)))  &&  ( ( (xCount >= (game_overX[0] + 10'd0)) && (xCount < (game_overX[0] + 10'd10)) ) || ( (xCount >= (game_overX[0] + 10'd30)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd70)) && (xCount < (game_overX[0] + 10'd80)) ) || ( (xCount >= (game_overX[0] + 10'd110)) && (xCount < (game_overX[0] + 10'd120)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd150)) ) || ( (xCount >= (game_overX[0] + 10'd160)) && (xCount < (game_overX[0] + 10'd170)) ) || ( (xCount >= (game_overX[0] + 10'd180)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd240)) ) );
					go4 = ((yCount >= (game_overY[0] + 9'd30)) && (yCount < (game_overY[0] + 9'd40)))  &&  ( ( (xCount >= (game_overX[0] + 10'd0)) && (xCount < (game_overX[0] + 10'd10)) ) || ( (xCount >= (game_overX[0] + 10'd40)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd70)) && (xCount < (game_overX[0] + 10'd120)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd150)) ) || ( (xCount >= (game_overX[0] + 10'd180)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd220)) ) );
					go5 = ((yCount >= (game_overY[0] + 9'd40)) && (yCount < (game_overY[0] + 9'd50)))  &&  ( ( (xCount >= (game_overX[0] + 10'd10)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd70)) && (xCount < (game_overX[0] + 10'd80)) ) || ( (xCount >= (game_overX[0] + 10'd110)) && (xCount < (game_overX[0] + 10'd120)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd150)) ) || ( (xCount >= (game_overX[0] + 10'd180)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd260)) ) );
					//gap
					//"OVER"
					go6 =  ((yCount >= (game_overY[0] + 9'd60))  && (yCount < (game_overY[0] + 9'd70)))  &&  ( ( (xCount >= (game_overX[0] + 10'd10)) && (xCount < (game_overX[0] + 10'd40)) ) || ( (xCount >= (game_overX[0] + 10'd70)) && (xCount < (game_overX[0] + 10'd80)) ) || ( (xCount >= (game_overX[0] + 10'd110)) && (xCount < (game_overX[0] + 10'd120)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd250)) ) );
					go7 =  ((yCount >= (game_overY[0] + 9'd70))  && (yCount < (game_overY[0] + 9'd80)))  &&  ( ( (xCount >= (game_overX[0] + 10'd0)) && (xCount < (game_overX[0] + 10'd10)) ) || ( (xCount >= (game_overX[0] + 10'd40)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd70)) && (xCount < (game_overX[0] + 10'd80)) ) || ( (xCount >= (game_overX[0] + 10'd110)) && (xCount < (game_overX[0] + 10'd120)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd150)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd220)) ) || ( (xCount >= (game_overX[0] + 10'd250)) && (xCount < (game_overX[0] + 10'd260)) ) );
					go8 =  ((yCount >= (game_overY[0] + 9'd80))  && (yCount < (game_overY[0] + 9'd90)))  &&  ( ( (xCount >= (game_overX[0] + 10'd0)) && (xCount < (game_overX[0] + 10'd10)) ) || ( (xCount >= (game_overX[0] + 10'd40)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd70)) && (xCount < (game_overX[0] + 10'd80)) ) || ( (xCount >= (game_overX[0] + 10'd110)) && (xCount < (game_overX[0] + 10'd120)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd170)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd250)) ) );
					go9 =  ((yCount >= (game_overY[0] + 9'd90))  && (yCount < (game_overY[0] + 9'd100))) &&  ( ( (xCount >= (game_overX[0] + 10'd0)) && (xCount < (game_overX[0] + 10'd10)) ) || ( (xCount >= (game_overX[0] + 10'd40)) && (xCount < (game_overX[0] + 10'd50)) ) || ( (xCount >= (game_overX[0] + 10'd80)) && (xCount < (game_overX[0] + 10'd90)) ) || ( (xCount >= (game_overX[0] + 10'd100)) && (xCount < (game_overX[0] + 10'd110)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd150)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd220)) ) || ( (xCount >= (game_overX[0] + 10'd250)) && (xCount < (game_overX[0] + 10'd260)) ) );
					go10 = ((yCount >= (game_overY[0] + 9'd100)) && (yCount < (game_overY[0] + 9'd110))) &&  ( ( (xCount >= (game_overX[0] + 10'd10)) && (xCount < (game_overX[0] + 10'd40)) ) || ( (xCount >= (game_overX[0] + 10'd90)) && (xCount < (game_overX[0] + 10'd100)) ) || ( (xCount >= (game_overX[0] + 10'd140)) && (xCount < (game_overX[0] + 10'd190)) ) || ( (xCount >= (game_overX[0] + 10'd210)) && (xCount < (game_overX[0] + 10'd220)) ) || ( (xCount >= (game_overX[0] + 10'd250)) && (xCount < (game_overX[0] + 10'd260)) ) );
				end 
	end
//
////

////win text////
wire win_text;
assign win_text = (win1 || win2 || win3 || win4 || win5);
reg [9:0] wt_X[0:31];
reg [8:0] wt_Y[0:31];

// the text "WIN!" is written in the same style as the game over text
reg win1, win2, win3, win4, win5;

always @(posedge clk)
	begin
		if (rst == 1'b1)
			begin
				wt_X[0] = 10'd230;
				wt_Y[0] = 9'd230;
			end
		else
			begin
			//"WIN!"
			win1 = ((yCount >= (wt_Y[0] + 9'd0))  && (yCount < (wt_Y[0] + 9'd10)))  && ( ( (xCount >= (wt_X[0] + 10'd0)) && (xCount < (wt_X[0] + 10'd10)) ) || ( (xCount >= (wt_X[0] + 10'd40)) && (xCount < (wt_X[0] + 10'd50)) ) || ( (xCount >= (wt_X[0] + 10'd70)) && (xCount < (wt_X[0] + 10'd120)) ) || ( (xCount >= (wt_X[0] + 10'd140)) && (xCount < (wt_X[0] + 10'd150)) ) || ((xCount >= (wt_X[0] + 10'd180)) && (xCount < (wt_X[0] + 10'd190)) ) || ( (xCount >= (wt_X[0] + 10'd200)) && (xCount < (wt_X[0] + 10'd210)) ) );
			win2 = ((yCount >= (wt_Y[0] + 9'd10)) && (yCount < (wt_Y[0] + 9'd20)))  && ( ( (xCount >= (wt_X[0] + 10'd0)) && (xCount < (wt_X[0] + 10'd10)) ) || ( (xCount >= (wt_X[0] + 10'd40)) && (xCount < (wt_X[0] + 10'd50)) ) || ( (xCount >= (wt_X[0] + 10'd90)) && (xCount < (wt_X[0] + 10'd100)) ) || ( (xCount >= (wt_X[0] + 10'd140)) && (xCount < (wt_X[0] + 10'd160)) ) || ((xCount >= (wt_X[0] + 10'd180)) && (xCount < (wt_X[0] + 10'd190)) ) || ( (xCount >= (wt_X[0] + 10'd200)) && (xCount < (wt_X[0] + 10'd210)) ) );
			win3 = ((yCount >= (wt_Y[0] + 9'd20)) && (yCount < (wt_Y[0] + 9'd30)))  && ( ( (xCount >= (wt_X[0] + 10'd0)) && (xCount < (wt_X[0] + 10'd10)) ) || ( (xCount >= (wt_X[0] + 10'd20)) && (xCount < (wt_X[0] + 10'd30)) ) || ( (xCount >= (wt_X[0] + 10'd40)) && (xCount < (wt_X[0] + 10'd50)) ) || ( (xCount >= (wt_X[0] + 10'd90)) && (xCount < (wt_X[0] + 10'd100)) ) || ( (xCount >= (wt_X[0] + 10'd140)) && (xCount < (wt_X[0] + 10'd150)) ) || ((xCount >= (wt_X[0] + 10'd160)) && (xCount < (wt_X[0] + 10'd170)) ) || ( (xCount >= (wt_X[0] + 10'd180)) && (xCount < (wt_X[0] + 10'd190)) ) || ( (xCount >= (wt_X[0] + 10'd200)) && (xCount < (wt_X[0] + 10'd210)) ) );
			win4 = ((yCount >= (wt_Y[0] + 9'd30)) && (yCount < (wt_Y[0] + 9'd40)))  && ( ( (xCount >= (wt_X[0] + 10'd0)) && (xCount < (wt_X[0] + 10'd20)) ) || ( (xCount >= (wt_X[0] + 10'd30)) && (xCount < (wt_X[0] + 10'd50)) ) || ( (xCount >= (wt_X[0] + 10'd90)) && (xCount < (wt_X[0] + 10'd100)) ) || ( (xCount >= (wt_X[0] + 10'd140)) && (xCount < (wt_X[0] + 10'd150)) ) || ((xCount >= (wt_X[0] + 10'd170)) && (xCount < (wt_X[0] + 10'd190)) ) );
			win5 = ((yCount >= (wt_Y[0] + 9'd40)) && (yCount < (wt_Y[0] + 9'd50)))  && ( ( (xCount >= (wt_X[0] + 10'd0)) && (xCount < (wt_X[0] + 10'd10)) ) || ( (xCount >= (wt_X[0] + 10'd40)) && (xCount < (wt_X[0] + 10'd50)) ) || ( (xCount >= (wt_X[0] + 10'd70)) && (xCount < (wt_X[0] + 10'd120)) ) || ( (xCount >= (wt_X[0] + 10'd140)) && (xCount < (wt_X[0] + 10'd150)) ) || ((xCount >= (wt_X[0] + 10'd180)) && (xCount < (wt_X[0] + 10'd190)) ) || ( (xCount >= (wt_X[0] + 10'd200)) && (xCount < (wt_X[0] + 10'd210)) ) );
			end
	end
//
////

////level and level number text////
//the text "LEVEL 1" and "LEVEL 2" is written in the same font as the win and game over text, but is scaled down from blocks that are 10 pixels each to blocks that are 2 pixels each
wire level_text;
wire level_num1_text;
wire level_num2_text;
reg [9:0] level_X[0:31];
reg [8:0] level_Y[0:31];

assign level_text = (lvl1 || lvl2 || lvl3 || lvl4 || lvl5);
assign level_num1_text = (lvone1 || lvone2 || lvone3 || lvone4 || lvone5);
assign level_num2_text = (lvtwo1 || lvtwo2 || lvtwo3 || lvtwo4 || lvtwo5);

reg lvl1, lvl2, lvl3, lvl4, lvl5;
reg lvone1, lvone2, lvone3, lvone4, lvone5;
reg lvtwo1, lvtwo2, lvtwo3, lvtwo4, lvtwo5;


endmodule
