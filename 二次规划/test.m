G = [1 0;0 1];
h = [-3;-1];
A = [0 1;-1 0];
b = [-3;0];
[x,lambda]=Lagrangian(G,h,A,b);
disp(x);
disp(lambda);