/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Nov 26 16:46:19 2016
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS9_DW01_inc_0 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[8]), .B(A[8]), .Y(SUM[8]) );
endmodule


module flex_counter_NUM_CNT_BITS9 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [8:0] rollover_val;
  output [8:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110;

  DFFSR \count_out_reg[0]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR rollover_flag_reg ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS9_DW01_inc_0 add_52_aco ( .A({N37, N36, N35, N34, 
        N33, N32, N31, N30, N29}), .SUM({N14, N13, N12, N11, N10, N9, N8, N7, 
        N6}) );
  OAI21X1 U6 ( .A(n1), .B(n2), .C(n3), .Y(n70) );
  NAND2X1 U7 ( .A(N6), .B(n4), .Y(n3) );
  OAI21X1 U8 ( .A(n1), .B(n5), .C(n6), .Y(n69) );
  NAND2X1 U16 ( .A(N7), .B(n4), .Y(n6) );
  OAI21X1 U17 ( .A(n1), .B(n7), .C(n8), .Y(n68) );
  NAND2X1 U18 ( .A(N8), .B(n4), .Y(n8) );
  OAI21X1 U19 ( .A(n1), .B(n9), .C(n10), .Y(n67) );
  NAND2X1 U20 ( .A(N9), .B(n4), .Y(n10) );
  OAI21X1 U21 ( .A(n1), .B(n21), .C(n22), .Y(n66) );
  NAND2X1 U22 ( .A(N10), .B(n4), .Y(n22) );
  OAI21X1 U23 ( .A(n1), .B(n23), .C(n24), .Y(n65) );
  NAND2X1 U24 ( .A(N11), .B(n4), .Y(n24) );
  OAI21X1 U25 ( .A(n1), .B(n25), .C(n26), .Y(n64) );
  NAND2X1 U26 ( .A(N12), .B(n4), .Y(n26) );
  OAI21X1 U27 ( .A(n1), .B(n27), .C(n28), .Y(n63) );
  NAND2X1 U28 ( .A(N13), .B(n4), .Y(n28) );
  OAI21X1 U29 ( .A(n1), .B(n29), .C(n30), .Y(n62) );
  NAND2X1 U30 ( .A(N14), .B(n4), .Y(n30) );
  INVX1 U31 ( .A(n31), .Y(n1) );
  OAI21X1 U32 ( .A(n32), .B(n33), .C(n34), .Y(n61) );
  NAND2X1 U33 ( .A(rollover_flag), .B(n31), .Y(n34) );
  NAND3X1 U34 ( .A(n35), .B(n36), .C(n37), .Y(n33) );
  NOR2X1 U35 ( .A(n38), .B(n39), .Y(n37) );
  MUX2X1 U36 ( .B(n40), .A(n41), .S(n42), .Y(n39) );
  NOR2X1 U37 ( .A(n43), .B(n5), .Y(n41) );
  XOR2X1 U38 ( .A(n7), .B(rollover_val[2]), .Y(n43) );
  NOR2X1 U39 ( .A(n44), .B(n45), .Y(n40) );
  OAI21X1 U40 ( .A(rollover_val[0]), .B(n5), .C(n46), .Y(n45) );
  INVX1 U41 ( .A(n47), .Y(n46) );
  XOR2X1 U42 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n44) );
  MUX2X1 U43 ( .B(count_out[0]), .A(n48), .S(rollover_val[0]), .Y(n38) );
  AOI21X1 U44 ( .A(rollover_val[1]), .B(n5), .C(count_out[0]), .Y(n48) );
  MUX2X1 U45 ( .B(n49), .A(n50), .S(n51), .Y(n36) );
  NAND2X1 U46 ( .A(n52), .B(count_out[6]), .Y(n50) );
  MUX2X1 U47 ( .B(n53), .A(count_out[7]), .S(rollover_val[7]), .Y(n52) );
  NAND2X1 U48 ( .A(rollover_val[8]), .B(count_out[7]), .Y(n53) );
  OAI21X1 U49 ( .A(n54), .B(n25), .C(n55), .Y(n49) );
  XOR2X1 U50 ( .A(n56), .B(count_out[7]), .Y(n55) );
  NOR2X1 U51 ( .A(n57), .B(n58), .Y(n54) );
  NOR2X1 U52 ( .A(n59), .B(n60), .Y(n35) );
  MUX2X1 U53 ( .B(n71), .A(n72), .S(rollover_val[4]), .Y(n60) );
  XOR2X1 U54 ( .A(n21), .B(n73), .Y(n72) );
  NAND2X1 U55 ( .A(count_out[4]), .B(n73), .Y(n71) );
  XOR2X1 U56 ( .A(n74), .B(n75), .Y(n59) );
  XOR2X1 U57 ( .A(n29), .B(rollover_val[8]), .Y(n75) );
  NAND2X1 U58 ( .A(n51), .B(n56), .Y(n74) );
  INVX1 U59 ( .A(rollover_val[7]), .Y(n56) );
  NOR2X1 U60 ( .A(n76), .B(rollover_val[6]), .Y(n51) );
  NAND3X1 U61 ( .A(n77), .B(n78), .C(n79), .Y(n32) );
  AOI21X1 U62 ( .A(n80), .B(n21), .C(n81), .Y(n79) );
  INVX1 U63 ( .A(n4), .Y(n81) );
  NOR2X1 U64 ( .A(n31), .B(clear), .Y(n4) );
  NOR2X1 U65 ( .A(count_enable), .B(clear), .Y(n31) );
  XOR2X1 U66 ( .A(n23), .B(n82), .Y(n78) );
  OAI21X1 U67 ( .A(n80), .B(n83), .C(n76), .Y(n82) );
  AOI21X1 U68 ( .A(n84), .B(rollover_val[6]), .C(n85), .Y(n77) );
  XOR2X1 U69 ( .A(n86), .B(count_out[3]), .Y(n85) );
  NAND2X1 U70 ( .A(n87), .B(n73), .Y(n86) );
  OAI21X1 U71 ( .A(rollover_val[2]), .B(n88), .C(rollover_val[3]), .Y(n87) );
  INVX1 U72 ( .A(n42), .Y(n88) );
  NOR2X1 U73 ( .A(count_out[6]), .B(n57), .Y(n84) );
  INVX1 U74 ( .A(n76), .Y(n57) );
  NAND2X1 U75 ( .A(n80), .B(n83), .Y(n76) );
  INVX1 U76 ( .A(rollover_val[5]), .Y(n83) );
  NOR2X1 U77 ( .A(n73), .B(rollover_val[4]), .Y(n80) );
  NAND3X1 U78 ( .A(n89), .B(n90), .C(n42), .Y(n73) );
  NOR2X1 U79 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n42) );
  INVX1 U80 ( .A(rollover_val[3]), .Y(n90) );
  NOR2X1 U81 ( .A(n29), .B(n91), .Y(N37) );
  NOR2X1 U82 ( .A(n27), .B(n91), .Y(N36) );
  NOR2X1 U83 ( .A(n25), .B(n91), .Y(N35) );
  NOR2X1 U84 ( .A(n23), .B(n91), .Y(N34) );
  NOR2X1 U85 ( .A(n21), .B(n91), .Y(N33) );
  NOR2X1 U86 ( .A(n9), .B(n91), .Y(N32) );
  NOR2X1 U87 ( .A(n7), .B(n91), .Y(N31) );
  NOR2X1 U88 ( .A(n5), .B(n91), .Y(N30) );
  NOR2X1 U89 ( .A(n2), .B(n91), .Y(N29) );
  OAI21X1 U90 ( .A(rollover_val[8]), .B(n29), .C(n92), .Y(n91) );
  OAI21X1 U91 ( .A(count_out[8]), .B(n93), .C(n94), .Y(n92) );
  AOI22X1 U92 ( .A(rollover_val[7]), .B(n95), .C(n96), .D(n27), .Y(n94) );
  INVX1 U93 ( .A(count_out[7]), .Y(n27) );
  INVX1 U94 ( .A(n97), .Y(n96) );
  NAND2X1 U95 ( .A(count_out[7]), .B(n97), .Y(n95) );
  OAI21X1 U96 ( .A(rollover_val[6]), .B(n25), .C(n98), .Y(n97) );
  OAI21X1 U97 ( .A(count_out[6]), .B(n58), .C(n99), .Y(n98) );
  AOI22X1 U98 ( .A(rollover_val[5]), .B(n100), .C(n101), .D(n23), .Y(n99) );
  INVX1 U99 ( .A(count_out[5]), .Y(n23) );
  INVX1 U100 ( .A(n102), .Y(n101) );
  NAND2X1 U101 ( .A(count_out[5]), .B(n102), .Y(n100) );
  OAI22X1 U102 ( .A(n103), .B(n104), .C(rollover_val[4]), .D(n21), .Y(n102) );
  OAI21X1 U103 ( .A(count_out[3]), .B(n105), .C(n106), .Y(n104) );
  OAI21X1 U104 ( .A(n107), .B(n9), .C(rollover_val[3]), .Y(n106) );
  INVX1 U105 ( .A(count_out[3]), .Y(n9) );
  INVX1 U106 ( .A(n105), .Y(n107) );
  OAI21X1 U107 ( .A(rollover_val[2]), .B(n7), .C(n108), .Y(n105) );
  OAI21X1 U108 ( .A(count_out[2]), .B(n89), .C(n109), .Y(n108) );
  AOI22X1 U109 ( .A(n110), .B(rollover_val[0]), .C(rollover_val[1]), .D(n5), 
        .Y(n109) );
  NOR2X1 U110 ( .A(count_out[0]), .B(n47), .Y(n110) );
  NOR2X1 U111 ( .A(n5), .B(rollover_val[1]), .Y(n47) );
  INVX1 U112 ( .A(count_out[1]), .Y(n5) );
  INVX1 U113 ( .A(rollover_val[2]), .Y(n89) );
  INVX1 U114 ( .A(count_out[2]), .Y(n7) );
  AND2X1 U115 ( .A(n21), .B(rollover_val[4]), .Y(n103) );
  INVX1 U116 ( .A(count_out[4]), .Y(n21) );
  INVX1 U117 ( .A(rollover_val[6]), .Y(n58) );
  INVX1 U118 ( .A(count_out[6]), .Y(n25) );
  INVX1 U119 ( .A(rollover_val[8]), .Y(n93) );
  INVX1 U120 ( .A(count_out[8]), .Y(n29) );
  INVX1 U121 ( .A(count_out[0]), .Y(n2) );
