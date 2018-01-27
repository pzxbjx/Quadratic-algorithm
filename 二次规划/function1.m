%��ʼ���������պ���
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
%����QR�ֽ�ʵ����ռ䷨
[q,r]=qr(A);
Y = q(1:5,1:2)*inv(r(1:2,1:2))';
Z = q(1:5,3:5);
d = -inv(Z'*G*Z)*Z'*(h+G*Y*b);
x = Y*b+Z*d;
lambda = Y'*(G*x+h);
f = x'*G*x/2+h'*x+1;
time = cputime-t0;
fprintf('���Ž�Ϊ:\n');
fprintf(' %f',x');
fprintf('\n�������ճ���Ϊ:\n');
fprintf(' %f',lambda');
fprintf('\n����ֵΪ: %f\n',f);
fprintf('����ʱ��Ϊ: %f\n',time);
 