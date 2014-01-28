daten = 'pendigits';
Data = importdata(daten);

xkord = 1:2:16;
ykord = 2:2:16;

firstencounter = [1:10]
for n = 0:1:9
    temp = find(Data(:,17)==n)
    firstencounter(1,n+1) = temp(1,1)
end



for n = 1:1:10
    subplot(2,5,n)
    plot(Data((firstencounter(1,n)) ,xkord),Data((firstencounter(1,n)),ykord)...
        ,'--+r')
    xlabel(n-1,'FontSize',20)
end