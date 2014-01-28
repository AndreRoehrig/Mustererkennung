training = 'values-training'
testing = 'values-testing'
TrainData = importdata(training)
TestData = importdata(testing)

Class0Data = TrainData(find(TrainData(:,2)==0))
Class1Data = TrainData(find(TrainData(:,2)==1))

Var0 = var(Class0Data)
Var1 = var(Class1Data)
mean0 = mean(Class0Data)
mean1 = mean(Class1Data)

gauss0 = makedist('Normal','mu',mean0,'sigma',sqrt(Var0))
gauss1 = makedist('Normal','mu',mean1,'sigma',sqrt(Var1))

Class0apri = 2/3
Class1apri = 1/3

fehlermatrix = zeros(2,2);
prediction = 2

for n = 1:1:15000
    prob0 = pdf(gauss0,TestData(n,1))*Class0apri
    prob1 = pdf(gauss1,TestData(n,1))*Class1apri
    if prob0>prob1
        prediction = 1
    end
    if prob1>=prob0
        prediction = 2
    end
    fehlermatrix(TestData(n,2)+1,prediction) = fehlermatrix(TestData(n,2)+1,prediction) + 1
end

erkennungsrate = fehlermatrix(1,1)+fehlermatrix(2,2)/15000

fehlermatrixknn =zeros(2,2)

for n = 1:1:15000
    lowleader = 1;
    lowdiff = 1600;
    n;
    for m = 1:1:15000
        
        if ((abs(TestData(n,1)-TrainData(m,1))) < lowdiff)
            lowdiff = abs(TestData(n,1)-TrainData(m,1));
            lowleader = m;
        end
    
    end
    fehlermatrixknn(TestData(n,2)+1,TrainData(lowleader,2)+1) = fehlermatrixknn(TestData(n,2)+1,TrainData(lowleader,2)+1) + 1
end

erkennungsrateknn = fehlermatrixknn(1,1)+fehlermatrixknn(2,2)/15000