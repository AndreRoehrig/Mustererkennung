function randomtree()
clc;
clear;

training = dlmread('pendigits-training.txt');
testing = dlmread('pendigits-testing.txt');


function [valuematrix] = calcmatrix()
rando1 = rand(1)*100;
rando2 = rand(1)*100;
rando3 = rand(1)*100;
rando4 = rand(1)*100;

tree1nodes  = randperm(16,4);
tree1matrix = zeros(16, 10);

for i = 1:7494
    if training(i,tree1nodes(1,1))<=rando1
        if training(i,tree1nodes(1,2))<=rando2
            if training(i,tree1nodes(1,3))<=rando3
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(1,training(i,17)+1) = tree1matrix(1,training(i,17)+1)+1;
                else
                    tree1matrix(2,training(i,17)+1) = tree1matrix(2,training(i,17)+1)+1;
                end
            else
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(3,training(i,17)+1) = tree1matrix(3,training(i,17)+1)+1;
                else
                    tree1matrix(4,training(i,17)+1) = tree1matrix(4,training(i,17)+1)+1;
                end
            end
        else
            if training(i,tree1nodes(1,3))<=rando3
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(5,training(i,17)+1) = tree1matrix(5,training(i,17)+1)+1;
                else
                    tree1matrix(6,training(i,17)+1) = tree1matrix(6,training(i,17)+1)+1;
                end
            else
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(7,training(i,17)+1) = tree1matrix(7,training(i,17)+1)+1;
                else
                    tree1matrix(8,training(i,17)+1) = tree1matrix(8,training(i,17)+1)+1;
                end
            end
        end
    else
        if training(i,tree1nodes(1,2))<=rando2
            if training(i,tree1nodes(1,3))<=rando3
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(9,training(i,17)+1) = tree1matrix(9,training(i,17)+1)+1;
                else
                    tree1matrix(10,training(i,17)+1) = tree1matrix(10,training(i,17)+1)+1;
                end
            else
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(11,training(i,17)+1) = tree1matrix(11,training(i,17)+1)+1;
                else
                    tree1matrix(12,training(i,17)+1) = tree1matrix(12,training(i,17)+1)+1;
                end
            end
        else
            if training(i,tree1nodes(1,3))<=rando3
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(13,training(i,17)+1) = tree1matrix(13,training(i,17)+1)+1;
                else
                    tree1matrix(14,training(i,17)+1) = tree1matrix(14,training(i,17)+1)+1;
                end
            else
                if training(i,tree1nodes(1,4))<=rando4
                    tree1matrix(15,training(i,17)+1) = tree1matrix(15,training(i,17)+1)+1;
                else
                    tree1matrix(16,training(i,17)+1) = tree1matrix(16,training(i,17)+1)+1;
                end
            end
        end
    end
end

trainingmatrix = zeros(3498,10);

