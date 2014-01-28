function cov()
training = 'training';
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

cov0 = zeros(16,16);
cov1 = zeros(16,16);
cov2 = zeros(16,16);
cov3 = zeros(16,16);
cov4 = zeros(16,16);
cov5 = zeros(16,16);
cov6 = zeros(16,16);
cov7 = zeros(16,16);
cov8 = zeros(16,16);
cov9 = zeros(16,16);


function [x] = covar(X,Y)
    tempsum = 0;
    for m = 1:1:size(X,1)
        tempsum = tempsum + X(m,1)*Y(m,1);
    end
    tempsum = tempsum / (size(X,1));
    x = tempsum - (mean(X) * mean(Y));
end

covar(data0(:,1),data0(:,1))

for n = 1:1:16
    for o = 1:1:16
        cov0(n,o) = covar(data0(:,n),data0(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov1(n,o) = covar(data1(:,n),data1(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov2(n,o) = covar(data2(:,n),data2(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov3(n,o) = covar(data3(:,n),data3(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov4(n,o) = covar(data4(:,n),data4(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov5(n,o) = covar(data5(:,n),data5(:,o));
    end
end


for n = 1:1:16
    for o = 1:1:16
        cov6(n,o) = covar(data6(:,n),data6(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov7(n,o) = covar(data7(:,n),data7(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov8(n,o) = covar(data8(:,n),data8(:,o));
    end
end

for n = 1:1:16
    for o = 1:1:16
        cov9(n,o) = covar(data9(:,n),data9(:,o));
    end
end







end


