daten = 'pendigits';
training = 'training';
TData = importdata(training);
Data = importdata(daten);

fehlermatrix = zeros(10,10);

for n = 1:1:3498
    lowleader = 1;
    lowdiff = 1600;
    for m = 1:1:7494
        tempdiff = sum(abs(Data(n,1:16)-TData(m,1:16)));
        if (tempdiff < lowdiff)
            lowdiff = tempdiff;
            lowleader = m;
        end
    
    end
    fehlermatrix(TData(lowleader,17)+1,Data(n,17)+1) = fehlermatrix(TData(lowleader,17)+1,Data(n,17)+1) + 1;
end
colormap(jet)
imagesc(fehlermatrix);
set(gca,'XTick',1:10,...                         
        'XTickLabel',{'0','1','2','3','4','5','6','7','8','9'},...  
        'YTick',1:10,...
        'YTickLabel',{'0','1','2','3','4','5','6','7','8','9'},...
        'TickLength',[0 0]);
    
for n = 1:1:10
    text(n,n,num2str(fehlermatrix(n,n)/sum(fehlermatrix(n,:)),2),'FontSize',15);
end