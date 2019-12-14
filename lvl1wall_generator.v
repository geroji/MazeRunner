module lvl1wall_generator (clk,update,rst,xCount,yCount,wall);
input clk,rst,update;
input [9:0]xCount;
input [9:0]yCount;
wire [9:0] xCount;
wire [9:0] yCount;

output [25:0]wall; //some wall elements are set to 1'b0 in level 1 so that the walls that are only included in level 2 are removed from the register that controls wall in the top function
assign wall[0] = wall1;
assign wall[1] = wall2; 
assign wall[2] = wall3;
assign wall[3] = wall4;
assign wall[4] = wall5;
assign wall[5] = wall6;
assign wall[6] = wall7;
assign wall[7] = wall8;
assign wall[8] = wall9;
assign wall[9] = wall10;
assign wall[10] = wall11;
assign wall[11] = wall12;
assign wall[12] = wall13;
assign wall[13] = wall14;
assign wall[14] = wall15;
assign wall[15] = wall16;
assign wall[16] = wall17;
assign wall[17] = wall18;
assign wall[18] = wall19;
assign wall[19] = wall20;
assign wall[20] = wall21;
assign wall[21] = wall22;
assign wall[22] = wall23;
assign wall[23] = wall24;
assign wall[24] = wall25;
assign wall[25] = wall26;


reg wall1;
reg wall2;
reg wall3;
reg wall4;
reg wall5;
reg wall6;
reg wall7;
reg wall8;
reg wall9;
reg wall10;
reg wall11;
reg wall12;
reg wall13;
reg wall14;
reg wall15;
reg wall16;
reg wall17;
reg wall18;
reg wall19;
reg wall20;
reg wall21;
reg wall22;
reg wall23;
reg wall24;
reg wall25;
reg wall26;

reg [9:0] wall1X [0:25];
reg [8:0] wall1Y [0:25];

reg [9:0] wall2X [0:25];
reg [8:0] wall2Y [0:25];

reg [9:0] wall3X [0:25];
reg [8:0] wall3Y [0:25];

reg [9:0] wall4X [0:25];
reg [8:0] wall4Y [0:25];

reg [9:0] wall5X [0:25];
reg [8:0] wall5Y [0:25];

reg [9:0] wall6X [0:25];
reg [8:0] wall6Y [0:25];

reg [9:0] wall7X [0:25];
reg [8:0] wall7Y [0:25];

reg [9:0] wall8X [0:25];
reg [8:0] wall8Y [0:25];

reg [9:0] wall9X [0:25];
reg [8:0] wall9Y [0:25];

reg [9:0] wall10X [0:25];
reg [8:0] wall10Y [0:25];

reg [9:0] wall11X [0:25];
reg [8:0] wall11Y [0:25];

reg [9:0] wall12X [0:25];
reg [8:0] wall12Y [0:25];

reg [9:0] wall13X [0:25];
reg [8:0] wall13Y [0:25];

reg [9:0] wall14X [0:25];
reg [8:0] wall14Y [0:25];

reg [9:0] wall15X [0:25];
reg [8:0] wall15Y [0:25];

reg [9:0] wall16X [0:25];
reg [8:0] wall16Y [0:25];

reg [9:0] wall17X [0:25];
reg [8:0] wall17Y [0:25];

reg [9:0] wall18X [0:25];
reg [8:0] wall18Y [0:25];

reg [9:0] wall19X [0:25];
reg [8:0] wall19Y [0:25];

reg [9:0] wall20X [0:25];
reg [8:0] wall20Y [0:25];

reg [9:0] wall21X [0:25];
reg [8:0] wall21Y [0:25];

reg [9:0] wall22X [0:25];
reg [8:0] wall22Y [0:25];

reg [9:0] wall23X [0:25];
reg [8:0] wall23Y [0:25];

reg [9:0] wall24X [0:25];
reg [8:0] wall24Y [0:25];

reg [9:0] wall25X [0:25];
reg [8:0] wall25Y [0:25];

reg [9:0] wall26X [0:25];
reg [8:0] wall26Y [0:25];

