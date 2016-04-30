%Effacer toutes les variables 
clear all, close all; 

%Charger le fichier Excel
%Lire les données numériques de la première feuille du fichier Excel 
matrix = xlsread('DonneesEaux.xlsx', 'Feuil1');

%Centrer et réduire les données
stdr=std(matrix); 
sr=matrix./repmat(stdr, size(matrix, 1), 1); 

%Faire une analyse en composante principale
%Pour plus de détail, consulter la fonction princomp
[coefs, scores, variances, t2, explained] = princomp(sr);

% Répresentation graphique
%Dessiner les valeurs propres 

figure('Color',[1,1,1]); 
plot(variances, 'LineWidth', 3); 
title('Representation des valeurs propres'); 
xlabel('Indice de la valeur propre'); 
ylabel('Valeur propre'); 


% Répresentation des individus dans le plan factoriel CP1-CP2 
% Initialisation de la variable avec les noms des bouteilles 

Liste_Noms_Bouteilles = {'Evian' 'Montagne des Pyrennees' ... 
    'Crystaline St-Cyr' 'Fiee des Lois' 'Volcania' 'St Diery' 'Luchon'... 
    'Volvic' 'Alpes/Moulettes' 'Oree du bois' 'Arvie'... 
    'Alpes/Roche des Ecrins' 'Ondine' 'Thonon' 'Aix les Bains' 'Contrex'...
    'La Bondoire St Hypolite' 'Dax' 'Quezac' 'Salvetat' 'Stamna'... 
    'Iohl' 'Avra' 'Rouvras' 'Alisea' 'San Bernadetto' 'San Pellegrino'...
    'Levissima' 'Vera' 'San Antonio' 'La Francaise' 'St Benoit'... 
    'Plancoet' 'St Alix' 'Puits St George' 'St Georges/Corse'... 
    'Hildon bleue' 'Hildon blanche' 'Mont Roucous' 'Ogeu' 'Highland Spring'... 
    'Parot' 'Verniere' 'Terres de Flein' 'Courmayeur' 'Pyrenees'... 
    'Puits St-Georges Monoprix' 'Prince Noir' 'Montcalm' 'Chantereine' ...
    '18 Carats' 'Spring Water' 'Vals' 'Vernet' 'Sidi-Hazarem' 'Sidi Ali'...
    'Montclair'}; 

grid on; 

for i=1:56
   plot(score(i,1),score(i,2),'^','LineWidth',1,'MarkerEdgeColor', ... 
       'k','MarkerFaceColor','g','MarkerSize',7); 
   
   text(score(i, 1)),score(i,2), Liste_Noms_Bouteilles{i}; ... 
       'VerticalAlignment'; 'bottom';... 
       'HorizontalAlignment'; 'right'; 
   
   hold on;
end

title('Répresentation des individus dans le plan factoriel CP1-CP2'); 
xlabel('Facteur 2: CP2');
ylabel('Facteur 1: CP1');  


% Répresentation du cercle de la corrélation
% Initialisation de la variable avec les noms des composants 
Liste_Noms_Composants = {'CA' 'MG' 'NA' 'K' 'SUL' 'NO3' 'HCO3' 'CL'}; 
circle(0,0,0.6); 
hold on 
for i=1:8 
   quiver(0,0,coefs(i,1),coefs(i,2),'k','LineWidth', 3)
   text(coefs(i,1),coefs(i,2),Liste_Noms_Composants{i}, ... 
       'VerticalAlignment','bottom', ...
       'HorizontalAlignment','right'); 
   hold on; 
end
xlabel('Facteur 1'); 
ylabel('Facteur 2');

%Superposition des variables et des individus, correlation biplot 
%Initialisation de la variable avec les noms des composants 
Liste_Noms_Composants = {'CA' 'MG' 'NA' 'K' 'SUL' 'NO3' 'HCO3' 'CL'}; 

biplot(coefs(:, 1:2), 'scores', scores(:, 1:2), 'varlabels', ...
    Liste_Noms_Composants, 'LineWidth', 2); 
title('Superposition des variables et des individus, correlation biplot'); 



%Répresentation des variables et individus, distance biplot
%Commencer par l'initialisation de la variable avec les noms des 
%bouteilles telque décrit précedemment.
biplot(scores(:,1:2),'scores',coefs(:,1:2),'varlabels', ...
    Liste_Noms_Bouteilles, 'LineWidth',2); 
