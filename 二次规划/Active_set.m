function [xmin,k] = Active_set(x,G,h,A,b)
w = (A'*x-b==0);
k = 0;
while true
    %记录迭代次数
    k=k+1;
    %筛选起作用的约束
    Abar = A;  Abar(:,(w==0))=[];
    B = zeros(sum(w),1);
    %求解等式约束下的二次规划
    [p,lam] = Lagrangian(G,h+G*x,Abar,B);
    lambda = zeros(4,1);
    lambda((w==1),:)=lam;
    f = x'* G * x /2 + h'*x + 9;
    fprintf('第%d次迭代',k);
    fprintf('迭代点为:\n');
    fprintf(' %f',x');
    fprintf('\n可行方向为：\n');
    fprintf(' %f',p');
    fprintf('\n工作集为:\n');
    fprintf(' %f',w);
    fprintf('\n拉格朗日乘子为:\n');
    fprintf(' %f',lambda');
    fprintf('\n函数值为: %f\n',f);
    if all(abs(p) < 1e-8)
        if all(lambda >= 0)
            xmin = x;
            break;
        end
        %从工作集中删除约束
        [~,q] = min(lambda);
        w(q) = 0;
        continue;
    end
    %求步长
    c = A'*p;
    d = b - A'*x;
    %排除不满足条件的约束
    d((w==1|c>=0),:)=1e6;
    c((w==1|c>=0),:)=1;
    a = min(1,min(d./c));
    %更新迭代点
    x = x+a*p;
    if(a < 1)
        %存在blocking constraint，增加约束；
        [~,q] = min(d./c);
        w(q) = 1;
    end
end

end