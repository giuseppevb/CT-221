function [P1,T1,P2,T2,P3,T3,petrvalues,embrvalues,valevalues]  = getData
%% 1 - Limpeza das variáveis:
clear; clc; close all;

%% 2 - Carga da base de dados:
% Specify file names
file_names = {'PETR3.SA.csv', 'VALE3.SA.csv', 'EMBR3.SA.csv'};

% Initialize the matrices P and T of all 3 nets
P1 = zeros(30, 89);
T1 = zeros(10,89);
P2 = zeros(30, 89);
T2 = zeros(10,89);
P3 = zeros(30, 89);
T3 = zeros(10,89);

opts = detectImportOptions(file_names{1});
opts.SelectedVariableNames = "Close";
petr = readtable(file_names{1},opts);
petrvalues = table2array(petr);
vale = readtable(file_names{2},opts);
valevalues = table2array(vale);
embr = readtable(file_names{3},opts);
embrvalues = table2array(embr);

for i = 1:size(P1,2)
        P1(1:10, i) = petrvalues((i-1)*10+1:i*10);
        P1(11:20, i) = embrvalues((i-1)*10+1:i*10);
        P1(21:30, i) = valevalues((i-1)*10+1:i*10);
        T1(1:10,i) = petrvalues(i*10+1:(i+1)*10);

        P3(1:10, i) = embrvalues((i-1)*10+1:i*10);
        P3(11:20, i) = valevalues((i-1)*10+1:i*10);
        P3(21:30, i) = petrvalues((i-1)*10+1:i*10);
        T3(1:10,i) = embrvalues(i*10+1:(i+1)*10);

        P2(1:10, i) = valevalues((i-1)*10+1:i*10);
        P2(11:20, i) = embrvalues((i-1)*10+1:i*10);
        P2(21:30, i) = petrvalues((i-1)*10+1:i*10);
        T2(1:10,i) = valevalues(i*10+1:(i+1)*10);

        
end


end