//controls the size of the "walls"
always@(posedge clk) 
	begin	
		//wall 1 
		wall1 <= (xCount > wall1X[0] && xCount < (wall1X[0]+10'd600)) && (yCount > wall1Y[0] && yCount < (wall1Y[0]+10'd20));

		//wall 2 
		wall2 <= (xCount > wall2X[0] && xCount < (wall2X[0]+10'd300)) && (yCount > wall2Y[0] && yCount < (wall2Y[0]+10'd20));

		//wall 3 
		wall3 <= (xCount > wall3X[0] && xCount < (wall3X[0]+10'd100)) && (yCount > wall3Y[0] && yCount < (wall3Y[0]+10'd20));

		//wall 4
		wall4 <= (xCount > wall4X[0] && xCount < (wall4X[0]+10'd20)) && (yCount > wall4Y[0] && yCount < (wall4Y[0]+10'd120));
			
		//wall 5
		wall5 <= (xCount > wall5X[0] && xCount < (wall5X[0]+10'd20)) && (yCount > wall5Y[0] && yCount < (wall5Y[0]+10'd260));
		
		//wall 6
		wall6 <= (xCount > wall6X[0] && xCount < (wall6X[0]+10'd150)) && (yCount > wall6Y[0] && yCount < (wall6Y[0]+10'd20));
		
		//wall 7
		wall7 <= (xCount > wall7X[0] && xCount < (wall7X[0]+10'd20)) && (yCount > wall7Y[0] && yCount < (wall7Y[0]+10'd120));
		
		//wall 8 
		wall8 <= (xCount > wall8X[0] && xCount < (wall8X[0]+10'd400)) && (yCount > wall8Y[0] && yCount < (wall8Y[0]+10'd20));
		
		//wall 9
		wall9 <= (xCount > wall9X[0] && xCount < (wall9X[0]+10'd20)) && (yCount > wall9Y[0] && yCount < (wall9Y[0]+10'd150));

		//wall 10
		wall10 <= (xCount > wall10X[0] && xCount < (wall10X[0]+10'd20)) && (yCount > wall10Y[0] && yCount < (wall10Y[0]+10'd120));

		//wall 11
		wall11 <= (xCount > wall11X[0] && xCount < (wall11X[0]+10'd280)) && (yCount > wall11Y[0] && yCount < (wall11Y[0]+10'd20));

		//wall 12
		wall12 <= (xCount > wall12X[0] && xCount < (wall12X[0]+10'd250)) && (yCount > wall12Y[0] && yCount < (wall12Y[0]+10'd20));

		//wall 13
		wall13 <= (xCount > wall13X[0] && xCount < (wall13X[0]+10'd200)) && (yCount > wall13Y[0] && yCount < (wall13Y[0]+10'd20));
		
		//wall 14
		wall14 <= (xCount > wall14X[0] && xCount < (wall14X[0]+10'd300)) && (yCount > wall14Y[0] && yCount < (wall14Y[0]+10'd20));

		//wall 15
		wall15 <= (xCount > wall15X[0] && xCount < (wall15X[0]+10'd20)) && (yCount > wall15Y[0] && yCount < (wall15Y[0]+10'd100));
		
		//wall 16
		wall16 <= (xCount > wall16X[0] && xCount < (wall16X[0]+10'd400)) && (yCount > wall16Y[0] && yCount < (wall16Y[0]+10'd20));
		
		//wall 17
		wall17 <= (xCount > wall17X[0] && xCount < (wall17X[0]+10'd20)) && (yCount > wall17Y[0] && yCount < (wall17Y[0]+10'd110));
		
		//wall 18
		wall18 <= (xCount > wall18X[0] && xCount < (wall18X[0]+10'd20)) && (yCount > wall18Y[0] && yCount < (wall18Y[0]+10'd130));
		
		//wall 19
		wall19 <= (xCount > wall19X[0] && xCount < (wall19X[0]+10'd20)) && (yCount > wall19Y[0] && yCount < (wall19Y[0]+10'd110));
		
		//wall 20
		wall20 <= (xCount > wall20X[0] && xCount < (wall20X[0]+10'd20)) && (yCount > wall20Y[0] && yCount < (wall20Y[0]+10'd80));
		
		//wall 21
		wall21 <= (xCount > wall21X[0] && xCount < (wall21X[0]+10'd20)) && (yCount > wall21Y[0] && yCount < (wall21Y[0]+10'd180));
		
		//wall 22
		wall22 <= (xCount > wall22X[0] && xCount < (wall22X[0]+10'd20)) && (yCount > wall22Y[0] && yCount < (wall22Y[0]+10'd80));
				
		//wall 23
		wall23 <= (xCount > wall23X[0] && xCount < (wall23X[0]+10'd20)) && (yCount > wall23Y[0] && yCount < (wall23Y[0]+10'd60));
				
		//wall 24
		wall24 <= (xCount > wall24X[0] && xCount < (wall24X[0]+10'd20)) && (yCount > wall24Y[0] && yCount < (wall24Y[0]+10'd160));
		
		//wall 25
		wall25 <= (xCount > wall25X[0] && xCount < (wall25X[0]+10'd20)) && (yCount > wall25Y[0] && yCount < (wall25Y[0]+10'd60));
		
		//wall 26
		wall26 <= (xCount > wall26X[0] && xCount < (wall26X[0]+10'd20)) && (yCount > wall26Y[0] && yCount < (wall26Y[0]+10'd140));
	end
