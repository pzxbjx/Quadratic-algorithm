function accuracy = svm_predict(label,data,w,b)
pred = data*w+b;
error = sum(pred.*label < 0) / size(data,1);
accuracy = 1-error;
end