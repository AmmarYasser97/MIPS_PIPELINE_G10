module Registers(Read_register_1, Read_register_2, Write_register, Write_data, RegWrite, Read_data_1, Read_data_2, Clock);

//Inputs
input [4:0]Read_register_1;
input [4:0]Read_register_2;

input [4:0]Write_register;

input [31:0]Write_data;
input RegWrite, Clock;


//Outputs
output [31:0] Read_data_1;
output [31:0] Read_data_2;

//The Main Register
reg[31:0] Registers[0:31];

//Assign is used directly rather tha creating a dummy register due to the same output
assign Read_data_1 = Registers[Read_register_1];
assign Read_data_2 = Registers[Read_register_2];

integer i = 0;

initial
begin
	for (i = 0; i < 32; i = i+1)
	begin
		Registers[i] = 0;
	end
end


//To Write in a register
always@(posedge Clock)
	begin
		if(RegWrite == 1)
			begin
				Registers[Write_register] <= Write_data;
			end

	end

endmodule




module tb_REG();

//Inputs
reg [4:0]Read_register_1;
reg [4:0]Read_register_2;

reg [4:0]Write_register;

reg [31:0]Write_data;
reg RegWrite, Clock;


//Outputs
wire [31:0] Read_data_1;
wire [31:0] Read_data_2;

initial
	begin
		$display("                  Time  | Register Location 1 | Register Location 2 | Register Address 1 | Register Address 2 | RegWrite  | Register Write Address | Register Write Data");

		$monitor($time,"    |   %d        |    %d       |        %d       |         %d         |        %d      |        %d     |   %d"     , Read_data_1, Read_data_2, Read_register_1, Read_register_2, RegWrite, Write_register, Write_data);

		Clock = 0;
		#2
		RegWrite <=1;
		Write_data <= 100;
		Write_register <= 1;

		#10
		RegWrite <=1;
		Write_data <= 200;
		Write_register <= 2;


		#10
		RegWrite <=1;
		Write_data <= 300;
		Write_register <= 3;

		#10
		RegWrite <=1;
		Write_data <= 400;
		Write_register <= 4;

		#10
		RegWrite <=0;
		Read_register_1 <= 1;
		Read_register_2 <= 4;
		
		#10
		RegWrite <=0;
		Read_register_1 <= 2;
		Read_register_2 <= 3;

		#10
		RegWrite <=0;
		Read_register_1 <= 5;
		Read_register_2 <= 6;







	end




always
	begin
		#5
		Clock = ~Clock; 
	end
Registers RF(Read_register_1, Read_register_2, Write_register, Write_data, RegWrite, Read_data_1, Read_data_2, Clock);
endmodule

