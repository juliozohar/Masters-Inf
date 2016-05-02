%% Effacer toutes les variables 
clear all, close all; 

%% Charger le fichier Excel
%Lire les données numériques de la première feuille du fichier Excel 
matrix = xlsread('DonneesEaux.xlsx', 'Feuil1');

%% Centrer et réduire les données
stdr=std(matrix); 
sr=matrix./repmat(stdr, size(matrix, 1), 1); 

%% Faire une analyse en composante principale
%Pour plus de détail, consulter la fonction princomp
[coefs, score, variances, t2, explained] = princomp(sr);

%% Répresentation graphique
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
 

for i=1:56
   plot(score(i,1),score(i,2),'^','LineWidth',1,'MarkerEdgeColor', ... 
       'k','MarkerFaceColor','g','MarkerSize',7); 
   
   text(score(i, 1),score(i,2), Liste_Noms_Bouteilles{i},... 
       'VerticalAlignment', 'bottom',... 
       'HorizontalAlignment', 'right'); 
   
   hold on;
end

title('Répresentation des individus dans le plan factoriel CP1-CP2'); 
xlabel('Facteur 2: CP2');
ylabel('Facteur 1: CP1');  
grid on;

%% Cercle de correlation
% Répresentation du cercle de la corrélation
% Initialisation de la variable avec les noms des composants 
Liste_Noms_Composants = {'CA' 'MG' 'NA' 'K' 'SUL' 'NO3' 'HCO3' 'CL'}; 

figure;
CP1=1;
CP2=2;
title('cercle de correlation');
plot(coefs(:,CP1),coefs(:,CP2),'r.','MarkerSize',10);
box('on');
hold('all');
for i=1:size(coefs,2)
    text(coefs(i,CP1)+0.04,coefs(i,CP2), Liste_Noms_Composants{i},'Fontsize',10);
    hold on;
    quiver(0,0,coefs(i,CP1),coefs(i,CP2),'k','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',7);
    hold on;
end
hold on;
xtt=-1:1;
ytt=[0 0 0];
plot(xtt,ytt)
hold on;
plot(ytt,xtt)
circle = rsmak('circle');
fnplt(circle), axis square;
xlabel(['Facteur 1: CP', num2str(CP1)]); 
ylabel(['Facteur 2: CP', num2str(CP2)]);
grid on;

%%
figure % Pour une nouvelle figure
%Superposition des variables et des individus, correlation biplot 
%Initialisation de la variable avec les noms des composants 
Liste_Noms_Composants = {'CA' 'MG' 'NA' 'K' 'SUL' 'NO3' 'HCO3' 'CL'}; 

biplot(coefs(:, 1:2), 'scores', score(:, 1:2), 'varlabels', ...
    Liste_Noms_Composants, 'LineWidth', 2); 
title('Superposition des variables et des individus, correlation biplot'); 

%%
figure % Pour une nouvelle figure

%Répresentation des variables et individus, distance biplot
%Commencer par l'initialisation de la variable avec les noms des 
%bouteilles telque décrit précedemment.
biplot(score(:,1:2),'scores',coefs(:,1:2),'varlabels', ...
    Liste_Noms_Bouteilles, 'LineWidth',2); 