//	

/////wall1 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall1				
				wall1X[0] <= 10'd5;
				wall1Y[0] <= 9'd46;
			end
	end
//

///// wall2 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)//position of wall2
			begin
				wall2X[0] <= 10'd40;
				wall2Y[0] <= 9'd100;

			end
		end
//

/////wall3 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall3
				wall3X[0] <= 10'd10;
				wall3Y[0] <= 9'd150;
			end
	end
//wall4

always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall4
				wall4X[0] <= 10'd150;
				wall4Y[0] <= 9'd100;
			end
	end
/////wall5 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall5
				wall5X[0] <= 10'd50;
				wall5Y[0] <= 9'd250;
			end
	end
//

/////wall6 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall6
				wall6X[0] <= 10'd160;
				wall6Y[0] <= 9'd100;
			end
	end
//

/////wall7 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall7			
				wall7X[0] <= 10'd350;
				wall7Y[0] <= 9'd300;
			end
	end
//wall 8
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall8				
				wall8X[0] <= 10'd40;
				wall8Y[0] <= 9'd200;
			end
	end

/////wall9 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall9
				wall9X[0] <= 10'd300;
				wall9Y[0] <= 9'd250;
			end
	end
//

///wall10 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall10
				wall10X[0] <= 10'd400;
				wall10Y[0] <= 9'd300;			
			end
	end

/////wall11 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall11
				wall11X[0] <= 10'd260;
				wall11Y[0] <= 9'd150;
			end
	end
///wall12 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall12
				wall12X[0] <= 10'd150;
				wall12Y[0] <= 9'd250;
			end
	end
	
//wall 13

always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //starting position of wall13
				wall13X[0] <= 10'd450;
				wall13Y[0] <= 9'd250;
			end
	end
/////wall14 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall14
				wall14X[0] <= 10'd440;
				wall14Y[0] <= 9'd100;
			end
	end
//

/////wall15 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall15
				wall15X[0] <= 10'd500;
				wall15Y[0] <= 9'd100;
			end
	end
/////wall16 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall16
				wall16X[0] <= 10'd350;
				wall16Y[0] <= 9'd400;

			end
	end
	/////wall17 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall17
				wall17X[0] <= 10'd100;
				wall17Y[0] <= 9'd200;
			end
	end
	/////wall18 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall18
				wall18X[0] <= 10'd100;
				wall18Y[0] <= 9'd340;
			end
	end
	/////wall19 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall19
				wall19X[0] <= 10'd500;
				wall19Y[0] <= 9'd300;
			end
	end
	/////wall20 control /////
always @(posedge update)
	begin
		if (rst == 1'b1)
			begin //position of wall20
				wall20X[0] <= 10'd200;
				wall20Y[0] <= 9'd260;
			end
	end
	//wall21 control
	always @(posedge update)
	begin
		if (rst == 1'b1)
		begin //position of wall21
				wall21X[0] <= 10'd150;
				wall21Y[0] <= 9'd260;
			end
	end
		//wall22 control
	always @(posedge update)
	begin
		if (rst == 1'b1)
		begin //position of wall22
				wall22X[0] <= 10'd220;
				wall22Y[0] <= 9'd140;
			end
	end
			//wall23 control
	always @(posedge update)
	begin
		if (rst == 1'b1)
		begin //position of wall23
				wall23X[0] <= 10'd250;
				wall23Y[0] <= 9'd60;
			end
	end
			//wall24 control
	always @(posedge update)
	begin
		if (rst == 1'b1)
		begin //position of wall24
				wall24X[0] <= 10'd250;
				wall24Y[0] <= 9'd320;
			end
	end
		always @(posedge update)
	begin
		if (rst == 1'b1)
		begin //position of wall25
				wall25X[0] <= 10'd400;
				wall25Y[0] <= 9'd60;
			end
	end
	always @(posedge update)
	begin
		if (rst == 1'b1)
		begin //starting position of wall26
				wall26X[0] <= 10'd580;
				wall26Y[0] <= 9'd220;
			end
		end
endmodule 