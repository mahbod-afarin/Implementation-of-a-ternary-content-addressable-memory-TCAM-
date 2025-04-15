module TCAM (
    output reg [6:0] r_addr0,  // Lower digit of 7-segment display
    output reg [6:0] r_addr1,  // Upper digit of 7-segment display
    input wire wr,             // Write enable
    input wire reset,          // Reset signal
    input wire clk,            // Clock signal
    input wire [9:0] data,     // 10-bit input data to match or write
    input wire [3:0] addr      // 4-bit address for write
);

  reg [9:0] memory [0:15];     // 16-entry TCAM, each 10 bits wide
  integer i;

  // Synchronous logic: reset, write, or search
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      // Clear all memory on reset
      for (i = 0; i < 16; i = i + 1)
        memory[i] <= 10'b0;
    end else if (wr) begin
      // Write data to specified address
      memory[addr] <= data;
    end else begin : search_block
      // Search for matching data
      for (i = 0; i < 16; i = i + 1) begin
        if (memory[i] == data) begin
          if (i < 10) begin
            r_addr0 <= to7segment(i[3:0]);
            r_addr1 <= to7segment(4'd0);
          end else begin
            r_addr0 <= to7segment((i - 10)[3:0]);
            r_addr1 <= to7segment(4'd1);
          end
          disable search_block;  // Exit search after first match
        end
      end
    end
  end

  // Convert 4-bit value to 7-segment display encoding
  function [6:0] to7segment;
    input [3:0] bsd;
    begin
      case (bsd)
        4'h0: to7segment = 7'b1111110;
        4'h1: to7segment = 7'b0110000;
        4'h2: to7segment = 7'b1101101;
        4'h3: to7segment = 7'b1111001;
        4'h4: to7segment = 7'b0110011;
        4'h5: to7segment = 7'b1011011;
        4'h6: to7segment = 7'b1011111;
        4'h7: to7segment = 7'b1110000;
        4'h8: to7segment = 7'b1111111;
        4'h9: to7segment = 7'b1111011;
        default: to7segment = 7'b0000000;
      endcase
    end
  endfunction

endmodule
