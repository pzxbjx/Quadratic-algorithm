%���������������շ���������Լ�������Ķ��ι滮���⡣
function [x,lam]=qlag(H,A,b,c)
%���ܣ����������շ�������ʽԼ�����ι滮��
% min f(x)=0.5*x'Hx+c'x�� s.t. Ax=b
%���룺H,c�ֱ���Ŀ�꺯���ľ����������A,b�ֱ���Լ�������еľ��������
%�����(x,lam)��KT�㣬fval������ֵ
IH=inv(H);
AHA=A*IH*A';
IAHA=inv(AHA);
AIH=A*IH;
G=IH-AIH'*IAHA*AIH;
B=IAHA*AIH;
C=-IAHA;
x=B'*b-G*c;
lam=B*c-C*b;
