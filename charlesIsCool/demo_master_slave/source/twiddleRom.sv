// $Id: $
// File name:   twiddleRom.sv
// Created:     11/24/2016
// Author:      Erin Hill
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: twiddleROM
module twiddleRom
(
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
            twiddle_img = 16'b1111111111111010;
        end
        2: begin
            twiddle_real = 16'b0000000011111111;
            twiddle_img = 16'b1111111111110100;
        end
        3: begin
            twiddle_real = 16'b0000000011111111;
            twiddle_img = 16'b1111111111101110;
        end
        4: begin
            twiddle_real = 16'b0000000011111110;
            twiddle_img = 16'b1111111111100111;
        end
        5: begin
            twiddle_real = 16'b0000000011111110;
            twiddle_img = 16'b1111111111100001;
        end
        6: begin
            twiddle_real = 16'b0000000011111101;
            twiddle_img = 16'b1111111111011011;
        end
        7: begin
            twiddle_real = 16'b0000000011111100;
            twiddle_img = 16'b1111111111010101;
        end
        8: begin
            twiddle_real = 16'b0000000011111011;
            twiddle_img = 16'b1111111111001111;
        end
        9: begin
            twiddle_real = 16'b0000000011111001;
            twiddle_img = 16'b1111111111001000;
        end
        10: begin
            twiddle_real = 16'b0000000011111000;
            twiddle_img = 16'b1111111111000010;
        end
        11: begin
            twiddle_real = 16'b0000000011110110;
            twiddle_img = 16'b1111111110111100;
        end
        12: begin
            twiddle_real = 16'b0000000011110100;
            twiddle_img = 16'b1111111110110110;
        end
        13: begin
            twiddle_real = 16'b0000000011110011;
            twiddle_img = 16'b1111111110110000;
        end
        14: begin
            twiddle_real = 16'b0000000011110001;
            twiddle_img = 16'b1111111110101010;
        end
        15: begin
            twiddle_real = 16'b0000000011101110;
            twiddle_img = 16'b1111111110100100;
        end
        16: begin
            twiddle_real = 16'b0000000011101100;
            twiddle_img = 16'b1111111110011111;
        end
        17: begin
            twiddle_real = 16'b0000000011101010;
            twiddle_img = 16'b1111111110011001;
        end
        18: begin
            twiddle_real = 16'b0000000011100111;
            twiddle_img = 16'b1111111110010011;
        end
        19: begin
            twiddle_real = 16'b0000000011100100;
            twiddle_img = 16'b1111111110001101;
        end
        20: begin
            twiddle_real = 16'b0000000011100001;
            twiddle_img = 16'b1111111110001000;
        end
        21: begin
            twiddle_real = 16'b0000000011011110;
            twiddle_img = 16'b1111111110000010;
        end
        22: begin
            twiddle_real = 16'b0000000011011011;
            twiddle_img = 16'b1111111101111101;
        end
        23: begin
            twiddle_real = 16'b0000000011011000;
            twiddle_img = 16'b1111111101111000;
        end
        24: begin
            twiddle_real = 16'b0000000011010100;
            twiddle_img = 16'b1111111101110010;
        end
        25: begin
            twiddle_real = 16'b0000000011010001;
            twiddle_img = 16'b1111111101101101;
        end
        26: begin
            twiddle_real = 16'b0000000011001101;
            twiddle_img = 16'b1111111101101000;
        end
        27: begin
            twiddle_real = 16'b0000000011001001;
            twiddle_img = 16'b1111111101100011;
        end
        28: begin
            twiddle_real = 16'b0000000011000101;
            twiddle_img = 16'b1111111101011110;
        end
        29: begin
            twiddle_real = 16'b0000000011000001;
            twiddle_img = 16'b1111111101011001;
        end
        30: begin
            twiddle_real = 16'b0000000010111101;
            twiddle_img = 16'b1111111101010101;
        end
        31: begin
            twiddle_real = 16'b0000000010111001;
            twiddle_img = 16'b1111111101010000;
        end
        32: begin
            twiddle_real = 16'b0000000010110101;
            twiddle_img = 16'b1111111101001011;
        end
        33: begin
            twiddle_real = 16'b0000000010110000;
            twiddle_img = 16'b1111111101000111;
        end
        34: begin
            twiddle_real = 16'b0000000010101011;
            twiddle_img = 16'b1111111101000011;
        end
        35: begin
            twiddle_real = 16'b0000000010100111;
            twiddle_img = 16'b1111111100111111;
        end
        36: begin
            twiddle_real = 16'b0000000010100010;
            twiddle_img = 16'b1111111100111011;
        end
        37: begin
            twiddle_real = 16'b0000000010011101;
            twiddle_img = 16'b1111111100110111;
        end
        38: begin
            twiddle_real = 16'b0000000010011000;
            twiddle_img = 16'b1111111100110011;
        end
        39: begin
            twiddle_real = 16'b0000000010010011;
            twiddle_img = 16'b1111111100101111;
        end
        40: begin
            twiddle_real = 16'b0000000010001110;
            twiddle_img = 16'b1111111100101100;
        end
        41: begin
            twiddle_real = 16'b0000000010001000;
            twiddle_img = 16'b1111111100101000;
        end
        42: begin
            twiddle_real = 16'b0000000010000011;
            twiddle_img = 16'b1111111100100101;
        end
        43: begin
            twiddle_real = 16'b0000000001111110;
            twiddle_img = 16'b1111111100100010;
        end
        44: begin
            twiddle_real = 16'b0000000001111000;
            twiddle_img = 16'b1111111100011111;
        end
        45: begin
            twiddle_real = 16'b0000000001110011;
            twiddle_img = 16'b1111111100011100;
        end
        46: begin
            twiddle_real = 16'b0000000001101101;
            twiddle_img = 16'b1111111100011001;
        end
        47: begin
            twiddle_real = 16'b0000000001100111;
            twiddle_img = 16'b1111111100010110;
        end
        48: begin
            twiddle_real = 16'b0000000001100001;
            twiddle_img = 16'b1111111100010100;
        end
        49: begin
            twiddle_real = 16'b0000000001011100;
            twiddle_img = 16'b1111111100010010;
        end
        50: begin
            twiddle_real = 16'b0000000001010110;
            twiddle_img = 16'b1111111100001111;
        end
        51: begin
            twiddle_real = 16'b0000000001010000;
            twiddle_img = 16'b1111111100001101;
        end
        52: begin
            twiddle_real = 16'b0000000001001010;
            twiddle_img = 16'b1111111100001100;
        end
        53: begin
            twiddle_real = 16'b0000000001000100;
            twiddle_img = 16'b1111111100001010;
        end
        54: begin
            twiddle_real = 16'b0000000000111110;
            twiddle_img = 16'b1111111100001000;
        end
        55: begin
            twiddle_real = 16'b0000000000111000;
            twiddle_img = 16'b1111111100000111;
        end
        56: begin
            twiddle_real = 16'b0000000000110001;
            twiddle_img = 16'b1111111100000101;
        end
        57: begin
            twiddle_real = 16'b0000000000101011;
            twiddle_img = 16'b1111111100000100;
        end
        58: begin
            twiddle_real = 16'b0000000000100101;
            twiddle_img = 16'b1111111100000011;
        end
        59: begin
            twiddle_real = 16'b0000000000011111;
            twiddle_img = 16'b1111111100000010;
        end
        60: begin
            twiddle_real = 16'b0000000000011001;
            twiddle_img = 16'b1111111100000010;
        end
        61: begin
            twiddle_real = 16'b0000000000010010;
            twiddle_img = 16'b1111111100000001;
        end
        62: begin
            twiddle_real = 16'b0000000000001100;
            twiddle_img = 16'b1111111100000001;
        end
        63: begin
            twiddle_real = 16'b0000000000000110;
            twiddle_img = 16'b1111111100000001;
        end
        64: begin
            twiddle_real = 16'b0000000000000000;
            twiddle_img = 16'b1111111100000000;
        end
        65: begin
            twiddle_real = 16'b1111111111111010;
            twiddle_img = 16'b1111111100000001;
        end
        66: begin
            twiddle_real = 16'b1111111111110100;
            twiddle_img = 16'b1111111100000001;
        end
        67: begin
            twiddle_real = 16'b1111111111101110;
            twiddle_img = 16'b1111111100000001;
        end
        68: begin
            twiddle_real = 16'b1111111111100111;
            twiddle_img = 16'b1111111100000010;
        end
        69: begin
            twiddle_real = 16'b1111111111100001;
            twiddle_img = 16'b1111111100000010;
        end
        70: begin
            twiddle_real = 16'b1111111111011011;
            twiddle_img = 16'b1111111100000011;
        end
        71: begin
            twiddle_real = 16'b1111111111010101;
            twiddle_img = 16'b1111111100000100;
        end
        72: begin
            twiddle_real = 16'b1111111111001111;
            twiddle_img = 16'b1111111100000101;
        end
        73: begin
            twiddle_real = 16'b1111111111001000;
            twiddle_img = 16'b1111111100000111;
        end
        74: begin
            twiddle_real = 16'b1111111111000010;
            twiddle_img = 16'b1111111100001000;
        end
        75: begin
            twiddle_real = 16'b1111111110111100;
            twiddle_img = 16'b1111111100001010;
        end
        76: begin
            twiddle_real = 16'b1111111110110110;
            twiddle_img = 16'b1111111100001100;
        end
        77: begin
            twiddle_real = 16'b1111111110110000;
            twiddle_img = 16'b1111111100001101;
        end
        78: begin
            twiddle_real = 16'b1111111110101010;
            twiddle_img = 16'b1111111100001111;
        end
        79: begin
            twiddle_real = 16'b1111111110100100;
            twiddle_img = 16'b1111111100010010;
        end
        80: begin
            twiddle_real = 16'b1111111110011111;
            twiddle_img = 16'b1111111100010100;
        end
        81: begin
            twiddle_real = 16'b1111111110011001;
            twiddle_img = 16'b1111111100010110;
        end
        82: begin
            twiddle_real = 16'b1111111110010011;
            twiddle_img = 16'b1111111100011001;
        end
        83: begin
            twiddle_real = 16'b1111111110001101;
            twiddle_img = 16'b1111111100011100;
        end
        84: begin
            twiddle_real = 16'b1111111110001000;
            twiddle_img = 16'b1111111100011111;
        end
        85: begin
            twiddle_real = 16'b1111111110000010;
            twiddle_img = 16'b1111111100100010;
        end
        86: begin
            twiddle_real = 16'b1111111101111101;
            twiddle_img = 16'b1111111100100101;
        end
        87: begin
            twiddle_real = 16'b1111111101111000;
            twiddle_img = 16'b1111111100101000;
        end
        88: begin
            twiddle_real = 16'b1111111101110010;
            twiddle_img = 16'b1111111100101100;
        end
        89: begin
            twiddle_real = 16'b1111111101101101;
            twiddle_img = 16'b1111111100101111;
        end
        90: begin
            twiddle_real = 16'b1111111101101000;
            twiddle_img = 16'b1111111100110011;
        end
        91: begin
            twiddle_real = 16'b1111111101100011;
            twiddle_img = 16'b1111111100110111;
        end
        92: begin
            twiddle_real = 16'b1111111101011110;
            twiddle_img = 16'b1111111100111011;
        end
        93: begin
            twiddle_real = 16'b1111111101011001;
            twiddle_img = 16'b1111111100111111;
        end
        94: begin
            twiddle_real = 16'b1111111101010101;
            twiddle_img = 16'b1111111101000011;
        end
        95: begin
            twiddle_real = 16'b1111111101010000;
            twiddle_img = 16'b1111111101000111;
        end
        96: begin
            twiddle_real = 16'b1111111101001011;
            twiddle_img = 16'b1111111101001011;
        end
        97: begin
            twiddle_real = 16'b1111111101000111;
            twiddle_img = 16'b1111111101010000;
        end
        98: begin
            twiddle_real = 16'b1111111101000011;
            twiddle_img = 16'b1111111101010101;
        end
        99: begin
            twiddle_real = 16'b1111111100111111;
            twiddle_img = 16'b1111111101011001;
        end
        100: begin
            twiddle_real = 16'b1111111100111011;
            twiddle_img = 16'b1111111101011110;
        end
        101: begin
            twiddle_real = 16'b1111111100110111;
            twiddle_img = 16'b1111111101100011;
        end
        102: begin
            twiddle_real = 16'b1111111100110011;
            twiddle_img = 16'b1111111101101000;
        end
        103: begin
            twiddle_real = 16'b1111111100101111;
            twiddle_img = 16'b1111111101101101;
        end
        104: begin
            twiddle_real = 16'b1111111100101100;
            twiddle_img = 16'b1111111101110010;
        end
        105: begin
            twiddle_real = 16'b1111111100101000;
            twiddle_img = 16'b1111111101111000;
        end
        106: begin
            twiddle_real = 16'b1111111100100101;
            twiddle_img = 16'b1111111101111101;
        end
        107: begin
            twiddle_real = 16'b1111111100100010;
            twiddle_img = 16'b1111111110000010;
        end
        108: begin
            twiddle_real = 16'b1111111100011111;
            twiddle_img = 16'b1111111110001000;
        end
        109: begin
            twiddle_real = 16'b1111111100011100;
            twiddle_img = 16'b1111111110001101;
        end
        110: begin
            twiddle_real = 16'b1111111100011001;
            twiddle_img = 16'b1111111110010011;
        end
        111: begin
            twiddle_real = 16'b1111111100010110;
            twiddle_img = 16'b1111111110011001;
        end
        112: begin
            twiddle_real = 16'b1111111100010100;
            twiddle_img = 16'b1111111110011111;
        end
        113: begin
            twiddle_real = 16'b1111111100010010;
            twiddle_img = 16'b1111111110100100;
        end
        114: begin
            twiddle_real = 16'b1111111100001111;
            twiddle_img = 16'b1111111110101010;
        end
        115: begin
            twiddle_real = 16'b1111111100001101;
            twiddle_img = 16'b1111111110110000;
        end
        116: begin
            twiddle_real = 16'b1111111100001100;
            twiddle_img = 16'b1111111110110110;
        end
        117: begin
            twiddle_real = 16'b1111111100001010;
            twiddle_img = 16'b1111111110111100;
        end
        118: begin
            twiddle_real = 16'b1111111100001000;
            twiddle_img = 16'b1111111111000010;
        end
        119: begin
            twiddle_real = 16'b1111111100000111;
            twiddle_img = 16'b1111111111001000;
        end
        120: begin
            twiddle_real = 16'b1111111100000101;
            twiddle_img = 16'b1111111111001111;
        end
        121: begin
            twiddle_real = 16'b1111111100000100;
            twiddle_img = 16'b1111111111010101;
        end
        122: begin
            twiddle_real = 16'b1111111100000011;
            twiddle_img = 16'b1111111111011011;
        end
        123: begin
            twiddle_real = 16'b1111111100000010;
            twiddle_img = 16'b1111111111100001;
        end
        124: begin
            twiddle_real = 16'b1111111100000010;
            twiddle_img = 16'b1111111111100111;
        end
        125: begin
            twiddle_real = 16'b1111111100000001;
            twiddle_img = 16'b1111111111101110;
        end
        126: begin
            twiddle_real = 16'b1111111100000001;
            twiddle_img = 16'b1111111111110100;
        end
        127: begin
            twiddle_real = 16'b1111111100000001;
            twiddle_img = 16'b1111111111111010;
        end
        default: begin
            twiddle_real = 16'h0000;
            twiddle_img = 16'h0000;
        end
     endcase
end
endmodule
