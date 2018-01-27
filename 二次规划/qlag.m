%本程序用拉格朗日方法求解灯饰约束条件的二次规划问题。
function [x,lam]=qlag(H,A,b,c)
%功能：用拉格朗日方法求解等式约束二次规划：
% min f(x)=0.5*x'Hx+c'x， s.t. Ax=b
%输入：H,c分别是目标函数的矩阵和向量，A,b分别是约束条件中的矩阵和向量
%输出：(x,lam)是KT点，fval是最优值
IH=inv(H);
AHA=A*IH*A';
IAHA=inv(AHA);
AIH=A*IH;
G=IH-AIH'*IAHA*AIH;
B=IAHA*AIH;
C=-IAHA;
x=B'*b-G*c;
lam=B*c-C*b;
