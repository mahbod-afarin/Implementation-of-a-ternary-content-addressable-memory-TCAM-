module TCAM(r_addr0, r_addr1, data, addr, wr, reset, clk);
  output reg[6:0] r_addr0, r_addr1;
  input wr, reset, clk;
  input[9:0] data;
  input[3:0] addr;
  
  reg[9:0] memory[0:15];
  integer i;
  
  always @(posedge clk or posedge reset)
  begin
    if(reset == 1)
      begin
        for(i=0; i<16; i=i+1)
        begin
          memory[i] = 10'b0;
        end
      end
    else
      begin
        if(wr == 1)
          begin
            memory[addr] = data;
          end
        else
          begin: forloop
            for(i=0; i<16; i = i+1)
            begin
              if(data == memory[i])
                begin
                  if(i < 10)
                    begin
                      r_addr0 = to7segment(i);
                      r_addr1 = to7segment(0);
                    end
                  else
                    begin
                      r_addr0 = to7segment(i - 10);
                      r_addr1 = to7segment(1);
                    end
                    
                  disable forloop;
                end
            end
          end        
      end
  end
  
  function[6:0] to7segment;
    input[3:0] bsd;
    begin
      case(bsd)
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