endmodule


module avalonSlave ( clk, n_rst, slave_read, slave_write, slave_address, 
        slave_writedata, slave_chipselect, fft_init_data, wAddress, fft_start, 
        sWriteEn );
  input [8:0] slave_address;
  input [15:0] slave_writedata;
  output [15:0] fft_init_data;
  output [8:0] wAddress;
  input clk, n_rst, slave_read, slave_write, slave_chipselect;
  output fft_start, sWriteEn;
  wire   n70, n71, n72, n73, n74, n75, n76, n77, n78, n94, n96, n98, n100,
         n106, n108, n110, n112, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198;
  wire   [8:0] ldCnt;
  wire   [31:0] state;
  wire   [15:0] dataIn;
  wire   [8:0] prev_address;
  wire   [31:0] nextstate;
  tri   [8:0] wAddress;
  tri   sWriteEn;

  DFFSR \prev_address_reg[8]  ( .D(slave_address[8]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[8]) );
  DFFSR \prev_address_reg[7]  ( .D(slave_address[7]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[7]) );
  DFFSR \prev_address_reg[6]  ( .D(slave_address[6]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[6]) );
  DFFSR \prev_address_reg[5]  ( .D(slave_address[5]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[5]) );
  DFFSR \prev_address_reg[4]  ( .D(slave_address[4]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[4]) );
  DFFSR \prev_address_reg[3]  ( .D(slave_address[3]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[3]) );
  DFFSR \prev_address_reg[2]  ( .D(slave_address[2]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[2]) );
  DFFSR \prev_address_reg[1]  ( .D(slave_address[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[1]) );
  DFFSR \prev_address_reg[0]  ( .D(slave_address[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prev_address[0]) );
  DFFSR \dataIn_reg[15]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[15]) );
  DFFSR \dataIn_reg[14]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[14]) );
  DFFSR \dataIn_reg[13]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[13]) );
  DFFSR \dataIn_reg[12]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[12]) );
  DFFSR \dataIn_reg[11]  ( .D(n198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[11]) );
  DFFSR \dataIn_reg[10]  ( .D(n197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[10]) );
  DFFSR \dataIn_reg[9]  ( .D(n100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[9]) );
  DFFSR \dataIn_reg[8]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[8]) );
  DFFSR \dataIn_reg[7]  ( .D(n96), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[7]) );
  DFFSR \dataIn_reg[6]  ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[6]) );
  DFFSR \dataIn_reg[5]  ( .D(n196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[5]) );
  DFFSR \dataIn_reg[4]  ( .D(n195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[4]) );
  DFFSR \dataIn_reg[3]  ( .D(n194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[3]) );
  DFFSR \dataIn_reg[2]  ( .D(n193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[2]) );
  DFFSR \dataIn_reg[1]  ( .D(n192), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[1]) );
  DFFSR \dataIn_reg[0]  ( .D(n191), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        dataIn[0]) );
  DFFSR \state_reg[1]  ( .D(nextstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[0]  ( .D(nextstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  flex_counter_NUM_CNT_BITS9 samNum ( .clk(clk), .n_rst(n_rst), .clear(n122), 
        .count_enable(n123), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .count_out(ldCnt), .rollover_flag(fft_start) );
  TBUFX1 \wAddress_tri[0]  ( .A(n78), .EN(state[0]), .Y(wAddress[0]) );
  TBUFX1 \wAddress_tri[1]  ( .A(n77), .EN(state[0]), .Y(wAddress[1]) );
  TBUFX1 \wAddress_tri[2]  ( .A(n76), .EN(state[0]), .Y(wAddress[2]) );
  TBUFX1 \wAddress_tri[3]  ( .A(n75), .EN(state[0]), .Y(wAddress[3]) );
  TBUFX1 \wAddress_tri[4]  ( .A(n74), .EN(state[0]), .Y(wAddress[4]) );
  TBUFX1 \wAddress_tri[5]  ( .A(n73), .EN(state[0]), .Y(wAddress[5]) );
  TBUFX1 \wAddress_tri[6]  ( .A(n72), .EN(state[0]), .Y(wAddress[6]) );
  TBUFX1 \wAddress_tri[7]  ( .A(n71), .EN(state[0]), .Y(wAddress[7]) );
  TBUFX1 \wAddress_tri[8]  ( .A(n70), .EN(state[0]), .Y(wAddress[8]) );
  TBUFX1 sWriteEn_tri ( .A(1'b0), .EN(state[0]), .Y(sWriteEn) );
  INVX2 U141 ( .A(n128), .Y(n124) );
  AND2X2 U142 ( .A(slave_write), .B(slave_chipselect), .Y(n175) );
  NOR2X1 U143 ( .A(state[1]), .B(n125), .Y(nextstate[1]) );
  MUX2X1 U144 ( .B(n126), .A(n127), .S(n128), .Y(n125) );
  AND2X1 U145 ( .A(n129), .B(n130), .Y(n127) );
  NOR2X1 U146 ( .A(n131), .B(n132), .Y(n130) );
  NAND3X1 U147 ( .A(dataIn[1]), .B(dataIn[15]), .C(n133), .Y(n132) );
  NOR2X1 U148 ( .A(n134), .B(n135), .Y(n133) );
  NAND3X1 U149 ( .A(dataIn[12]), .B(dataIn[11]), .C(n136), .Y(n131) );
  NOR2X1 U150 ( .A(n137), .B(n138), .Y(n136) );
  NOR2X1 U151 ( .A(n139), .B(n140), .Y(n129) );
  NAND3X1 U152 ( .A(dataIn[9]), .B(dataIn[8]), .C(n141), .Y(n140) );
  NOR2X1 U153 ( .A(n142), .B(n143), .Y(n141) );
  NAND3X1 U154 ( .A(dataIn[5]), .B(dataIn[4]), .C(n144), .Y(n139) );
  NOR2X1 U155 ( .A(n145), .B(n146), .Y(n144) );
  OR2X1 U156 ( .A(n147), .B(n148), .Y(n126) );
  OAI21X1 U157 ( .A(n128), .B(n149), .C(n150), .Y(nextstate[0]) );
  INVX1 U158 ( .A(n123), .Y(n150) );
  OAI21X1 U159 ( .A(n151), .B(n148), .C(n152), .Y(n149) );
  NOR2X1 U160 ( .A(n153), .B(n154), .Y(n148) );
  NAND3X1 U161 ( .A(ldCnt[8]), .B(n155), .C(n156), .Y(n154) );
  NOR2X1 U162 ( .A(ldCnt[2]), .B(ldCnt[1]), .Y(n156) );
  INVX1 U163 ( .A(ldCnt[0]), .Y(n155) );
  NAND3X1 U164 ( .A(n157), .B(n158), .C(n159), .Y(n153) );
  NOR2X1 U165 ( .A(ldCnt[4]), .B(ldCnt[3]), .Y(n159) );
  INVX1 U166 ( .A(ldCnt[5]), .Y(n158) );
  NOR2X1 U167 ( .A(ldCnt[7]), .B(ldCnt[6]), .Y(n157) );
  INVX1 U168 ( .A(n147), .Y(n151) );
  NAND3X1 U169 ( .A(n160), .B(n161), .C(n162), .Y(n147) );
  NOR2X1 U170 ( .A(n163), .B(n164), .Y(n162) );
  NAND2X1 U171 ( .A(n165), .B(n166), .Y(n164) );
  XNOR2X1 U172 ( .A(prev_address[3]), .B(slave_address[3]), .Y(n166) );
  XNOR2X1 U173 ( .A(prev_address[4]), .B(slave_address[4]), .Y(n165) );
  NAND3X1 U174 ( .A(n167), .B(n168), .C(n169), .Y(n163) );
  XNOR2X1 U175 ( .A(prev_address[1]), .B(slave_address[1]), .Y(n169) );
  XNOR2X1 U176 ( .A(prev_address[2]), .B(slave_address[2]), .Y(n168) );
  XNOR2X1 U177 ( .A(prev_address[0]), .B(slave_address[0]), .Y(n167) );
  NOR2X1 U178 ( .A(n170), .B(n171), .Y(n161) );
  XOR2X1 U179 ( .A(slave_address[6]), .B(prev_address[6]), .Y(n171) );
  XOR2X1 U180 ( .A(slave_address[5]), .B(prev_address[5]), .Y(n170) );
  NOR2X1 U181 ( .A(n172), .B(n173), .Y(n160) );
  XOR2X1 U182 ( .A(slave_address[8]), .B(prev_address[8]), .Y(n173) );
  XOR2X1 U183 ( .A(slave_address[7]), .B(prev_address[7]), .Y(n172) );
  MUX2X1 U184 ( .B(n137), .A(n174), .S(n175), .Y(n191) );
  INVX1 U185 ( .A(dataIn[0]), .Y(n137) );
  INVX1 U186 ( .A(n176), .Y(n192) );
  MUX2X1 U187 ( .B(dataIn[1]), .A(slave_writedata[1]), .S(n175), .Y(n176) );
  MUX2X1 U188 ( .B(n145), .A(n177), .S(n175), .Y(n193) );
  INVX1 U189 ( .A(dataIn[2]), .Y(n145) );
  MUX2X1 U190 ( .B(n146), .A(n178), .S(n175), .Y(n194) );
  INVX1 U191 ( .A(dataIn[3]), .Y(n146) );
  INVX1 U192 ( .A(n179), .Y(n195) );
  MUX2X1 U193 ( .B(dataIn[4]), .A(slave_writedata[4]), .S(n175), .Y(n179) );
  INVX1 U194 ( .A(n180), .Y(n196) );
  MUX2X1 U195 ( .B(dataIn[5]), .A(slave_writedata[5]), .S(n175), .Y(n180) );
  MUX2X1 U196 ( .B(n138), .A(n181), .S(n175), .Y(n197) );
  INVX1 U197 ( .A(dataIn[10]), .Y(n138) );
  INVX1 U198 ( .A(n182), .Y(n198) );
  MUX2X1 U199 ( .B(dataIn[11]), .A(slave_writedata[11]), .S(n175), .Y(n182) );
  INVX1 U200 ( .A(n183), .Y(n98) );
  MUX2X1 U201 ( .B(dataIn[8]), .A(slave_writedata[8]), .S(n175), .Y(n183) );
  MUX2X1 U202 ( .B(n143), .A(n184), .S(n175), .Y(n96) );
  INVX1 U203 ( .A(dataIn[7]), .Y(n143) );
  MUX2X1 U204 ( .B(n142), .A(n185), .S(n175), .Y(n94) );
  INVX1 U205 ( .A(dataIn[6]), .Y(n142) );
  MUX2X1 U206 ( .B(prev_address[0]), .A(slave_address[0]), .S(n152), .Y(n78)
         );
  MUX2X1 U207 ( .B(prev_address[1]), .A(slave_address[1]), .S(n152), .Y(n77)
         );
  MUX2X1 U208 ( .B(prev_address[2]), .A(slave_address[2]), .S(n152), .Y(n76)
         );
  MUX2X1 U209 ( .B(prev_address[3]), .A(slave_address[3]), .S(n152), .Y(n75)
         );
  MUX2X1 U210 ( .B(prev_address[4]), .A(slave_address[4]), .S(n152), .Y(n74)
         );
  MUX2X1 U211 ( .B(prev_address[5]), .A(slave_address[5]), .S(n152), .Y(n73)
         );
  MUX2X1 U212 ( .B(prev_address[6]), .A(slave_address[6]), .S(n152), .Y(n72)
         );
  MUX2X1 U213 ( .B(prev_address[7]), .A(slave_address[7]), .S(n152), .Y(n71)
         );
  MUX2X1 U214 ( .B(prev_address[8]), .A(slave_address[8]), .S(n152), .Y(n70)
         );
  NOR2X1 U215 ( .A(n152), .B(state[0]), .Y(n123) );
  NOR2X1 U216 ( .A(n128), .B(n152), .Y(n122) );
  INVX1 U217 ( .A(state[1]), .Y(n152) );
  INVX1 U218 ( .A(n186), .Y(n112) );
  MUX2X1 U219 ( .B(dataIn[15]), .A(slave_writedata[15]), .S(n175), .Y(n186) );
  MUX2X1 U220 ( .B(n135), .A(n187), .S(n175), .Y(n110) );
  INVX1 U221 ( .A(dataIn[14]), .Y(n135) );
  MUX2X1 U222 ( .B(n134), .A(n188), .S(n175), .Y(n108) );
  INVX1 U223 ( .A(dataIn[13]), .Y(n134) );
  INVX1 U224 ( .A(n189), .Y(n106) );
  MUX2X1 U225 ( .B(dataIn[12]), .A(slave_writedata[12]), .S(n175), .Y(n189) );
  INVX1 U226 ( .A(n190), .Y(n100) );
  MUX2X1 U227 ( .B(dataIn[9]), .A(slave_writedata[9]), .S(n175), .Y(n190) );
  AND2X1 U228 ( .A(state[0]), .B(slave_writedata[9]), .Y(fft_init_data[9]) );
  AND2X1 U229 ( .A(state[0]), .B(slave_writedata[8]), .Y(fft_init_data[8]) );
  NOR2X1 U230 ( .A(n128), .B(n184), .Y(fft_init_data[7]) );
  INVX1 U231 ( .A(slave_writedata[7]), .Y(n184) );
  NOR2X1 U232 ( .A(n128), .B(n185), .Y(fft_init_data[6]) );
  INVX1 U233 ( .A(slave_writedata[6]), .Y(n185) );
  AND2X1 U234 ( .A(state[0]), .B(slave_writedata[5]), .Y(fft_init_data[5]) );
  AND2X1 U235 ( .A(state[0]), .B(slave_writedata[4]), .Y(fft_init_data[4]) );
  NOR2X1 U236 ( .A(n128), .B(n178), .Y(fft_init_data[3]) );
  INVX1 U237 ( .A(slave_writedata[3]), .Y(n178) );
  NOR2X1 U238 ( .A(n128), .B(n177), .Y(fft_init_data[2]) );
  INVX1 U239 ( .A(slave_writedata[2]), .Y(n177) );
  AND2X1 U240 ( .A(state[0]), .B(slave_writedata[1]), .Y(fft_init_data[1]) );
  AND2X1 U241 ( .A(state[0]), .B(slave_writedata[15]), .Y(fft_init_data[15])
         );
  NOR2X1 U242 ( .A(n128), .B(n187), .Y(fft_init_data[14]) );
  INVX1 U243 ( .A(slave_writedata[14]), .Y(n187) );
  NOR2X1 U244 ( .A(n128), .B(n188), .Y(fft_init_data[13]) );
  INVX1 U245 ( .A(slave_writedata[13]), .Y(n188) );
  AND2X1 U246 ( .A(n124), .B(slave_writedata[12]), .Y(fft_init_data[12]) );
  AND2X1 U247 ( .A(n124), .B(slave_writedata[11]), .Y(fft_init_data[11]) );
  NOR2X1 U248 ( .A(n128), .B(n181), .Y(fft_init_data[10]) );
  INVX1 U249 ( .A(slave_writedata[10]), .Y(n181) );
  NOR2X1 U250 ( .A(n128), .B(n174), .Y(fft_init_data[0]) );
  INVX1 U251 ( .A(slave_writedata[0]), .Y(n174) );
  INVX1 U252 ( .A(state[0]), .Y(n128) );
endmodule

