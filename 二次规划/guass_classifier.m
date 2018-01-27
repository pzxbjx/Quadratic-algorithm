function label = guass_classifier(x,y,xtest,ytest)
xpos = x((y == 1),:);
xneg = x((y == -1),:);
m1 = size(xpos,1);
m2 = size(xneg,1);
mu1 = sum(xpos)/m1;
sigma1 = sum(xpos.*xpos)/m1 -mu1.*mu1;
mu2 = sum(xneg)/m2;
sigma2 = sum(xneg.*xneg)/m2 -mu2.*mu2;
p1 = multivariateGaussian(xtest,mu1,sigma1);
p2 = multivariateGaussian(xtest,mu2,sigma2);
label = zeros(size(xtest,1),1);
for i = 1:size(xtest)
    if p1(i) >= p2(i)
        label(i) = 1;
    end
    if p1(i) < p2(i)
        label(i) = -1;
    end
end
end

function p = multivariateGaussian(X, mu, Sigma2)
k = length(mu);

if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end

X = bsxfun(@minus, X, mu(:)');
p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end