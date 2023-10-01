function [net1,net2,net3] = trainNets (P1,T1,P2,T2,P3,T3,r, tf1, p, tf2, trainingFunction)

%Mse minimo/ideal = 10^-10/10^-22 (colocar para 1 ano e 9 meses se não der
%certo pra ficar abaixo disso

%% Net1
if p ~= 0
    net1 = feedforwardnet([r p]);
else
    net1 = feedforwardnet(r);
end

% Dividing patterns
net1.divideFcn = 'dividerand';
net1.divideParam.trainRatio = 1.00;
net1.divideParam.valRatio = 0.00;
net1.divideParam.testRatio = 0.00;

% Initializing weights
net1 = init(net1);

% Establishing parameters for training
net1.layers{1}.dimensions = r;
net1.layers{1}.transferFcn = tf1;
if p ~= 0
    net1.layers{2}.dimensions = p;
    net1.layers{2}.transferFcn = tf2;
    net1.layers{3}.transferFcn = 'purelin';
else
    net1.layers{2}.transferFcn = 'purelin';
end
net1.performFcn = 'mse';
net1.trainFcn = trainingFunction;
net1.trainParam.epochs = 10000000;
net1.trainParam.time = 240;
net1.trainParam.lr = 0.2;
net1.trainParam.min_grad = 10^-18;
net1.trainParam.max_fail = 1000;
%net1.trainParam.mu_max = 10^200;

[net1, tr1] = train(net1,P1,T1);

%% Net2
if p ~= 0
    net2 = feedforwardnet([r p]);
else
    net2 = feedforwardnet(r);
end

net2.divideFcn = 'dividerand';
net2.divideParam.trainRatio = 1.00;
net2.divideParam.valRatio = 0.00;
net2.divideParam.testRatio = 0.00;

% Initializing weights
net2 = init(net2);

% Establishing parameters for training
net2.layers{1}.dimensions = r;
net2.layers{1}.transferFcn = tf1;
if p ~= 0
    net2.layers{2}.dimensions = p;
    net2.layers{2}.transferFcn = tf2;
    net2.layers{3}.transferFcn = 'purelin';
else
    net2.layers{2}.transferFcn = 'purelin';
end
net2.performFcn = 'mse';
net2.trainFcn = trainingFunction;
net2.trainParam.epochs = 10000000;
net2.trainParam.time = 240;
net2.trainParam.lr = 0.2;
net2.trainParam.min_grad = 10^-18;
net2.trainParam.max_fail = 1000;
%net2.trainParam.mu_max = 10^200;

[net2, tr2] = train(net2,P2,T2);

%% Net3
if p ~= 0
    net3 = feedforwardnet([r p]);
else
    net3 = feedforwardnet(r);
end

net3.divideFcn = 'dividerand';
net3.divideParam.trainRatio = 1.00;
net3.divideParam.valRatio = 0.00;
net3.divideParam.testRatio = 0.00;

% Initializing weights
net3 = init(net3);

% Establishing parameters for training
net3.layers{1}.dimensions = r;
net3.layers{1}.transferFcn = tf1;
if p ~= 0
    net3.layers{2}.dimensions = p;
    net3.layers{2}.transferFcn = tf2;
    net3.layers{3}.transferFcn = 'purelin';
else
    net3.layers{2}.transferFcn = 'purelin';
end
net3.performFcn = 'mse';
net3.trainFcn = trainingFunction;
net3.trainParam.epochs = 10000000;
net3.trainParam.time = 240;
net3.trainParam.lr = 0.2;
net3.trainParam.min_grad = 10^-18;
net3.trainParam.max_fail = 1000;
%net3.trainParam.mu_max = 10^200;

[net3, tr3] = train(net3,P3,T3);
end