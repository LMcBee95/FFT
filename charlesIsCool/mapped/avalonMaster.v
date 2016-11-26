/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Nov 26 17:06:44 2016
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N31, N32, N33, N34, N35,
         N36, N37, N38, N39, N40, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122;

  DFFSR \count_out_reg[0]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_52_aco ( .A({N40, N39, N38, N37, 
        N36, N35, N34, N33, N32, N31}), .SUM({N15, N14, N13, N12, N11, N10, N9, 
        N8, N7, N6}) );
  OAI21X1 U6 ( .A(n1), .B(n2), .C(n3), .Y(n75) );
  NAND2X1 U7 ( .A(N6), .B(n4), .Y(n3) );
  OAI21X1 U8 ( .A(n1), .B(n5), .C(n6), .Y(n74) );
  NAND2X1 U17 ( .A(N7), .B(n4), .Y(n6) );
  OAI21X1 U18 ( .A(n1), .B(n7), .C(n8), .Y(n73) );
  NAND2X1 U19 ( .A(N8), .B(n4), .Y(n8) );
  OAI21X1 U20 ( .A(n1), .B(n9), .C(n10), .Y(n72) );
  NAND2X1 U21 ( .A(N9), .B(n4), .Y(n10) );
  OAI21X1 U22 ( .A(n1), .B(n22), .C(n23), .Y(n71) );
  NAND2X1 U23 ( .A(N10), .B(n4), .Y(n23) );
  OAI21X1 U24 ( .A(n1), .B(n24), .C(n25), .Y(n70) );
  NAND2X1 U25 ( .A(N11), .B(n4), .Y(n25) );
  OAI21X1 U26 ( .A(n1), .B(n26), .C(n27), .Y(n69) );
  NAND2X1 U27 ( .A(N12), .B(n4), .Y(n27) );
  OAI21X1 U28 ( .A(n1), .B(n28), .C(n29), .Y(n68) );
  NAND2X1 U29 ( .A(N13), .B(n4), .Y(n29) );
  OAI21X1 U30 ( .A(n1), .B(n30), .C(n31), .Y(n67) );
  NAND2X1 U31 ( .A(N14), .B(n4), .Y(n31) );
  OAI21X1 U32 ( .A(n1), .B(n32), .C(n33), .Y(n66) );
  NAND2X1 U33 ( .A(N15), .B(n4), .Y(n33) );
  INVX1 U34 ( .A(n34), .Y(n1) );
  OAI21X1 U35 ( .A(n35), .B(n36), .C(n37), .Y(n65) );
  NAND2X1 U36 ( .A(rollover_flag), .B(n34), .Y(n37) );
  NAND3X1 U37 ( .A(n38), .B(n39), .C(n40), .Y(n36) );
  NOR2X1 U38 ( .A(n41), .B(n42), .Y(n40) );
  NAND2X1 U39 ( .A(n43), .B(n44), .Y(n42) );
  MUX2X1 U40 ( .B(n45), .A(n46), .S(n47), .Y(n44) );
  AND2X1 U41 ( .A(n48), .B(count_out[8]), .Y(n46) );
  XNOR2X1 U42 ( .A(n48), .B(n30), .Y(n45) );
  MUX2X1 U43 ( .B(n49), .A(n50), .S(n51), .Y(n43) );
  AND2X1 U44 ( .A(n52), .B(count_out[6]), .Y(n50) );
  XNOR2X1 U45 ( .A(n52), .B(n26), .Y(n49) );
  OAI21X1 U46 ( .A(count_out[8]), .B(n53), .C(n4), .Y(n41) );
  NOR2X1 U47 ( .A(n34), .B(clear), .Y(n4) );
  NOR2X1 U48 ( .A(count_enable), .B(clear), .Y(n34) );
  INVX1 U49 ( .A(n54), .Y(n53) );
  MUX2X1 U50 ( .B(n2), .A(n55), .S(rollover_val[0]), .Y(n39) );
  OAI21X1 U51 ( .A(count_out[1]), .B(n56), .C(n2), .Y(n55) );
  NOR2X1 U52 ( .A(n57), .B(n58), .Y(n38) );
  MUX2X1 U53 ( .B(n59), .A(n60), .S(n61), .Y(n58) );
  NOR2X1 U54 ( .A(n62), .B(n63), .Y(n60) );
  OAI21X1 U55 ( .A(rollover_val[0]), .B(n5), .C(n64), .Y(n63) );
  XNOR2X1 U56 ( .A(n76), .B(count_out[2]), .Y(n62) );
  NOR2X1 U57 ( .A(n77), .B(n5), .Y(n59) );
  XNOR2X1 U58 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n77) );
  MUX2X1 U59 ( .B(n78), .A(n79), .S(rollover_val[4]), .Y(n57) );
  XNOR2X1 U60 ( .A(count_out[4]), .B(n80), .Y(n79) );
  NAND2X1 U61 ( .A(count_out[4]), .B(n80), .Y(n78) );
  NAND3X1 U62 ( .A(n81), .B(n82), .C(n83), .Y(n35) );
  AOI21X1 U63 ( .A(n84), .B(n26), .C(n85), .Y(n83) );
  OAI21X1 U64 ( .A(count_out[4]), .B(n86), .C(n87), .Y(n85) );
  XNOR2X1 U65 ( .A(count_out[7]), .B(n88), .Y(n87) );
  OAI21X1 U66 ( .A(n84), .B(n89), .C(n48), .Y(n88) );
  INVX1 U67 ( .A(n90), .Y(n86) );
  AOI21X1 U68 ( .A(n54), .B(n91), .C(n92), .Y(n82) );
  XNOR2X1 U69 ( .A(n32), .B(n93), .Y(n92) );
  NOR2X1 U70 ( .A(n54), .B(n91), .Y(n93) );
  NOR2X1 U71 ( .A(n48), .B(rollover_val[8]), .Y(n54) );
  NAND2X1 U72 ( .A(n84), .B(n89), .Y(n48) );
  INVX1 U73 ( .A(rollover_val[7]), .Y(n89) );
  NOR2X1 U74 ( .A(n52), .B(rollover_val[6]), .Y(n84) );
  NOR2X1 U75 ( .A(n94), .B(n95), .Y(n81) );
  XNOR2X1 U76 ( .A(n96), .B(n9), .Y(n95) );
  NAND2X1 U77 ( .A(n97), .B(n80), .Y(n96) );
  OAI21X1 U78 ( .A(rollover_val[2]), .B(n61), .C(rollover_val[3]), .Y(n97) );
  INVX1 U79 ( .A(n98), .Y(n61) );
  XNOR2X1 U80 ( .A(n99), .B(n24), .Y(n94) );
  OAI21X1 U81 ( .A(n90), .B(n100), .C(n52), .Y(n99) );
  NAND2X1 U82 ( .A(n90), .B(n100), .Y(n52) );
  INVX1 U83 ( .A(rollover_val[5]), .Y(n100) );
  NOR2X1 U84 ( .A(n80), .B(rollover_val[4]), .Y(n90) );
  NAND3X1 U85 ( .A(n76), .B(n101), .C(n98), .Y(n80) );
  NOR2X1 U86 ( .A(rollover_val[0]), .B(rollover_val[1]), .Y(n98) );
  INVX1 U87 ( .A(rollover_val[3]), .Y(n101) );
  NOR2X1 U88 ( .A(n32), .B(n102), .Y(N40) );
  NOR2X1 U89 ( .A(n30), .B(n102), .Y(N39) );
  NOR2X1 U90 ( .A(n28), .B(n102), .Y(N38) );
  NOR2X1 U91 ( .A(n26), .B(n102), .Y(N37) );
  NOR2X1 U92 ( .A(n24), .B(n102), .Y(N36) );
  NOR2X1 U93 ( .A(n22), .B(n102), .Y(N35) );
  NOR2X1 U94 ( .A(n9), .B(n102), .Y(N34) );
  NOR2X1 U95 ( .A(n7), .B(n102), .Y(N33) );
  NOR2X1 U96 ( .A(n5), .B(n102), .Y(N32) );
  NOR2X1 U97 ( .A(n2), .B(n102), .Y(N31) );
  OAI21X1 U98 ( .A(rollover_val[9]), .B(n32), .C(n103), .Y(n102) );
  OAI21X1 U99 ( .A(count_out[9]), .B(n91), .C(n104), .Y(n103) );
  OAI21X1 U100 ( .A(rollover_val[8]), .B(n30), .C(n105), .Y(n104) );
  OAI21X1 U101 ( .A(count_out[8]), .B(n47), .C(n106), .Y(n105) );
  AOI22X1 U102 ( .A(rollover_val[7]), .B(n107), .C(n108), .D(n28), .Y(n106) );
  INVX1 U103 ( .A(count_out[7]), .Y(n28) );
  INVX1 U104 ( .A(n109), .Y(n108) );
  NAND2X1 U105 ( .A(count_out[7]), .B(n109), .Y(n107) );
  OAI21X1 U106 ( .A(rollover_val[6]), .B(n26), .C(n110), .Y(n109) );
  OAI21X1 U107 ( .A(count_out[6]), .B(n51), .C(n111), .Y(n110) );
  AOI22X1 U108 ( .A(rollover_val[5]), .B(n112), .C(n113), .D(n24), .Y(n111) );
  INVX1 U109 ( .A(count_out[5]), .Y(n24) );
  INVX1 U110 ( .A(n114), .Y(n113) );
  NAND2X1 U111 ( .A(count_out[5]), .B(n114), .Y(n112) );
  OAI22X1 U112 ( .A(n115), .B(n116), .C(rollover_val[4]), .D(n22), .Y(n114) );
  OAI21X1 U113 ( .A(count_out[3]), .B(n117), .C(n118), .Y(n116) );
  OAI21X1 U114 ( .A(n119), .B(n9), .C(rollover_val[3]), .Y(n118) );
  INVX1 U115 ( .A(count_out[3]), .Y(n9) );
  INVX1 U116 ( .A(n117), .Y(n119) );
  OAI21X1 U117 ( .A(rollover_val[2]), .B(n7), .C(n120), .Y(n117) );
  OAI21X1 U118 ( .A(count_out[2]), .B(n76), .C(n121), .Y(n120) );
  AOI22X1 U119 ( .A(n122), .B(rollover_val[0]), .C(rollover_val[1]), .D(n5), 
        .Y(n121) );
  INVX1 U120 ( .A(count_out[1]), .Y(n5) );
  AND2X1 U121 ( .A(n2), .B(n64), .Y(n122) );
  NAND2X1 U122 ( .A(count_out[1]), .B(n56), .Y(n64) );
  INVX1 U123 ( .A(rollover_val[1]), .Y(n56) );
  INVX1 U124 ( .A(rollover_val[2]), .Y(n76) );
  INVX1 U125 ( .A(count_out[2]), .Y(n7) );
  AND2X1 U126 ( .A(n22), .B(rollover_val[4]), .Y(n115) );
  INVX1 U127 ( .A(count_out[4]), .Y(n22) );
  INVX1 U128 ( .A(rollover_val[6]), .Y(n51) );
  INVX1 U129 ( .A(count_out[6]), .Y(n26) );
  INVX1 U130 ( .A(rollover_val[8]), .Y(n47) );
  INVX1 U131 ( .A(count_out[8]), .Y(n30) );
  INVX1 U132 ( .A(rollover_val[9]), .Y(n91) );
  INVX1 U133 ( .A(count_out[9]), .Y(n32) );
  INVX1 U134 ( .A(count_out[0]), .Y(n2) );
