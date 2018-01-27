function [x,lambda]= Lagrangian(G,h,A,b)
%step1
V = (A'/G)*A;
%step2
w = -inv(G)*h;
B = -A'*w + b;
%step3
lambda = inv(V)*B;
H = A*lambda - h;
%step4
x = inv(G)*H;

end



