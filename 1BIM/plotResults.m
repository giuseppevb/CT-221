function plotResults (petrValues,petrPredictions,caseNumber)

    X = 1:90;
    petrValues = petrValues(901:end);
    plot(X,petrValues,'x',X,petrPredictions,'o');
    xlabel('Dia', 'FontSize', 14);
    ylabel('Valores de fechamento', 'FontSize', 14);
    legs = cell(1,2);
    legs{1} = sprintf('Valores reais');
    legs{2} = sprintf('Valores previstos com as redes neurais');
    legend(legs, 'FontSize', 12, 'Location', 'best');
    set(gca, 'FontSize', 14);
    title(sprintf('Resultados para o caso %d', caseNumber));
    print('-dpng', '-r400', sprintf('results%d',caseNumber));

end