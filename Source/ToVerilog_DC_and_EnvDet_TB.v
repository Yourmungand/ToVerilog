
`timescale 1ns / 1ps

module ToVerilog_TB;

	// Inputs
	reg clk;
	reg reset;
	reg [12:0] IN;

	// Outputs
	wire [12:0] OUT;
	wire [12:0] Env;
	// Input Data Matrix
	reg [12:0] Din [0:99];
	
	// Output Data Matrix
	reg [12:0] Dout_DC [0:99];
	reg [12:0] Dout_Env [0:99];
	// Counter
	reg [10:0] cntr = 11'd0;
	
	// RefOutDataDC
	reg [12:0] RefOutDataDC = 13'd0;
	
	// RefOutDataEnv
	reg [12:0] RefOutDataEnv = 13'd0;
	
	// ErrorDC
	reg [12:0] ErrorDC = 13'd0;
	
	// ErrorEnv
	reg [12:0] ErrorEnv = 13'd0;

	// Instantiate the Unit Under Test (UUT)
	ToVerilog uut (
		.clk(clk), 
		.reset(reset), 
		.DataIn(IN), 
		.DC_Out(OUT),
		.Env_Out(Env)
	);
        initial $sdf_annotate("../Encounter/DC_Env.sdf", inst);
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		IN = 13'b000000000000;
		
		
		#400;
		reset = 0;
		
		#1000;
		reset = 1;
		
		#3000;
		reset = 0;
		
		#88000;
	end
	
// Read data from files
	initial $readmemb("/home/student3/Bezrukov_V/Digital_ASIC/Source/DataIn.txt", Din);		// input data
	initial $readmemb("/home/student3/Bezrukov_V/Digital_ASIC/Source/DC_Out.txt", Dout_DC);	// reference output for error counting
	initial $readmemb("/home/student3/Bezrukov_V/Digital_ASIC/Source/Env_Out.txt", Dout_Env);	// reference output for error counting
// clock process
	always
		begin
		#20 clk = ~clk;
		end

// counter process for reading data
	always @(negedge clk)
	begin
		if (reset || cntr == 11'd2047)
			cntr <= 11'd0;
		else begin
			cntr <= cntr + 1;
		end
	end
   
// input data reading
	always @(negedge clk)
	begin
		if (reset)
			IN <= 13'd0;
		else begin
			IN <= Din[cntr];
		end
	end
	
// reference output data reading	
	always @(posedge clk)
	begin
		if (reset)
			RefOutDataDC <= 13'd0;
		else begin
			RefOutDataDC <= Dout_DC[cntr];
		end
	end
	
	// reference output data reading	
	always @(posedge clk)
	begin
		if (reset)
			RefOutDataEnv <= 13'd0;
		else begin
			RefOutDataEnv <= Dout_Env[cntr];
		end
	end

// error counting for DC
	always @(posedge clk)
	begin
		if (reset)
			ErrorDC <= 13'd0;
		else begin
			ErrorDC <= RefOutDataDC - OUT;
		end
	end
      
		// error counting for DC
	always @(posedge clk)
	begin
		if (reset)
			ErrorEnv <= 13'd0;
		else begin
			ErrorEnv <= RefOutDataEnv - Env;
		end
	end
endmodule
