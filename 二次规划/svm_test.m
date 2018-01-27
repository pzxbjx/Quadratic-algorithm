%australian data set
load('australian.mat');
para = [ '-t 0 -c ' , num2str(australian_para_C) ];
Model = svmtrain(australian_Tr_Lb,australian_Tr,para);
fprintf('训练集的准确度为：\n');
[label , ~ ,~] = svmpredict(australian_Tr_Lb,australian_Tr,Model);
fprintf('测试集的准确度为：\n');
[label , ~ ,~] = svmpredict(australian_Ts_Lb,australian_Ts,Model);
%sonar data set
load('sonar.mat');
para = [ '-t 0 -c ' , num2str(sonar_para_C) ];
Model = svmtrain(sonar_Tr_Lb,sonar_Tr,para);
fprintf('训练集的准确度为：\n');
[label , ~ ,~] = svmpredict(sonar_Tr_Lb,sonar_Tr,Model);
fprintf('测试集的准确度为：\n');
[label , ~ ,~] = svmpredict(sonar_Ts_Lb,sonar_Ts,Model);