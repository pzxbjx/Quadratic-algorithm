function [w,b,output] = svm_train(x,y,c)
%初始化二次规划参数
[m,n] = size(x);
G = zeros(n+1+m);
G(1:n,1:n) = eye(n);
h = [zeros(n+1,1);c*ones(m,1)];
A0 = [x,ones(m,1)];
for i= 1:m
    A0(i,:) = A0(i,:)*y(i);
end
A = [A0,eye(m);zeros(m,n+1),eye(m)];
B = [ones(m,1);zeros(m,1)];
%利用二次规划求解svm
[xmin,~,~,output,~] = quadprog(G,h,-A,-B,[],[]);
w = xmin(1:n);
b = xmin(n+1);
end
