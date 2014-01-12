/********************************************************************************
 MOTOR CONTROL MODULE
 2013
 ZAY
*********************************************************************************/

module MOTOR_CONTROL(
CLK,M_C,COUNT_VALUE,DUTY_VALUE,
PWM,FWDREV,EN,BR,
PWR);

input CLK;			//EX CLK 50Mhz
input[3:0] M_C;	//motor control signals
input[15:0] COUNT_VALUE;	//for Frequency division(Khz)
input[15:0] DUTY_VALUE;		//duty cycle of PWM signal

output PWM;		//PWM signals for speed control
output FWDREV;	//FWDREV signals for direction control
output EN;		//EN signals for enable L6235
output BR;		//BRAKE signals
output PWR;     //Power control of BTS5235 for motor

//output cn0;

//reg EN;
//reg BR;
//reg FWDREV;

//instruction definiton
//`define 'b00

//instruction parse
//warning: can't realise wrong condition detection function!!!!!!!!!
assign FWDREV = M_C[0];
assign EN     = M_C[1];
assign BR     = M_C[2];
assign PWR	  = M_C[3];

//always @(posedge CLK) 
//	begin
//		//control signals parse
//		casex(INSTR)
//			3'bx0x:	EN <= 0;			//disable all power mosfet
//			3'bx1x:	EN <= 1;			//enable all power mosfet
//			3'b01x:	BR <= 0;			//disable all high-side power mosfet, brake function
//			3'b11x: BR <= 1;			//enable all high-side power mosfet	
//			3'b110:	FWDREV <= 1;		//move forward
//			3'b111:	FWDREV <= 0;		//move backward
//			default:	
//				begin
//					FWDREV <= 0;
//					EN <= 0;
//					BR <= 0;
//				end
//		endcase
//	end


	
//speed parse
PWM motor_vref (.CLK(CLK), .COUNT_VALUE(COUNT_VALUE), .DUTY_VALUE(DUTY_VALUE), .PWM(PWM));// .cn0(cn0));
 
endmodule