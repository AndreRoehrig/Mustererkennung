function hauptkomp()
training = 'pendigits-training.txt';
TrainData = importdata(training);

data0 = TrainData(find(TrainData(:,17)==0),:);
data1 = TrainData(find(TrainData(:,17)==1),:);
data2 = TrainData(find(TrainData(:,17)==2),:);
data3 = TrainData(find(TrainData(:,17)==3),:);
data4 = TrainData(find(TrainData(:,17)==4),:);
data5 = TrainData(find(TrainData(:,17)==5),:);
data6 = TrainData(find(TrainData(:,17)==6),:);
data7 = TrainData(find(TrainData(:,17)==7),:);
data8 = TrainData(find(TrainData(:,17)==8),:);
data9 = TrainData(find(TrainData(:,17)==9),:);

data0 = data0(:,1:16);
data1 = data1(:,1:16);
data2 = data2(:,1:16);
data3 = data3(:,1:16);
data4 = data4(:,1:16);
data5 = data5(:,1:16);
data6 = data6(:,1:16);
data7 = data7(:,1:16);
data8 = data8(:,1:16);
data9 = data9(:,1:16);



function [vector,wert] = pca2(daten)
    tempmatrix = bsxfun(@minus, daten, mean(daten,1));
    tempmatrix = cov(tempmatrix);
    [matrixgeraden tempvalue] = eig(tempmatrix);
    [tempvalue sorted] = sort(diag(tempvalue), 'descend');
    summeeigen = sum(tempvalue);
    wert = tempvalue(1,1)/summeeigen;
    matrixgeraden = matrixgeraden(:,sorted);
    vector = matrixgeraden(:,1);
    
    
end

[vector0 wert0] = pca2(data0)
[vector1 wert1] = pca2(data1)
[vector2 wert2] = pca2(data2)
[vector3 wert3] = pca2(data3)
[vector4 wert4] = pca2(data4)
[vector5 wert5] = pca2(data5)
[vector6 wert6] = pca2(data6)
[vector7 wert7] = pca2(data7)
[vector8 wert8] = pca2(data8)
[vector9 wert9] = pca2(data9)


end