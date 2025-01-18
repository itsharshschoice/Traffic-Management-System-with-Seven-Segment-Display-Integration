module Traffic_Light_Controller(HighwayN, HighwayS ,CityE, CityW, clk, rst);

input clk, rst;
output reg [6:0] HighwayN, HighwayS ,CityE, CityW;

// Delays
localparam
GREEN_TO_YELLOW  = 2'd2,  // 2 clock cycles
YELLOW_TO_RED    = 2'd1;  // 1 clock cycle


// To display on seven segment display
localparam
RED    = 7'b1110111,    // To display 'R' 
YELLOW = 7'b0110011,    // To display 'Y'
GREEN  = 7'b1011111;    // To display 'G'


// Traffic Light States
localparam 
           // HighwayN  CityE  HighwayS  CityW
S0 = 4'd0, // GREEN     RED      RED      RED
S1 = 4'd1, // YELLOW    RED      RED      RED
S2 = 4'd2, // RED       GREEN    RED      RED
S3 = 4'd3, // RED       YELLOW   RED      RED
S4 = 4'd4, // RED       RED      GREEN    RED
S5 = 4'd5, // RED       RED      YELLOW   RED
S6 = 4'd6, // RED       RED      RED      GREEN
S7 = 4'd7; // RED       RED      RED      YELLOW


//Internal state variables
reg [3:0] PS;       // Present state
reg [3:0] NS;       // Next state
reg [1:0] counter;  // To count delay


// State transition logic
always @(posedge clk or posedge rst)
begin
if (rst) begin
PS <= S0;
counter <= GREEN_TO_YELLOW;
end
else if (counter == 0) begin
PS <= NS;
	case(NS)
	S0,S2,S4,S6 : counter <= GREEN_TO_YELLOW;
	S1,S3,S5,S7 : counter <= YELLOW_TO_RED;
	default :counter <= 0;
	endcase
end
else
counter <= counter-1;

end


// Output logic
always @(*)
begin

case(PS)

S0: begin
        HighwayN  = GREEN;
        CityE     = RED;
        HighwayS  = RED;
        CityW     = RED;
end
S1: begin
        HighwayN  = YELLOW;
        CityE     = RED;
        HighwayS  = RED;
        CityW     = RED;
end
S2: begin
        HighwayN  = RED;
        CityE     = GREEN;
        HighwayS  = RED;
        CityW     = RED;
end
S3: begin
        HighwayN  = RED;
        CityE     = YELLOW;
        HighwayS  = RED;
        CityW     = RED;
end
S4: begin
        HighwayN  = RED;
        CityE     = RED;
        HighwayS  = GREEN;
        CityW     = RED;
end
S5: begin
        HighwayN  = RED;
        CityE     = RED;
        HighwayS  = YELLOW;
        CityW     = RED;
end
S6: begin
        HighwayN  = RED;
        CityE     = RED;
        HighwayS  = RED;
        CityW     = GREEN;
end
S7: begin
        HighwayN  = RED;
        CityE     = RED;
        HighwayS  = RED;
        CityW     = YELLOW;
end
default: begin
        HighwayN  = RED;
        CityE     = RED;
        HighwayS  = RED;
        CityW     = RED;
end

endcase
end

// Combinational Logic: Next State Logic
always @(*)
begin

case (PS)

S0: NS = S1;
S1: NS = S2;
S2: NS = S3;
S3: NS = S4;
S4: NS = S5;
S5: NS = S6;
S6: NS = S7;
S7: NS = S0;
default: NS = S0;

endcase
end

endmodule