endmodule


module flex_counter_NUM_CNT_BITS2 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [1:0] rollover_val;
  output [1:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n33, n34, n35, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n14, n15, n16,
         n17, n18, n19, n20;

  DFFSR \count_out_reg[0]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR rollover_flag_reg ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U6 ( .A(n1), .B(n2), .C(n3), .Y(n35) );
  NAND3X1 U7 ( .A(n4), .B(n5), .C(count_enable), .Y(n3) );
  OAI22X1 U8 ( .A(n2), .B(n6), .C(n7), .D(n8), .Y(n34) );
  OAI21X1 U9 ( .A(n9), .B(n1), .C(n5), .Y(n8) );
  MUX2X1 U10 ( .B(n10), .A(n14), .S(count_out[1]), .Y(n7) );
  AND2X1 U11 ( .A(rollover_val[1]), .B(rollover_val[0]), .Y(n14) );
  NOR2X1 U12 ( .A(n15), .B(n1), .Y(n10) );
  INVX1 U13 ( .A(n15), .Y(n2) );
  MUX2X1 U14 ( .B(n16), .A(n17), .S(n15), .Y(n33) );
  NOR2X1 U15 ( .A(count_enable), .B(clear), .Y(n15) );
  INVX1 U16 ( .A(rollover_flag), .Y(n17) );
  NAND2X1 U17 ( .A(n18), .B(n5), .Y(n16) );
  INVX1 U18 ( .A(clear), .Y(n5) );
  MUX2X1 U19 ( .B(n4), .A(n19), .S(rollover_val[0]), .Y(n18) );
  NAND2X1 U20 ( .A(n20), .B(n1), .Y(n19) );
  INVX1 U21 ( .A(count_out[0]), .Y(n1) );
  XOR2X1 U22 ( .A(rollover_val[1]), .B(n6), .Y(n20) );
  NAND2X1 U23 ( .A(count_out[0]), .B(n9), .Y(n4) );
  AND2X1 U24 ( .A(rollover_val[1]), .B(n6), .Y(n9) );
  INVX1 U25 ( .A(count_out[1]), .Y(n6) );
endmodule


module avalonMaster ( clk, n_rst, master_read, master_write, master_address, 
        master_write_data, master_response, master_waitrequest, fft_done, 
        sampled_data, sampled_address, sReEn );
  output [9:0] master_address;
  output [15:0] master_write_data;
  input [1:0] master_response;
  input [15:0] sampled_data;
  output [8:0] sampled_address;
  input clk, n_rst, master_waitrequest, fft_done;
  output master_read, master_write, sReEn;
  wire   countUp, clear, waitWrit, rolloverFlag, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n69, n70, n71, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191;
  wire   [9:0] ldCnt;
  wire   [31:0] state;
  tri   [9:0] master_address;
  tri   [15:0] master_write_data;
  tri   [8:0] sampled_address;
  assign master_read = 1'b0;
  assign master_write = waitWrit;

  DFFSR \state_reg[0]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  flex_counter_NUM_CNT_BITS10 samNum ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(countUp), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .count_out(ldCnt) );
  flex_counter_NUM_CNT_BITS2 holdWrite ( .clk(clk), .n_rst(n_rst), .clear(
        clear), .count_enable(waitWrit), .rollover_val({1'b1, 1'b1}), 
        .rollover_flag(rolloverFlag) );
  TBUFX1 \sampled_address_tri[1]  ( .A(n184), .EN(sReEn), .Y(
        sampled_address[1]) );
  TBUFX1 \sampled_address_tri[2]  ( .A(n185), .EN(sReEn), .Y(
        sampled_address[2]) );
  TBUFX1 \sampled_address_tri[3]  ( .A(n186), .EN(sReEn), .Y(
        sampled_address[3]) );
  TBUFX1 \sampled_address_tri[4]  ( .A(n187), .EN(sReEn), .Y(
        sampled_address[4]) );
  TBUFX1 \sampled_address_tri[5]  ( .A(n188), .EN(sReEn), .Y(
        sampled_address[5]) );
  TBUFX1 \sampled_address_tri[6]  ( .A(n189), .EN(sReEn), .Y(
        sampled_address[6]) );
  TBUFX1 \sampled_address_tri[7]  ( .A(n190), .EN(sReEn), .Y(
        sampled_address[7]) );
  TBUFX1 \master_write_data_tri[0]  ( .A(n55), .EN(waitWrit), .Y(
        master_write_data[0]) );
  TBUFX1 \master_write_data_tri[1]  ( .A(n54), .EN(waitWrit), .Y(
        master_write_data[1]) );
  TBUFX1 \master_write_data_tri[2]  ( .A(n53), .EN(waitWrit), .Y(
        master_write_data[2]) );
  TBUFX1 \master_write_data_tri[3]  ( .A(n52), .EN(waitWrit), .Y(
        master_write_data[3]) );
  TBUFX1 \master_write_data_tri[4]  ( .A(n51), .EN(waitWrit), .Y(
        master_write_data[4]) );
  TBUFX1 \master_write_data_tri[5]  ( .A(n50), .EN(waitWrit), .Y(
        master_write_data[5]) );
  TBUFX1 \master_write_data_tri[6]  ( .A(n49), .EN(waitWrit), .Y(
        master_write_data[6]) );
  TBUFX1 \master_write_data_tri[7]  ( .A(n48), .EN(waitWrit), .Y(
        master_write_data[7]) );
  TBUFX1 \master_write_data_tri[8]  ( .A(n47), .EN(waitWrit), .Y(
        master_write_data[8]) );
  TBUFX1 \master_write_data_tri[9]  ( .A(n46), .EN(waitWrit), .Y(
        master_write_data[9]) );
  TBUFX1 \master_write_data_tri[10]  ( .A(n45), .EN(waitWrit), .Y(
        master_write_data[10]) );
  TBUFX1 \master_write_data_tri[11]  ( .A(n44), .EN(waitWrit), .Y(
        master_write_data[11]) );
  TBUFX1 \master_write_data_tri[12]  ( .A(n43), .EN(waitWrit), .Y(
        master_write_data[12]) );
  TBUFX1 \master_write_data_tri[13]  ( .A(n42), .EN(waitWrit), .Y(
        master_write_data[13]) );
  TBUFX1 \master_write_data_tri[14]  ( .A(n41), .EN(waitWrit), .Y(
        master_write_data[14]) );
  TBUFX1 \master_write_data_tri[15]  ( .A(n40), .EN(waitWrit), .Y(
        master_write_data[15]) );
  TBUFX1 \master_address_tri[1]  ( .A(n38), .EN(waitWrit), .Y(
        master_address[1]) );
  TBUFX1 \master_address_tri[2]  ( .A(n37), .EN(waitWrit), .Y(
        master_address[2]) );
  TBUFX1 \master_address_tri[3]  ( .A(n36), .EN(waitWrit), .Y(
        master_address[3]) );
  TBUFX1 \master_address_tri[4]  ( .A(n35), .EN(waitWrit), .Y(
        master_address[4]) );
  TBUFX1 \master_address_tri[5]  ( .A(n34), .EN(waitWrit), .Y(
        master_address[5]) );
  TBUFX1 \master_address_tri[6]  ( .A(n33), .EN(waitWrit), .Y(
        master_address[6]) );
  TBUFX1 \master_address_tri[8]  ( .A(n31), .EN(waitWrit), .Y(
        master_address[8]) );
  TBUFX1 \master_address_tri[9]  ( .A(n30), .EN(waitWrit), .Y(
        master_address[9]) );
  TBUFX1 \sampled_address_tri[8]  ( .A(n191), .EN(sReEn), .Y(
        sampled_address[8]) );
  TBUFX1 \master_address_tri[0]  ( .A(n39), .EN(waitWrit), .Y(
        master_address[0]) );
  TBUFX1 \master_address_tri[7]  ( .A(n32), .EN(waitWrit), .Y(
        master_address[7]) );
  TBUFX1 \sampled_address_tri[0]  ( .A(ldCnt[0]), .EN(sReEn), .Y(
        sampled_address[0]) );
  INVX2 U238 ( .A(state[1]), .Y(n161) );
  INVX2 U239 ( .A(n157), .Y(waitWrit) );
  INVX1 U240 ( .A(n139), .Y(sReEn) );
  AOI21X1 U241 ( .A(ldCnt[1]), .B(ldCnt[0]), .C(n140), .Y(n184) );
  XOR2X1 U242 ( .A(ldCnt[2]), .B(n141), .Y(n185) );
  AOI21X1 U243 ( .A(ldCnt[3]), .B(n142), .C(n143), .Y(n186) );
  XOR2X1 U244 ( .A(ldCnt[4]), .B(n144), .Y(n187) );
  AOI21X1 U245 ( .A(ldCnt[5]), .B(n145), .C(n146), .Y(n188) );
  XOR2X1 U246 ( .A(ldCnt[6]), .B(n147), .Y(n189) );
  NOR2X1 U247 ( .A(n148), .B(n149), .Y(n71) );
  INVX1 U248 ( .A(n150), .Y(n148) );
  OAI21X1 U249 ( .A(state[2]), .B(n151), .C(n152), .Y(n150) );
  OAI21X1 U250 ( .A(state[2]), .B(n153), .C(state[0]), .Y(n152) );
  MUX2X1 U251 ( .B(n154), .A(rolloverFlag), .S(state[1]), .Y(n153) );
  OAI21X1 U252 ( .A(n139), .B(n155), .C(n156), .Y(n70) );
  OAI21X1 U253 ( .A(n157), .B(n158), .C(state[1]), .Y(n156) );
  INVX1 U254 ( .A(rolloverFlag), .Y(n158) );
  NAND2X1 U255 ( .A(n159), .B(n160), .Y(n155) );
  NAND2X1 U256 ( .A(waitWrit), .B(n161), .Y(n139) );
  NAND2X1 U257 ( .A(state[0]), .B(n162), .Y(n157) );
  NOR2X1 U258 ( .A(n149), .B(n163), .Y(n69) );
  MUX2X1 U259 ( .B(n164), .A(state[1]), .S(state[2]), .Y(n163) );
  OAI21X1 U260 ( .A(state[1]), .B(n165), .C(n151), .Y(n164) );
  AOI21X1 U261 ( .A(n166), .B(n160), .C(n154), .Y(n165) );
  NAND2X1 U262 ( .A(n167), .B(n168), .Y(n154) );
  INVX1 U263 ( .A(n169), .Y(n160) );
  NAND3X1 U264 ( .A(n167), .B(n168), .C(rolloverFlag), .Y(n169) );
  INVX1 U265 ( .A(master_response[1]), .Y(n168) );
  INVX1 U266 ( .A(master_response[0]), .Y(n167) );
  NOR2X1 U267 ( .A(master_waitrequest), .B(n159), .Y(n166) );
  NOR2X1 U268 ( .A(fft_done), .B(n151), .Y(n149) );
  INVX1 U269 ( .A(clear), .Y(n151) );
  NAND2X1 U270 ( .A(sampled_data[0]), .B(n161), .Y(n55) );
  NOR2X1 U271 ( .A(state[1]), .B(sampled_data[1]), .Y(n54) );
  NAND2X1 U272 ( .A(sampled_data[2]), .B(n161), .Y(n53) );
  NAND2X1 U273 ( .A(sampled_data[3]), .B(n161), .Y(n52) );
  NAND2X1 U274 ( .A(sampled_data[4]), .B(n161), .Y(n51) );
  NAND2X1 U275 ( .A(sampled_data[5]), .B(n161), .Y(n50) );
  NOR2X1 U276 ( .A(state[1]), .B(sampled_data[6]), .Y(n49) );
  NAND2X1 U277 ( .A(sampled_data[7]), .B(n161), .Y(n48) );
  NAND2X1 U278 ( .A(sampled_data[8]), .B(n161), .Y(n47) );
  NAND2X1 U279 ( .A(sampled_data[9]), .B(n161), .Y(n46) );
  NAND2X1 U280 ( .A(sampled_data[10]), .B(n161), .Y(n45) );
  NAND2X1 U281 ( .A(sampled_data[11]), .B(n161), .Y(n44) );
  NAND2X1 U282 ( .A(sampled_data[12]), .B(n161), .Y(n43) );
  NAND2X1 U283 ( .A(sampled_data[13]), .B(n161), .Y(n42) );
  NAND2X1 U284 ( .A(sampled_data[14]), .B(n161), .Y(n41) );
  NAND2X1 U285 ( .A(sampled_data[15]), .B(n161), .Y(n40) );
  INVX1 U286 ( .A(n170), .Y(n39) );
  MUX2X1 U287 ( .B(n170), .A(n171), .S(ldCnt[1]), .Y(n38) );
  OR2X1 U288 ( .A(ldCnt[0]), .B(state[1]), .Y(n171) );
  NAND2X1 U289 ( .A(ldCnt[0]), .B(n161), .Y(n170) );
  AOI21X1 U290 ( .A(ldCnt[2]), .B(n141), .C(n172), .Y(n37) );
  NAND2X1 U291 ( .A(n142), .B(n161), .Y(n172) );
  NOR2X1 U292 ( .A(state[1]), .B(n173), .Y(n36) );
  XNOR2X1 U293 ( .A(ldCnt[3]), .B(n142), .Y(n173) );
  AOI21X1 U294 ( .A(ldCnt[4]), .B(n144), .C(n174), .Y(n35) );
  NAND2X1 U295 ( .A(n145), .B(n161), .Y(n174) );
  NOR2X1 U296 ( .A(state[1]), .B(n175), .Y(n34) );
  XNOR2X1 U297 ( .A(ldCnt[5]), .B(n145), .Y(n175) );
  AOI21X1 U298 ( .A(ldCnt[6]), .B(n147), .C(n176), .Y(n33) );
  NAND2X1 U299 ( .A(n177), .B(n161), .Y(n176) );
  AND2X1 U300 ( .A(n161), .B(n190), .Y(n32) );
  XOR2X1 U301 ( .A(n177), .B(ldCnt[7]), .Y(n190) );
  OR2X1 U302 ( .A(n191), .B(state[1]), .Y(n31) );
  XOR2X1 U303 ( .A(n178), .B(n179), .Y(n191) );
  INVX1 U304 ( .A(n180), .Y(n30) );
  OAI21X1 U305 ( .A(n159), .B(n181), .C(n161), .Y(n180) );
  AOI21X1 U306 ( .A(n178), .B(n179), .C(ldCnt[9]), .Y(n181) );
  INVX1 U307 ( .A(n182), .Y(n159) );
  NAND3X1 U308 ( .A(n179), .B(n178), .C(ldCnt[9]), .Y(n182) );
  INVX1 U309 ( .A(ldCnt[8]), .Y(n178) );
  NOR2X1 U310 ( .A(n177), .B(ldCnt[7]), .Y(n179) );
  OR2X1 U311 ( .A(n147), .B(ldCnt[6]), .Y(n177) );
  INVX1 U312 ( .A(n146), .Y(n147) );
  NOR2X1 U313 ( .A(n145), .B(ldCnt[5]), .Y(n146) );
  OR2X1 U314 ( .A(n144), .B(ldCnt[4]), .Y(n145) );
  INVX1 U315 ( .A(n143), .Y(n144) );
  NOR2X1 U316 ( .A(n142), .B(ldCnt[3]), .Y(n143) );
  OR2X1 U317 ( .A(n141), .B(ldCnt[2]), .Y(n142) );
  INVX1 U318 ( .A(n140), .Y(n141) );
  NOR2X1 U319 ( .A(ldCnt[0]), .B(ldCnt[1]), .Y(n140) );
  NOR2X1 U320 ( .A(n162), .B(n183), .Y(countUp) );
  NAND2X1 U321 ( .A(state[0]), .B(n161), .Y(n183) );
  INVX1 U322 ( .A(state[2]), .Y(n162) );
  NOR2X1 U323 ( .A(state[0]), .B(state[1]), .Y(clear) );
endmodule

