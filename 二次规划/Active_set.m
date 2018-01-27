function [xmin,k] = Active_set(x,G,h,A,b)
w = (A'*x-b==0);
k = 0;
while true
    %��¼��������
    k=k+1;
    %ɸѡ�����õ�Լ��
    Abar = A;  Abar(:,(w==0))=[];
    B = zeros(sum(w),1);
    %����ʽԼ���µĶ��ι滮
    [p,lam] = Lagrangian(G,h+G*x,Abar,B);
    lambda = zeros(4,1);
    lambda((w==1),:)=lam;
    f = x'* G * x /2 + h'*x + 9;
    fprintf('��%d�ε���',k);
    fprintf('������Ϊ:\n');
    fprintf(' %f',x');
    fprintf('\n���з���Ϊ��\n');
    fprintf(' %f',p');
    fprintf('\n������Ϊ:\n');
    fprintf(' %f',w);
    fprintf('\n�������ճ���Ϊ:\n');
    fprintf(' %f',lambda');
    fprintf('\n����ֵΪ: %f\n',f);
    if all(abs(p) < 1e-8)
        if all(lambda >= 0)
            xmin = x;
            break;
        end
        %�ӹ�������ɾ��Լ��
        [~,q] = min(lambda);
        w(q) = 0;
        continue;
    end
    %�󲽳�
    c = A'*p;
    d = b - A'*x;
    %�ų�������������Լ��
    d((w==1|c>=0),:)=1e6;
    c((w==1|c>=0),:)=1;
    a = min(1,min(d./c));
    %���µ�����
    x = x+a*p;
    if(a < 1)
        %����blocking constraint������Լ����
        [~,q] = min(d./c);
        w(q) = 1;
    end
end

end