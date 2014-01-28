function klausurreg
    klausuren = dlmread('klausur.txt', ';');
    
    mod = LinearModel.fit(klausuren(:,1), klausuren(:,2));
    mod
    schwelle = 0.5 / mod.Coefficients.Estimate(2)
end