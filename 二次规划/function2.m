t0 = cputime;
G = [4 2 2;2 4 0; 2 0 2];
h = [-8;-6;-4];
A = [-1 -1 -2; 1 0 0; 0 1 0;0 0 1]';
b = [-3;0;0;0];
x = [0.5;0.5;0.5];
[xmin,k] = Active_set(x,G,h,A,b);
f = xmin'* G * xmin /2 + h'*xmin + 9;
time = cputime-t0;
fprintf('总迭代次数为: %d\n',k);
fprintf('最优解为:\n');
fprintf(' %f',xmin');
fprintf('\n函数值为: %f\n',f);
fprintf('运行时间为: %f\n',time);