for i = 1:3498
    if testing(i,tree1nodes(1,1))<=rando1
        if testing(i,tree1nodes(1,2))<=rando2
            if testing(i,tree1nodes(1,3))<=rando3
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(1,:)==max(tree1matrix(1,:))))=trainingmatrix(i,find(tree1matrix(1,:)==max(tree1matrix(1,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(2,:)==max(tree1matrix(2,:))))=trainingmatrix(i,find(tree1matrix(2,:)==max(tree1matrix(2,:))))+1;
                end
            else
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(3,:)==max(tree1matrix(3,:))))=trainingmatrix(i,find(tree1matrix(3,:)==max(tree1matrix(3,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(4,:)==max(tree1matrix(4,:))))=trainingmatrix(i,find(tree1matrix(4,:)==max(tree1matrix(4,:))))+1;
                end
            end
        else
            if testing(i,tree1nodes(1,3))<=rando3
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(5,:)==max(tree1matrix(5,:))))=trainingmatrix(i,find(tree1matrix(5,:)==max(tree1matrix(5,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(6,:)==max(tree1matrix(6,:))))=trainingmatrix(i,find(tree1matrix(6,:)==max(tree1matrix(6,:))))+1;
                end
            else
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(7,:)==max(tree1matrix(7,:))))=trainingmatrix(i,find(tree1matrix(7,:)==max(tree1matrix(7,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(8,:)==max(tree1matrix(8,:))))=trainingmatrix(i,find(tree1matrix(8,:)==max(tree1matrix(8,:))))+1;
                end
            end
        end
    else
        if testing(i,tree1nodes(1,2))<=rando2
            if testing(i,tree1nodes(1,3))<=rando3
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(9,:)==max(tree1matrix(9,:))))=trainingmatrix(i,find(tree1matrix(9,:)==max(tree1matrix(9,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(10,:)==max(tree1matrix(10,:))))=trainingmatrix(i,find(tree1matrix(10,:)==max(tree1matrix(10,:))))+1;
                end
            else
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(11,:)==max(tree1matrix(11,:))))=trainingmatrix(i,find(tree1matrix(11,:)==max(tree1matrix(11,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(12,:)==max(tree1matrix(12,:))))=trainingmatrix(i,find(tree1matrix(12,:)==max(tree1matrix(12,:))))+1;
                end
            end
        else
            if testing(i,tree1nodes(1,3))<=rando3
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(13,:)==max(tree1matrix(13,:))))=trainingmatrix(i,find(tree1matrix(13,:)==max(tree1matrix(13,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(14,:)==max(tree1matrix(14,:))))=trainingmatrix(i,find(tree1matrix(14,:)==max(tree1matrix(14,:))))+1;
                end
            else
                if testing(i,tree1nodes(1,4))<=rando4
                    trainingmatrix(i,find(tree1matrix(15,:)==max(tree1matrix(15,:))))=trainingmatrix(i,find(tree1matrix(15,:)==max(tree1matrix(15,:))))+1;
                else
                    trainingmatrix(i,find(tree1matrix(16,:)==max(tree1matrix(16,:))))=trainingmatrix(i,find(tree1matrix(16,:)==max(tree1matrix(16,:))))+1;
                end
            end
        end
    end
end

valuematrix=trainingmatrix;

end


treeclass1=calcmatrix();
treeclass2=calcmatrix();
treeclass3=calcmatrix();
treeclass4=calcmatrix();
treeclass5=calcmatrix();
treeclass6=calcmatrix();
treeclass7=calcmatrix();
treeclass8=calcmatrix();
treeclass9=calcmatrix();
treeclass10=calcmatrix();
treeclass11=calcmatrix();
treeclass12=calcmatrix();
treeclass13=calcmatrix();
treeclass14=calcmatrix();
treeclass15=calcmatrix();
treeclass16=calcmatrix();
treeclass17=calcmatrix();
treeclass18=calcmatrix();
treeclass19=calcmatrix();
treeclass20=calcmatrix();
treeclass21=calcmatrix();
treeclass22=calcmatrix();
treeclass23=calcmatrix();
treeclass24=calcmatrix();
treeclass25=calcmatrix();
treeclass26=calcmatrix();
treeclass27=calcmatrix();
treeclass28=calcmatrix();
treeclass29=calcmatrix();
treeclass30=calcmatrix();
treeclass31=calcmatrix();
treeclass32=calcmatrix();
treeclass33=calcmatrix();
treeclass34=calcmatrix();
treeclass35=calcmatrix();
treeclass36=calcmatrix();
treeclass37=calcmatrix();
treeclass38=calcmatrix();
treeclass39=calcmatrix();
treeclass40=calcmatrix();
treeclass41=calcmatrix();
treeclass42=calcmatrix();
treeclass43=calcmatrix();
treeclass44=calcmatrix();
treeclass45=calcmatrix();
treeclass46=calcmatrix();
treeclass47=calcmatrix();
treeclass48=calcmatrix();
treeclass49=calcmatrix();
treeclass50=calcmatrix();

treebag1 = treeclass1+treeclass2+treeclass3+treeclass4+treeclass5+treeclass6+treeclass7+treeclass8+treeclass9+treeclass10+treeclass11+treeclass12+treeclass13+treeclass14+treeclass15+treeclass16+treeclass17+treeclass18+treeclass19+treeclass20;
treebag2 = treeclass21+treeclass22+treeclass23+treeclass24+treeclass25+treeclass26+treeclass27+treeclass28+treeclass29+treeclass30+treeclass31+treeclass32+treeclass33+treeclass34+treeclass35+treeclass36+treeclass37+treeclass38+treeclass39+treeclass40+treeclass41;
treebag = treebag1+treebag2+treeclass42+treeclass43+treeclass44+treeclass45+treeclass46+treeclass47+treeclass48+treeclass49+treeclass50;

confusionmatrix=zeros(10,10);

for i = 1:3498
    confusionmatrix(testing(i,17)+1,find(treebag(i,:)==max(treebag(i,:)))) = confusionmatrix(testing(i,17)+1,find(treebag(i,:)==max(treebag(i,:))))+1;
end
confusionmatrix

diagsum= trace(confusionmatrix);
matsum = sum(sum(confusionmatrix));
erkennungsrate = diagsum/matsum

colormap(jet)
imagesc(confusionmatrix);
set(gca,'XTick',1:10,...                         
        'XTickLabel',{'0','1','2','3','4','5','6','7','8','9'},...  
        'YTick',1:10,...
        'YTickLabel',{'0','1','2','3','4','5','6','7','8','9'},...
        'TickLength',[0 0]);
    
for n = 1:1:10
    text(n,n,num2str(confusionmatrix(n,n)/sum(confusionmatrix(n,:)),2),'FontSize',15);
end

end