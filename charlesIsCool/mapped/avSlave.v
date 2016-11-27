/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Nov 27 00:41:23 2016
/////////////////////////////////////////////////////////////


module avSlave ( clk, n_rst, slave_read, slave_write, slave_address, 
        slave_writedata, slave_chipselect, fft_init_data, wAddress, fft_start, 
        sWriteEn );
  input [8:0] slave_address;
  input [31:0] slave_writedata;
  output [15:0] fft_init_data;
  output [8:0] wAddress;
  input clk, n_rst, slave_read, slave_write, slave_chipselect;
  output fft_start, sWriteEn;
  wire   n109, n122, n124, n126, n128, n130, n132, n134, n136, n138, n140,
         n146, n148, n150, n152, n154, n156, n158, n160, n162, n164, n166,
         n168, n170, n172, n174, n176, n178, n180, n182, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292;
  wire   [31:0] state;
  wire   [31:0] dataIn;
  tri   [8:0] wAddress;
  tri   sWriteEn;

  DFFSR \dataIn_reg[31]  ( .D(n184), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[31]) );
  DFFSR \dataIn_reg[30]  ( .D(n182), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[30]) );
  DFFSR \dataIn_reg[29]  ( .D(n180), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[29]) );
  DFFSR \dataIn_reg[28]  ( .D(n178), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[28]) );
  DFFSR \dataIn_reg[27]  ( .D(n176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[27]) );
  DFFSR \dataIn_reg[26]  ( .D(n174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[26]) );
  DFFSR \dataIn_reg[25]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[25]) );
  DFFSR \dataIn_reg[24]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[24]) );
  DFFSR \dataIn_reg[23]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[23]) );
  DFFSR \dataIn_reg[22]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[22]) );
  DFFSR \dataIn_reg[21]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[21]) );
  DFFSR \dataIn_reg[20]  ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[20]) );
  DFFSR \dataIn_reg[19]  ( .D(n160), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[19]) );
  DFFSR \dataIn_reg[18]  ( .D(n158), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[18]) );
  DFFSR \dataIn_reg[17]  ( .D(n156), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[17]) );
  DFFSR \dataIn_reg[16]  ( .D(n154), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[16]) );
  DFFSR \dataIn_reg[15]  ( .D(n152), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[15]) );
  DFFSR \dataIn_reg[14]  ( .D(n150), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[14]) );
  DFFSR \dataIn_reg[13]  ( .D(n148), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[13]) );
  DFFSR \dataIn_reg[12]  ( .D(n146), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[12]) );
  DFFSR \dataIn_reg[11]  ( .D(n282), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[11]) );
  DFFSR \dataIn_reg[10]  ( .D(n281), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[10]) );
  DFFSR \dataIn_reg[9]  ( .D(n140), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[9]) );
  DFFSR \dataIn_reg[8]  ( .D(n138), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[8]) );
  DFFSR \dataIn_reg[7]  ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[7]) );
  DFFSR \dataIn_reg[6]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[6]) );
  DFFSR \dataIn_reg[5]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[5]) );
  DFFSR \dataIn_reg[4]  ( .D(n130), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[4]) );
  DFFSR \dataIn_reg[3]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[3]) );
  DFFSR \dataIn_reg[2]  ( .D(n126), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[2]) );
  DFFSR \dataIn_reg[1]  ( .D(n124), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[1]) );
  DFFSR \dataIn_reg[0]  ( .D(n122), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[0]) );
  DFFSR \state_reg[0]  ( .D(n186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n185), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  TBUFX1 sWriteEn_tri ( .A(n283), .EN(n109), .Y(sWriteEn) );
  TBUFX1 \wAddress_tri[0]  ( .A(n292), .EN(n109), .Y(wAddress[0]) );
  TBUFX1 \wAddress_tri[1]  ( .A(n291), .EN(n109), .Y(wAddress[1]) );
  TBUFX1 \wAddress_tri[2]  ( .A(n290), .EN(n109), .Y(wAddress[2]) );
  TBUFX1 \wAddress_tri[3]  ( .A(n289), .EN(n109), .Y(wAddress[3]) );
  TBUFX1 \wAddress_tri[4]  ( .A(n288), .EN(n109), .Y(wAddress[4]) );
  TBUFX1 \wAddress_tri[5]  ( .A(n287), .EN(n109), .Y(wAddress[5]) );
  TBUFX1 \wAddress_tri[6]  ( .A(n286), .EN(n109), .Y(wAddress[6]) );
  TBUFX1 \wAddress_tri[7]  ( .A(n285), .EN(n109), .Y(wAddress[7]) );
  TBUFX1 \wAddress_tri[8]  ( .A(n284), .EN(n109), .Y(wAddress[8]) );
  NAND2X1 U204 ( .A(slave_chipselect), .B(slave_write), .Y(n187) );
  INVX4 U205 ( .A(n187), .Y(n188) );
  INVX1 U206 ( .A(n189), .Y(n281) );
  MUX2X1 U207 ( .B(dataIn[10]), .A(slave_writedata[10]), .S(n188), .Y(n189) );
  INVX1 U208 ( .A(n190), .Y(n282) );
  MUX2X1 U209 ( .B(dataIn[11]), .A(slave_writedata[11]), .S(n188), .Y(n190) );
  INVX1 U210 ( .A(slave_write), .Y(n283) );
  INVX1 U211 ( .A(slave_address[8]), .Y(n284) );
  INVX1 U212 ( .A(slave_address[7]), .Y(n285) );
  INVX1 U213 ( .A(slave_address[6]), .Y(n286) );
  INVX1 U214 ( .A(slave_address[5]), .Y(n287) );
  INVX1 U215 ( .A(slave_address[4]), .Y(n288) );
  INVX1 U216 ( .A(slave_address[3]), .Y(n289) );
  INVX1 U217 ( .A(slave_address[2]), .Y(n290) );
  INVX1 U218 ( .A(slave_address[1]), .Y(n291) );
  INVX1 U219 ( .A(slave_address[0]), .Y(n292) );
  OAI21X1 U220 ( .A(n191), .B(n192), .C(n193), .Y(n186) );
  OAI21X1 U221 ( .A(state[1]), .B(n194), .C(state[0]), .Y(n193) );
  NAND3X1 U222 ( .A(n195), .B(n196), .C(n197), .Y(n192) );
  NOR2X1 U223 ( .A(n198), .B(n199), .Y(n197) );
  NAND2X1 U224 ( .A(dataIn[5]), .B(dataIn[4]), .Y(n199) );
  NAND3X1 U225 ( .A(dataIn[2]), .B(dataIn[1]), .C(dataIn[3]), .Y(n198) );
  NOR2X1 U226 ( .A(n200), .B(n201), .Y(n196) );
  NOR2X1 U227 ( .A(n202), .B(n203), .Y(n195) );
  NAND3X1 U228 ( .A(n204), .B(n205), .C(n206), .Y(n191) );
  NOR2X1 U229 ( .A(n207), .B(n208), .Y(n206) );
  NAND2X1 U230 ( .A(dataIn[0]), .B(n209), .Y(n208) );
  NAND3X1 U231 ( .A(dataIn[10]), .B(n210), .C(dataIn[11]), .Y(n207) );
  NOR2X1 U232 ( .A(n211), .B(n212), .Y(n205) );
  NOR2X1 U233 ( .A(n213), .B(n214), .Y(n204) );
  OAI22X1 U234 ( .A(n215), .B(n210), .C(n194), .D(n216), .Y(n185) );
  NAND3X1 U235 ( .A(n217), .B(n218), .C(n219), .Y(n194) );
  NOR2X1 U236 ( .A(n220), .B(n221), .Y(n219) );
  NAND3X1 U237 ( .A(n209), .B(n222), .C(n223), .Y(n221) );
  NOR2X1 U238 ( .A(dataIn[11]), .B(dataIn[10]), .Y(n223) );
  AND2X1 U239 ( .A(n224), .B(n225), .Y(n209) );
  NOR2X1 U240 ( .A(n226), .B(n227), .Y(n225) );
  NAND3X1 U241 ( .A(n228), .B(n229), .C(n230), .Y(n227) );
  NOR2X1 U242 ( .A(dataIn[27]), .B(dataIn[26]), .Y(n230) );
  INVX1 U243 ( .A(dataIn[25]), .Y(n229) );
  INVX1 U244 ( .A(dataIn[24]), .Y(n228) );
  NAND3X1 U245 ( .A(n231), .B(n232), .C(n233), .Y(n226) );
  NOR2X1 U246 ( .A(dataIn[31]), .B(dataIn[30]), .Y(n233) );
  INVX1 U247 ( .A(dataIn[29]), .Y(n232) );
  INVX1 U248 ( .A(dataIn[28]), .Y(n231) );
  NOR2X1 U249 ( .A(n234), .B(n235), .Y(n224) );
  NAND3X1 U250 ( .A(dataIn[16]), .B(n236), .C(n237), .Y(n235) );
  NOR2X1 U251 ( .A(dataIn[19]), .B(dataIn[18]), .Y(n237) );
  INVX1 U252 ( .A(dataIn[17]), .Y(n236) );
  NAND3X1 U253 ( .A(n238), .B(n239), .C(n240), .Y(n234) );
  NOR2X1 U254 ( .A(dataIn[23]), .B(dataIn[22]), .Y(n240) );
  INVX1 U255 ( .A(dataIn[21]), .Y(n239) );
  INVX1 U256 ( .A(dataIn[20]), .Y(n238) );
  NAND3X1 U257 ( .A(n211), .B(n212), .C(n241), .Y(n220) );
  NOR2X1 U258 ( .A(dataIn[15]), .B(dataIn[14]), .Y(n241) );
  NOR2X1 U259 ( .A(n242), .B(n243), .Y(n218) );
  NAND2X1 U260 ( .A(n244), .B(n200), .Y(n243) );
  NAND3X1 U261 ( .A(n202), .B(n203), .C(n201), .Y(n242) );
  NOR2X1 U262 ( .A(n245), .B(n246), .Y(n217) );
  NAND2X1 U263 ( .A(n247), .B(n248), .Y(n246) );
  NAND2X1 U264 ( .A(n249), .B(n250), .Y(n245) );
  INVX1 U265 ( .A(n251), .Y(n184) );
  MUX2X1 U266 ( .B(dataIn[31]), .A(slave_writedata[31]), .S(n188), .Y(n251) );
  INVX1 U267 ( .A(n252), .Y(n182) );
  MUX2X1 U268 ( .B(dataIn[30]), .A(slave_writedata[30]), .S(n188), .Y(n252) );
  INVX1 U269 ( .A(n253), .Y(n180) );
  MUX2X1 U270 ( .B(dataIn[29]), .A(slave_writedata[29]), .S(n188), .Y(n253) );
  INVX1 U271 ( .A(n254), .Y(n178) );
  MUX2X1 U272 ( .B(dataIn[28]), .A(slave_writedata[28]), .S(n188), .Y(n254) );
  INVX1 U273 ( .A(n255), .Y(n176) );
  MUX2X1 U274 ( .B(dataIn[27]), .A(slave_writedata[27]), .S(n188), .Y(n255) );
  INVX1 U275 ( .A(n256), .Y(n174) );
  MUX2X1 U276 ( .B(dataIn[26]), .A(slave_writedata[26]), .S(n188), .Y(n256) );
  INVX1 U277 ( .A(n257), .Y(n172) );
  MUX2X1 U278 ( .B(dataIn[25]), .A(slave_writedata[25]), .S(n188), .Y(n257) );
  INVX1 U279 ( .A(n258), .Y(n170) );
  MUX2X1 U280 ( .B(dataIn[24]), .A(slave_writedata[24]), .S(n188), .Y(n258) );
  INVX1 U281 ( .A(n259), .Y(n168) );
  MUX2X1 U282 ( .B(dataIn[23]), .A(slave_writedata[23]), .S(n188), .Y(n259) );
  INVX1 U283 ( .A(n260), .Y(n166) );
  MUX2X1 U284 ( .B(dataIn[22]), .A(slave_writedata[22]), .S(n188), .Y(n260) );
  INVX1 U285 ( .A(n261), .Y(n164) );
  MUX2X1 U286 ( .B(dataIn[21]), .A(slave_writedata[21]), .S(n188), .Y(n261) );
  INVX1 U287 ( .A(n262), .Y(n162) );
  MUX2X1 U288 ( .B(dataIn[20]), .A(slave_writedata[20]), .S(n188), .Y(n262) );
  INVX1 U289 ( .A(n263), .Y(n160) );
  MUX2X1 U290 ( .B(dataIn[19]), .A(slave_writedata[19]), .S(n188), .Y(n263) );
  INVX1 U291 ( .A(n264), .Y(n158) );
  MUX2X1 U292 ( .B(dataIn[18]), .A(slave_writedata[18]), .S(n188), .Y(n264) );
  INVX1 U293 ( .A(n265), .Y(n156) );
  MUX2X1 U294 ( .B(dataIn[17]), .A(slave_writedata[17]), .S(n188), .Y(n265) );
  INVX1 U295 ( .A(n266), .Y(n154) );
  MUX2X1 U296 ( .B(dataIn[16]), .A(slave_writedata[16]), .S(n188), .Y(n266) );
  MUX2X1 U297 ( .B(n214), .A(n267), .S(n188), .Y(n152) );
  INVX1 U298 ( .A(dataIn[15]), .Y(n214) );
  MUX2X1 U299 ( .B(n213), .A(n268), .S(n188), .Y(n150) );
  INVX1 U300 ( .A(dataIn[14]), .Y(n213) );
  MUX2X1 U301 ( .B(n212), .A(n269), .S(n188), .Y(n148) );
  INVX1 U302 ( .A(dataIn[13]), .Y(n212) );
  MUX2X1 U303 ( .B(n211), .A(n270), .S(n188), .Y(n146) );
  INVX1 U304 ( .A(dataIn[12]), .Y(n211) );
  MUX2X1 U305 ( .B(n203), .A(n271), .S(n188), .Y(n140) );
  INVX1 U306 ( .A(dataIn[9]), .Y(n203) );
  MUX2X1 U307 ( .B(n202), .A(n272), .S(n188), .Y(n138) );
  INVX1 U308 ( .A(dataIn[8]), .Y(n202) );
  MUX2X1 U309 ( .B(n201), .A(n273), .S(n188), .Y(n136) );
  INVX1 U310 ( .A(dataIn[7]), .Y(n201) );
  MUX2X1 U311 ( .B(n200), .A(n274), .S(n188), .Y(n134) );
  INVX1 U312 ( .A(dataIn[6]), .Y(n200) );
  MUX2X1 U313 ( .B(n244), .A(n275), .S(n188), .Y(n132) );
  INVX1 U314 ( .A(dataIn[5]), .Y(n244) );
  MUX2X1 U315 ( .B(n250), .A(n276), .S(n188), .Y(n130) );
  INVX1 U316 ( .A(dataIn[4]), .Y(n250) );
  MUX2X1 U317 ( .B(n249), .A(n277), .S(n188), .Y(n128) );
  INVX1 U318 ( .A(dataIn[3]), .Y(n249) );
  MUX2X1 U319 ( .B(n248), .A(n278), .S(n188), .Y(n126) );
  INVX1 U320 ( .A(dataIn[2]), .Y(n248) );
  MUX2X1 U321 ( .B(n247), .A(n279), .S(n188), .Y(n124) );
  INVX1 U322 ( .A(dataIn[1]), .Y(n247) );
  MUX2X1 U323 ( .B(n222), .A(n280), .S(n188), .Y(n122) );
  INVX1 U324 ( .A(dataIn[0]), .Y(n222) );
  NOR2X1 U325 ( .A(state[0]), .B(n210), .Y(fft_start) );
  INVX1 U326 ( .A(state[1]), .Y(n210) );
  NOR2X1 U327 ( .A(n216), .B(n271), .Y(fft_init_data[9]) );
  INVX1 U328 ( .A(slave_writedata[9]), .Y(n271) );
  NOR2X1 U329 ( .A(n216), .B(n272), .Y(fft_init_data[8]) );
  INVX1 U330 ( .A(slave_writedata[8]), .Y(n272) );
  NOR2X1 U331 ( .A(n216), .B(n273), .Y(fft_init_data[7]) );
  INVX1 U332 ( .A(slave_writedata[7]), .Y(n273) );
  NOR2X1 U333 ( .A(n216), .B(n274), .Y(fft_init_data[6]) );
  INVX1 U334 ( .A(slave_writedata[6]), .Y(n274) );
  NOR2X1 U335 ( .A(n216), .B(n275), .Y(fft_init_data[5]) );
  INVX1 U336 ( .A(slave_writedata[5]), .Y(n275) );
  NOR2X1 U337 ( .A(n216), .B(n276), .Y(fft_init_data[4]) );
  INVX1 U338 ( .A(slave_writedata[4]), .Y(n276) );
  NOR2X1 U339 ( .A(n216), .B(n277), .Y(fft_init_data[3]) );
  INVX1 U340 ( .A(slave_writedata[3]), .Y(n277) );
  NOR2X1 U341 ( .A(n216), .B(n278), .Y(fft_init_data[2]) );
  INVX1 U342 ( .A(slave_writedata[2]), .Y(n278) );
  NOR2X1 U343 ( .A(n216), .B(n279), .Y(fft_init_data[1]) );
  INVX1 U344 ( .A(slave_writedata[1]), .Y(n279) );
  NOR2X1 U345 ( .A(n216), .B(n267), .Y(fft_init_data[15]) );
  INVX1 U346 ( .A(slave_writedata[15]), .Y(n267) );
  NOR2X1 U347 ( .A(n216), .B(n268), .Y(fft_init_data[14]) );
  INVX1 U348 ( .A(slave_writedata[14]), .Y(n268) );
  NOR2X1 U349 ( .A(n216), .B(n269), .Y(fft_init_data[13]) );
  INVX1 U350 ( .A(slave_writedata[13]), .Y(n269) );
  NOR2X1 U351 ( .A(n216), .B(n270), .Y(fft_init_data[12]) );
  INVX1 U352 ( .A(slave_writedata[12]), .Y(n270) );
  AND2X1 U353 ( .A(slave_writedata[11]), .B(n109), .Y(fft_init_data[11]) );
  AND2X1 U354 ( .A(slave_writedata[10]), .B(n109), .Y(fft_init_data[10]) );
  NOR2X1 U355 ( .A(n216), .B(n280), .Y(fft_init_data[0]) );
  INVX1 U356 ( .A(slave_writedata[0]), .Y(n280) );
  INVX1 U357 ( .A(n109), .Y(n216) );
  NOR2X1 U358 ( .A(n215), .B(state[1]), .Y(n109) );
  INVX1 U359 ( .A(state[0]), .Y(n215) );
endmodule

