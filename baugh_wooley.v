`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:17 02/07/2022 
// Design Name: 
// Module Name:    baugh_wooley 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// half adder component used in the multiplier 
module half_adder(a, b, s, cout);
input a, b;
output s, cout;
assign s = a^b; 
assign cout = a&b;
endmodule// full adder component used in the multiplier 
module full_adder(a, b, cin, s, cout);
input a, b, cin;
output s, cout;
assign s = a^b^cin; 
assign cout = (a&b) | (b&cin) | (a&cin);
endmodule//8-bit by 8-bit Baugh-Wooley signed multiplier 
module mult8bw(a, b, p);
input [7:0] a, b;
output [15:0] p;// constant logic-one value
supply1 one; 
// Internal results which is given to next stage adders
wire[103:0]t,x1,x2;// structural description of the multiplier circuit
assign p[0] = a[0]&b[0];
half_adder ha1(a[1]&b[0], a[0]&b[1], p[1], t1);
half_adder ha2(a[2]&b[0], a[1]&b[1], t2, t3);
full_adder fa1(t2, t1, a[0]&b[2], p[2], t4);
half_adder ha3(a[3]&b[0], a[2]&b[1], t5, t6);
full_adder fa2(t5, t3, a[1]&b[2], t7, t8);
full_adder fa3(t7, t4, a[0]&b[3],p[3],t9);
half_adder ha4(a[4]&b[0], a[3]&b[1], t10, t11);
full_adder fa4(t10,t6,a[2]&b[2],t12, t13);
full_adder fa5(t12,t8,a[1]&b[3],t14,t15);
full_adder fa6(t14, t9,a[0]&b[4],p[4], t16);
half_adder ha5(a[5]&b[0], a[4]&b[1], t17, t18);
full_adder fa7(t17,t11,a[3]&b[2],t19,t20);
full_adder fa8(t19,t13,a[2]&b[3], t21, t22);
full_adder fa9(t21, t15,a[1]&b[4],t23,t24);
full_adder fa10(t16,t23,a[0]&b[5],p[5], t25);
half_adder ha6(a[6]&b[0], a[5]&b[1], t26, t27);
full_adder fa11(t26, t18,a[4]&b[2],t28,t29);
full_adder fa12(t20, t28,a[3]&b[3],t30, t31);
full_adder fa13(t22, t30,a[2]&b[4],t32, t33);
full_adder fa14(t24, t32,a[1]&b[5],t34, t35);
full_adder fa15(t25, t34,a[0]&b[6],p[6], t36);
half_adder ha7(a[6]&b[1], a[7]&~b[0], t37, t38);
full_adder fa16(t27, t37,a[5]&b[2],t39, t40);
full_adder fa17(t39, t29,a[4]&b[3],t41, t42);
full_adder fa18(t31, t41,a[3]&b[4],t43, t44);
full_adder fa19(t33, t43,a[2]&b[5],t45, t46);
full_adder fa20(t45, t35,a[1]&b[6],t47, t48);
full_adder fa21(t36, t47,~a[0]&b[7],t49, t50);
full_adder fa22(t49,a[7],b[7],p[7], t51);
full_adder fa23(t38,a[6]&b[2],a[7]&~b[1],t52, t53);
full_adder fa24(t52,t40,a[5]&b[3],t54, t55);
full_adder fa25(t54,t42,a[4]&b[4],t56, t57);
full_adder fa26(t56,t44,a[3]&b[5],t58, t59);
full_adder fa27(t58,t46,a[2]&b[6],t60, t61);
full_adder fa28(t60,t48,~a[1]&b[7],t62, t63);
full_adder fa29(t50,t51,t62,p[8], t64);
full_adder fa30(t53,a[7]&~b[2],a[6]&b[3], t65,t66);
full_adder fa31(t55,t65,a[5]&b[4],t67, t68);
full_adder fa32(t57,t67,a[4]&b[5],t69, t70);
full_adder fa33(t59,t69,a[3]&b[6],t71, t72);
full_adder fa34(t61,t71,~a[2]&b[7],t73, t74);
full_adder fa35(t63,t73,t64,p[9], t75);
full_adder fa36(t66,a[6]&b[4],a[7]&~b[3],t76, t77);
full_adder fa37(t68,t76,a[5]&b[5],t78, t79);
full_adder fa38(t78,t70,a[4]&b[6],t80, t81);
full_adder fa39(t72,t80,~a[3]&b[7],t82, t83);
full_adder fa40(t74,t75,t82,p[10],t84);
full_adder fa41(t77,a[6]&b[5],a[7]&~b[4],t85, t86);
full_adder fa42(t79,t85,a[5]&b[6],t87, t88);
full_adder fa43(t81,t87,~a[4]&b[7],t89, t90);
full_adder fa44(t84,t83,t89,p[11], t91);
full_adder fa45(t86,a[6]&b[6],a[7]&~b[5],t92, t93);
full_adder fa46(t92,t88,~a[5]&b[7],t94, t95);
full_adder fa47(t90,t91,t94,p[12], t96);
full_adder fa48(t93,a[7]&~b[6],~a[6]&b[7],t97, t98);
full_adder fa49(t95,t96,t97,p[13], t99);
full_adder fa50(~a[7],~b[7],a[7]&b[7],t100, t101);
full_adder fa51(t98,t99,t100,p[14], t102);
full_adder fa52(one,t101,t102,p[15], t103);
endmodule
