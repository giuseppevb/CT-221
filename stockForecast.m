function stockForecast(caseNumber)
    
if caseNumber == 1
    r = 15; tf1 = 'tansig'; p = 0; tf2 = 'a'; trainFcn = 'trainlm';
elseif caseNumber == 2
    r = 10; tf1 = 'poslin'; p = 10; tf2 = 'poslin'; trainFcn = 'trainlm';
elseif caseNumber == 3
    r = 20; tf1 = 'tansig'; p = 20; tf2 = 'tansig'; trainFcn = 'trainrp';
elseif caseNumber == 4
    r = 25; tf1 = 'poslin'; p = 0; tf2 = 'a'; trainFcn = 'traincgp';
elseif caseNumber == 5
    r = 25; tf1 = 'tansig'; p = 25; tf2 = 'tansig'; trainFcn = 'trainbr';
else
    r = 30; tf1 = 'tansig'; p = 20; tf2 = 'poslin'; trainFcn = 'trainrp';
end

    [P1,T1,P2,T2,P3,T3,petrValues,~,~] = getData();
    [net1,net2,net3] = trainNets (P1,T1,P2,T2,P3,T3,r,tf1,p,tf2,trainFcn);
    [petrPredictions,~,~] = simulateNets(net1,net2,net3);
    plotResults(petrValues,petrPredictions,caseNumber);

end