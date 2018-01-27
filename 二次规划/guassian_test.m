load('australian.mat');
label = guass_classifier(australian_Tr,australian_Tr_Lb,australian_Ts,australian_Ts_Lb);
accuracy1 = sum(label == australian_Ts_Lb)/size(australian_Ts_Lb,1);
load('sonar.mat');
label2 = guass_classifier(sonar_Tr,sonar_Tr_Lb,sonar_Ts,sonar_Ts_Lb);
accuracy2 = sum(label2 == sonar_Ts_Lb)/size(sonar_Ts_Lb,1);