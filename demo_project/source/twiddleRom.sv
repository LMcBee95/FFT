module twiddle_rom(
     input wire [6:0] twiddle_index,
     output reg [15:0] twiddle_real,
     output reg [15:0] twiddle_img
);
always_comb begin
     case(twiddle_index)
        0: begin
            twiddle_real = 16'b0000000100000000;
            twiddle_img = 16'b0000000000000000;
        end
        1: begin
            twiddle_real = 16'b0000000011111111;
            twiddle_img = 16'b1000000000000110;
        end
        2: begin
            twiddle_real = 16'b0000000011111111;
            twiddle_img = 16'b1000000000001100;
        end
        3: begin
            twiddle_real = 16'b0000000011111111;
            twiddle_img = 16'b1000000000010010;
        end
        4: begin
            twiddle_real = 16'b0000000011111110;
            twiddle_img = 16'b1000000000011001;
        end
        5: begin
            twiddle_real = 16'b0000000011111110;
            twiddle_img = 16'b1000000000011111;
        end
        6: begin
            twiddle_real = 16'b0000000011111101;
            twiddle_img = 16'b1000000000100101;
        end
        7: begin
            twiddle_real = 16'b0000000011111100;
            twiddle_img = 16'b1000000000101011;
        end
        8: begin
            twiddle_real = 16'b0000000011111011;
            twiddle_img = 16'b1000000000110001;
        end
        9: begin
            twiddle_real = 16'b0000000011111001;
            twiddle_img = 16'b1000000000111000;
        end
        10: begin
            twiddle_real = 16'b0000000011111000;
            twiddle_img = 16'b1000000000111110;
        end
        11: begin
            twiddle_real = 16'b0000000011110110;
            twiddle_img = 16'b1000000001000100;
        end
        12: begin
            twiddle_real = 16'b0000000011110100;
            twiddle_img = 16'b1000000001001010;
        end
        13: begin
            twiddle_real = 16'b0000000011110011;
            twiddle_img = 16'b1000000001010000;
        end
        14: begin
            twiddle_real = 16'b0000000011110001;
            twiddle_img = 16'b1000000001010110;
        end
        15: begin
            twiddle_real = 16'b0000000011101110;
            twiddle_img = 16'b1000000001011100;
        end
        16: begin
            twiddle_real = 16'b0000000011101100;
            twiddle_img = 16'b1000000001100001;
        end
        17: begin
            twiddle_real = 16'b0000000011101010;
            twiddle_img = 16'b1000000001100111;
        end
        18: begin
            twiddle_real = 16'b0000000011100111;
            twiddle_img = 16'b1000000001101101;
        end
        19: begin
            twiddle_real = 16'b0000000011100100;
            twiddle_img = 16'b1000000001110011;
        end
        20: begin
            twiddle_real = 16'b0000000011100001;
            twiddle_img = 16'b1000000001111000;
        end
        21: begin
            twiddle_real = 16'b0000000011011110;
            twiddle_img = 16'b1000000001111110;
        end
        22: begin
            twiddle_real = 16'b0000000011011011;
            twiddle_img = 16'b1000000010000011;
        end
        23: begin
            twiddle_real = 16'b0000000011011000;
            twiddle_img = 16'b1000000010001000;
        end
        24: begin
            twiddle_real = 16'b0000000011010100;
            twiddle_img = 16'b1000000010001110;
        end
        25: begin
            twiddle_real = 16'b0000000011010001;
            twiddle_img = 16'b1000000010010011;
        end
        26: begin
            twiddle_real = 16'b0000000011001101;
            twiddle_img = 16'b1000000010011000;
        end
        27: begin
            twiddle_real = 16'b0000000011001001;
            twiddle_img = 16'b1000000010011101;
        end
        28: begin
            twiddle_real = 16'b0000000011000101;
            twiddle_img = 16'b1000000010100010;
        end
        29: begin
            twiddle_real = 16'b0000000011000001;
            twiddle_img = 16'b1000000010100111;
        end
        30: begin
            twiddle_real = 16'b0000000010111101;
            twiddle_img = 16'b1000000010101011;
        end
        31: begin
            twiddle_real = 16'b0000000010111001;
            twiddle_img = 16'b1000000010110000;
        end
        32: begin
            twiddle_real = 16'b0000000010110101;
            twiddle_img = 16'b1000000010110101;
        end
        33: begin
            twiddle_real = 16'b0000000010110000;
            twiddle_img = 16'b1000000010111001;
        end
        34: begin
            twiddle_real = 16'b0000000010101011;
            twiddle_img = 16'b1000000010111101;
        end
        35: begin
            twiddle_real = 16'b0000000010100111;
            twiddle_img = 16'b1000000011000001;
        end
        36: begin
            twiddle_real = 16'b0000000010100010;
            twiddle_img = 16'b1000000011000101;
        end
        37: begin
            twiddle_real = 16'b0000000010011101;
            twiddle_img = 16'b1000000011001001;
        end
        38: begin
            twiddle_real = 16'b0000000010011000;
            twiddle_img = 16'b1000000011001101;
        end
        39: begin
            twiddle_real = 16'b0000000010010011;
            twiddle_img = 16'b1000000011010001;
        end
        40: begin
            twiddle_real = 16'b0000000010001110;
            twiddle_img = 16'b1000000011010100;
        end
        41: begin
            twiddle_real = 16'b0000000010001000;
            twiddle_img = 16'b1000000011011000;
        end
        42: begin
            twiddle_real = 16'b0000000010000011;
            twiddle_img = 16'b1000000011011011;
        end
        43: begin
            twiddle_real = 16'b0000000001111110;
            twiddle_img = 16'b1000000011011110;
        end
        44: begin
            twiddle_real = 16'b0000000001111000;
            twiddle_img = 16'b1000000011100001;
        end
        45: begin
            twiddle_real = 16'b0000000001110011;
            twiddle_img = 16'b1000000011100100;
        end
        46: begin
            twiddle_real = 16'b0000000001101101;
            twiddle_img = 16'b1000000011100111;
        end
        47: begin
            twiddle_real = 16'b0000000001100111;
            twiddle_img = 16'b1000000011101010;
        end
        48: begin
            twiddle_real = 16'b0000000001100001;
            twiddle_img = 16'b1000000011101100;
        end
        49: begin
            twiddle_real = 16'b0000000001011100;
            twiddle_img = 16'b1000000011101110;
        end
        50: begin
            twiddle_real = 16'b0000000001010110;
            twiddle_img = 16'b1000000011110001;
        end
        51: begin
            twiddle_real = 16'b0000000001010000;
            twiddle_img = 16'b1000000011110011;
        end
        52: begin
            twiddle_real = 16'b0000000001001010;
            twiddle_img = 16'b1000000011110100;
        end
        53: begin
            twiddle_real = 16'b0000000001000100;
            twiddle_img = 16'b1000000011110110;
        end
        54: begin
            twiddle_real = 16'b0000000000111110;
            twiddle_img = 16'b1000000011111000;
        end
        55: begin
            twiddle_real = 16'b0000000000111000;
            twiddle_img = 16'b1000000011111001;
        end
        56: begin
            twiddle_real = 16'b0000000000110001;
            twiddle_img = 16'b1000000011111011;
        end
        57: begin
            twiddle_real = 16'b0000000000101011;
            twiddle_img = 16'b1000000011111100;
        end
        58: begin
            twiddle_real = 16'b0000000000100101;
            twiddle_img = 16'b1000000011111101;
        end
        59: begin
            twiddle_real = 16'b0000000000011111;
            twiddle_img = 16'b1000000011111110;
        end
        60: begin
            twiddle_real = 16'b0000000000011001;
            twiddle_img = 16'b1000000011111110;
        end
        61: begin
            twiddle_real = 16'b0000000000010010;
            twiddle_img = 16'b1000000011111111;
        end
        62: begin
            twiddle_real = 16'b0000000000001100;
            twiddle_img = 16'b1000000011111111;
        end
        63: begin
            twiddle_real = 16'b0000000000000110;
            twiddle_img = 16'b1000000011111111;
        end
        64: begin
            twiddle_real = 16'b0000000000000000;
            twiddle_img = 16'b1000000100000000;
        end
        65: begin
            twiddle_real = 16'b1000000000000110;
            twiddle_img = 16'b1000000011111111;
        end
        66: begin
            twiddle_real = 16'b1000000000001100;
            twiddle_img = 16'b1000000011111111;
        end
        67: begin
            twiddle_real = 16'b1000000000010010;
            twiddle_img = 16'b1000000011111111;
        end
        68: begin
            twiddle_real = 16'b1000000000011001;
            twiddle_img = 16'b1000000011111110;
        end
        69: begin
            twiddle_real = 16'b1000000000011111;
            twiddle_img = 16'b1000000011111110;
        end
        70: begin
            twiddle_real = 16'b1000000000100101;
            twiddle_img = 16'b1000000011111101;
        end
        71: begin
            twiddle_real = 16'b1000000000101011;
            twiddle_img = 16'b1000000011111100;
        end
        72: begin
            twiddle_real = 16'b1000000000110001;
            twiddle_img = 16'b1000000011111011;
        end
        73: begin
            twiddle_real = 16'b1000000000111000;
            twiddle_img = 16'b1000000011111001;
        end
        74: begin
            twiddle_real = 16'b1000000000111110;
            twiddle_img = 16'b1000000011111000;
        end
        75: begin
            twiddle_real = 16'b1000000001000100;
            twiddle_img = 16'b1000000011110110;
        end
        76: begin
            twiddle_real = 16'b1000000001001010;
            twiddle_img = 16'b1000000011110100;
        end
        77: begin
            twiddle_real = 16'b1000000001010000;
            twiddle_img = 16'b1000000011110011;
        end
        78: begin
            twiddle_real = 16'b1000000001010110;
            twiddle_img = 16'b1000000011110001;
        end
        79: begin
            twiddle_real = 16'b1000000001011100;
            twiddle_img = 16'b1000000011101110;
        end
        80: begin
            twiddle_real = 16'b1000000001100001;
            twiddle_img = 16'b1000000011101100;
        end
        81: begin
            twiddle_real = 16'b1000000001100111;
            twiddle_img = 16'b1000000011101010;
        end
        82: begin
            twiddle_real = 16'b1000000001101101;
            twiddle_img = 16'b1000000011100111;
        end
        83: begin
            twiddle_real = 16'b1000000001110011;
            twiddle_img = 16'b1000000011100100;
        end
        84: begin
            twiddle_real = 16'b1000000001111000;
            twiddle_img = 16'b1000000011100001;
        end
        85: begin
            twiddle_real = 16'b1000000001111110;
            twiddle_img = 16'b1000000011011110;
        end
        86: begin
            twiddle_real = 16'b1000000010000011;
            twiddle_img = 16'b1000000011011011;
        end
        87: begin
            twiddle_real = 16'b1000000010001000;
            twiddle_img = 16'b1000000011011000;
        end
        88: begin
            twiddle_real = 16'b1000000010001110;
            twiddle_img = 16'b1000000011010100;
        end
        89: begin
            twiddle_real = 16'b1000000010010011;
            twiddle_img = 16'b1000000011010001;
        end
        90: begin
            twiddle_real = 16'b1000000010011000;
            twiddle_img = 16'b1000000011001101;
        end
        91: begin
            twiddle_real = 16'b1000000010011101;
            twiddle_img = 16'b1000000011001001;
        end
        92: begin
            twiddle_real = 16'b1000000010100010;
            twiddle_img = 16'b1000000011000101;
        end
        93: begin
            twiddle_real = 16'b1000000010100111;
            twiddle_img = 16'b1000000011000001;
        end
        94: begin
            twiddle_real = 16'b1000000010101011;
            twiddle_img = 16'b1000000010111101;
        end
        95: begin
            twiddle_real = 16'b1000000010110000;
            twiddle_img = 16'b1000000010111001;
        end
        96: begin
            twiddle_real = 16'b1000000010110101;
            twiddle_img = 16'b1000000010110101;
        end
        97: begin
            twiddle_real = 16'b1000000010111001;
            twiddle_img = 16'b1000000010110000;
        end
        98: begin
            twiddle_real = 16'b1000000010111101;
            twiddle_img = 16'b1000000010101011;
        end
        99: begin
            twiddle_real = 16'b1000000011000001;
            twiddle_img = 16'b1000000010100111;
        end
        100: begin
            twiddle_real = 16'b1000000011000101;
            twiddle_img = 16'b1000000010100010;
        end
        101: begin
            twiddle_real = 16'b1000000011001001;
            twiddle_img = 16'b1000000010011101;
        end
        102: begin
            twiddle_real = 16'b1000000011001101;
            twiddle_img = 16'b1000000010011000;
        end
        103: begin
            twiddle_real = 16'b1000000011010001;
            twiddle_img = 16'b1000000010010011;
        end
        104: begin
            twiddle_real = 16'b1000000011010100;
            twiddle_img = 16'b1000000010001110;
        end
        105: begin
            twiddle_real = 16'b1000000011011000;
            twiddle_img = 16'b1000000010001000;
        end
        106: begin
            twiddle_real = 16'b1000000011011011;
            twiddle_img = 16'b1000000010000011;
        end
        107: begin
            twiddle_real = 16'b1000000011011110;
            twiddle_img = 16'b1000000001111110;
        end
        108: begin
            twiddle_real = 16'b1000000011100001;
            twiddle_img = 16'b1000000001111000;
        end
        109: begin
            twiddle_real = 16'b1000000011100100;
            twiddle_img = 16'b1000000001110011;
        end
        110: begin
            twiddle_real = 16'b1000000011100111;
            twiddle_img = 16'b1000000001101101;
        end
        111: begin
            twiddle_real = 16'b1000000011101010;
            twiddle_img = 16'b1000000001100111;
        end
        112: begin
            twiddle_real = 16'b1000000011101100;
            twiddle_img = 16'b1000000001100001;
        end
        113: begin
            twiddle_real = 16'b1000000011101110;
            twiddle_img = 16'b1000000001011100;
        end
        114: begin
            twiddle_real = 16'b1000000011110001;
            twiddle_img = 16'b1000000001010110;
        end
        115: begin
            twiddle_real = 16'b1000000011110011;
            twiddle_img = 16'b1000000001010000;
        end
        116: begin
            twiddle_real = 16'b1000000011110100;
            twiddle_img = 16'b1000000001001010;
        end
        117: begin
            twiddle_real = 16'b1000000011110110;
            twiddle_img = 16'b1000000001000100;
        end
        118: begin
            twiddle_real = 16'b1000000011111000;
            twiddle_img = 16'b1000000000111110;
        end
        119: begin
            twiddle_real = 16'b1000000011111001;
            twiddle_img = 16'b1000000000111000;
        end
        120: begin
            twiddle_real = 16'b1000000011111011;
            twiddle_img = 16'b1000000000110001;
        end
        121: begin
            twiddle_real = 16'b1000000011111100;
            twiddle_img = 16'b1000000000101011;
        end
        122: begin
            twiddle_real = 16'b1000000011111101;
            twiddle_img = 16'b1000000000100101;
        end
        123: begin
            twiddle_real = 16'b1000000011111110;
            twiddle_img = 16'b1000000000011111;
        end
        124: begin
            twiddle_real = 16'b1000000011111110;
            twiddle_img = 16'b1000000000011001;
        end
        125: begin
            twiddle_real = 16'b1000000011111111;
            twiddle_img = 16'b1000000000010010;
        end
        126: begin
            twiddle_real = 16'b1000000011111111;
            twiddle_img = 16'b1000000000001100;
        end
        127: begin
            twiddle_real = 16'b1000000011111111;
            twiddle_img = 16'b1000000000000110;
        end
        default: begin
            twiddle_real = 16'h0000;
            twiddle_img = 16'h0000;
        end
     endcase
end
endmodule
