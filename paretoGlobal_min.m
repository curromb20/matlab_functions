function [matrizEficientes,indiceEficientes] = paretoGlobal_min(matrizObjetivos)
% En esta función introducimos una matriz de soluciones 
% El número de filas es el número de soluciones
% El número de columnas es el número de objetivos
% Los output son:
% matrizEficientes -> valores de f.o. de las soluciones pareto eficientes
% indiceEficientes -> indice de aquellas soluciones pareto eficientes

matrizEficientes=[];
indiceEficientes=[];
[numSol,~]=size(matrizObjetivos);

for i=1:numSol
    
    [vectorEficientes,logico] = esPareto_min(matrizEficientes,matrizObjetivos(i,:));
    
    
    if isempty(vectorEficientes)
        matrizEficientes=matrizObjetivos(i,:);
        indiceEficientes=i;
    elseif logico
        matrizEficientes=matrizEficientes(logical(vectorEficientes),:);
        indiceEficientes=indiceEficientes(logical(vectorEficientes));
        matrizEficientes(end+1,:)=matrizObjetivos(i,:);
        indiceEficientes(end+1)=i;
    end
    
end
end