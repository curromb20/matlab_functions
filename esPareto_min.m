function [vectorIndEficientes,logico] = esPareto_min(matrizEficientes,nuevaSol)
%UNTITLED Summary of this function goes here
% {matrizEficientes tiene c objetivos y f soluciones y son EFICIENTES
% nuevaSol tiene c objetivos y es 1 solución
% Ambos inputs contienen solo los valores de las F.O.
% Queremos ver si la nueva solución es eficiente y si lo es,
% Comprobar si domina a alguna de las que estaba en la matrizEficientes
% Todos los objetivos son A MINIMIZAR
% Detailed explanation goes here
% Los outputs:
% un vector con los índices de las eficientes de las que había originalmente
% (teniendo en cuenta que nuevaSol puede dominar otras o no y ser eficiente o no)
% logico será true si nuevaSol es eficiente

logico=true;

if isempty(matrizEficientes)
    vectorIndEficientes = [];
else
    
    [numSolEfic,numObjetivos]=size(matrizEficientes);
    vectorIndEficientes = ones(numSolEfic,1); %1 = eficiente.
    
    nuevaIgual=matrizEficientes==nuevaSol;
    % a cada solución en cada objetivo
    
    nuevaIgualGlobal=(sum(nuevaIgual,2)==numObjetivos);
    % a cada solución en todos los objetivos
    
    if nuevaIgualGlobal>0
        
    else
        nuevaDomina=matrizEficientes>=nuevaSol;
        % a cada solución en cada objetivo
        
        nuevaDominaGlobal=(sum(nuevaDomina,2)==numObjetivos);
        % a cada solución EN TODOS LOS OBJETIVOS
        
        nuevaEsDominada=nuevaSol>=matrizEficientes;
        % por cada solución en cada objetivo
        
        nuevaEsDominadaGlobal=(sum(nuevaEsDominada,2)==numObjetivos);
        % por cada solución en TODOS LOS OBJETIVOS
        
        if sum(nuevaEsDominadaGlobal)>0
            logico=false;
        elseif sum(nuevaDominaGlobal)>0
            vectorIndEficientes=1-nuevaDominaGlobal;%devuelve los índices de las que continúan siendo eficientes
        end
    end
end
end

