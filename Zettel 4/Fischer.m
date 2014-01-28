function Fischer
    points = dlmread('pendigits-training.txt');
    cov0 = cov(points(points(:,17)==0, 1:16));
    cov1 = cov(points(points(:,17)==1, 1:16));
    rand1 = randn(1000,16);
    unity1 = bsxfun(@rdivide,rand1,sqrt(sum(rand1.^2,2)));

 
    woutdist = mean(mean(points(points(:,17)==0, 1:16)))*unity1-mean(mean(points(points(:,17)==1, 1:16)))*unity1;
    head = abs(woutdist);
    tail = unity1*transpose(cov0)+unity1*transpose(cov1);
    whole = mean(head/tail);
    mean(whole);
    transpose(unity1(find(whole==max(whole(:))),:))
end
