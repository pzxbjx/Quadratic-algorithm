%初始化拉格朗日函数
t0 = cputime;
G = zeros(5,5);
for i = 1:5
    G(i,i) = 2;
end
G(2,3) = -2; G(3,2) = G(2,3);
G(4,5) = -2; G(5,4) = G(4,5);
h = [-2;0;0;0;0];
A = [1 0 ;
    1 0 ;
    1 1 ;
    1 -2;
    1 -2 ];
b = [5;-3];
%利用QR分解实现零空间法
[q,r]=qr(A);
Y = q(1:5,1:2)*inv(r(1:2,1:2))';
Z = q(1:5,3:5);
d = -inv(Z'*G*Z)*Z'*(h+G*Y*b);
x = Y*b+Z*d;
lambda = Y'*(G*x+h);
f = x'*G*x/2+h'*x+1;
time = cputime-t0;
fprintf('最优解为:\n');
fprintf(' %f',x');
fprintf('\n拉格朗日乘子为:\n');
fprintf(' %f',lambda');
fprintf('\n函数值为: %f\n',f);
fprintf('运行时间为: %f\n',time);
 