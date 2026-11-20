module traffic_signal_controller(
    input wire clk,
    input wire reset,
    input wire emergency,

    output reg red_ns,
    output reg yellow_ns,
    output reg green_ns,

    output reg red_ew,
    output reg yellow_ew,
    output reg green_ew
);

// State definitions
parameter NS_GREEN  = 3'b000;
parameter NS_YELLOW = 3'b001;
parameter EW_GREEN  = 3'b010;
parameter EW_YELLOW = 3'b011;
parameter ALL_RED   = 3'b100;

reg [2:0] state;
reg [26:0] counter;
reg tick;

// Clock divider: 100 MHz to 1 Hz
always @(posedge clk) begin
    if (reset) begin
        counter <= 0;
        tick <= 0;
    end
    else if (counter == 27'd99_999_999) begin
        counter <= 0;
        tick <= 1;
    end
    else begin
        counter <= counter + 1;
        tick <= 0;
    end
end

// Traffic signal state machine
always @(posedge clk) begin
    if (reset) begin
        state <= NS_GREEN;
    end
    else if (emergency) begin
        state <= ALL_RED;
    end
    else if (tick) begin
        case(state)

            NS_GREEN:
                if (counter == 0)
                    state <= NS_YELLOW;

            NS_YELLOW:
                state <= EW_GREEN;

            EW_GREEN:
                if (counter == 0)
                    state <= EW_YELLOW;

            EW_YELLOW:
                state <= ALL_RED;

            ALL_RED:
                state <= NS_GREEN;

            default:
                state <= NS_GREEN;

        endcase
    end
end

// Traffic light output logic
always @(*) begin

    red_ns = 0;
    yellow_ns = 0;
    green_ns = 0;

    red_ew = 0;
    yellow_ew = 0;
    green_ew = 0;

    case(state)

        NS_GREEN: begin
            green_ns = 1;
            red_ew = 1;
        end

        NS_YELLOW: begin
            yellow_ns = 1;
            red_ew = 1;
        end

        EW_GREEN: begin
            red_ns = 1;
            green_ew = 1;
        end

        EW_YELLOW: begin
            red_ns = 1;
            yellow_ew = 1;
        end

        ALL_RED: begin
            red_ns = 1;
            red_ew = 1;
        end

        default: begin
            red_ns = 1;
            red_ew = 1;
        end

    endcase

    if (emergency) begin
        red_ns = 1;
        yellow_ns = 0;
        green_ns = 0;
        red_ew = 1;
        yellow_ew = 0;
        green_ew = 0;
    end

end

endmodule
