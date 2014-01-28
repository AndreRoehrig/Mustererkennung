clc;
clear;

training = dlmread('pendigits-training.txt');
testing = dlmread('pendigits-training.txt');

training = training(1:60,:);
testing = testing(61:90,:);
[nr, ~] = size(training);


% step 1: expand scalar output to binary vector
training_result = zeros(size(training,1),10);
idx = sub2ind(size(training_result), (1:size(training_result,1))', training(:,end)+1);
training_result(idx) = 1;

testing_result = zeros(size(testing,1),10);
idx = sub2ind(size(testing_result), (1:size(testing_result,1))', testing(:,end)+1);
testing_result(idx) = 1;

%remove last row (results) from training
training(:,end) = [];
testing(:,end) = [];

% step 2: normalize inputdata to [0,1] in each category/column

training = training / 100;
testing = testing / 100;

k = 16;             % hidden units  (4, 8, 16)
gamma = 1;        % scaling-factor
test_E = 0;        %train network until sum of squared errors is smaller than max_E
E = test_E+1;        %initialize E with a value greater than max_E

W_1_overline = zeros(size(training,2)+1,k)-0.5;
W_2_overline = zeros(k+1, 10)-0.5;
W_1_T_overline = zeros(size(testing,2)+1,k)-0.5;
W_2_T_overline = zeros(k+1, 10)-0.5;


count = 0

oldchange_W1 = 0;
oldchange_W2 = 0;

% apply backprop-algo for every training-row on network while sum of
% squared errors is greater than max_E

while E > test_E
    count = count + 1
    E=0;
    test_E = 0;
    deltaW_2=zeros(k+1,10);
    deltaW_1=zeros(size(training,2)+1,k);
    
    for i = 1:size(training,1)

        trainitem = i;      % select  of the trainingrows for training

        % feed forward
        o__hat = [training(trainitem,:), 1];
        net_o_1 =  o__hat*W_1_overline;
        o_1 = 1./(1+exp(-net_o_1)); % outputvector of hidden units (size k)

        o_1_hat = [o_1, 1];
        net_o_2 = o_1_hat*W_2_overline;
        o_2 = 1./(1+exp(-net_o_2)); % outputvector of output units (size 10)

        % backprop
        W_1 = W_1_overline(1:end-1,:);
        W_2 = W_2_overline(1:end-1,:);

        D_2 = diag(o_2.*(1-o_2));
        D_1 = diag(o_1.*(1-o_1));

        e = o_2'-training_result(trainitem,:)';
        
        d_2 = D_2 * e;
        d_1 = D_1 * W_2 * d_2;

        deltaW_2 = deltaW_2 + transpose(-gamma * d_2 * o_1_hat);
        deltaW_1 = deltaW_1 + transpose(-gamma * d_1 * o__hat);

        %sum up sum of squared errors
        E = E + sum(e.^2/2);

    end
    
    W_1_overline = W_1_overline + deltaW_1 - oldchange_W1 * 0.001;
    W_2_overline = W_2_overline + deltaW_2 - oldchange_W2 * 0.001;
    
    oldchange_W1 = deltaW_1;
    oldchange_W2 = deltaW_2;
    
    for i = 1:size(testing,1)

        testingitem = i;      % select  of the trainingrows for training

        % feed forward
        o__hat_T = [testing(testingitem,:), 1];
        net_o_1_T =  o__hat_T*W_1_overline;
        o_1_T = 1./(1+exp(-net_o_1_T)); % outputvector of hidden units (size k)

        o_1_hat_T = [o_1_T, 1];
        net_o_2_T = o_1_hat_T*W_2_overline;
        o_2_T = 1./(1+exp(-net_o_2_T)); % outputvector of output units (size 10)
       
        e = o_2_T'-testing_result(testingitem,:)';

        %sum up sum of squared errors
        test_E = test_E + sum(e.^2/2);

    end


    
    
    
    %write out E
    test_E
    E
    
end

%write out weights for debug
%W_1_overline
%W_2_overline


