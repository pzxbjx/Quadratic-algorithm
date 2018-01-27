load('australian.mat');
accuracy1 = logistic(australian_Tr,australian_Tr_Lb,australian_Ts,australian_Ts_Lb,australian_para_C);
load('sonar.mat');
accuracy2 = logistic(sonar_Tr,sonar_Tr_Lb,sonar_Ts,sonar_Ts_Lb,sonar_para_C);
