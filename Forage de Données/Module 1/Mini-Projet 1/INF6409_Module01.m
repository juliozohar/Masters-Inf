% *************************************************************************
% INF-6409 - Forage de Données
% Prénom: Julio-Cesar  Nom: Torres dos Santos 
% Prof : Neila Mezgani 
% Chargé d'encadrement: Youssef Ouakrim
% Mini-Projet Module 01
% *************************************************************************

% ***********
% Exercice 3
% ***********
%Netoyage des valeurs existentes avant. 
clear all; 
close all; 

%Definition et affectation de la matrice 
Mat = [
0   1 
1   0 
2   0 
3   2 
4   0
5   4
6   4
7   0
8   2
9   2
10  2
11  2
12  5
13  5
14  5
15 12
16 12
17  5
18  2
19  2
20  2
]; 

% Répresentation graphique des donnés de la deuxième collonne (effetifs /
% notes) en forme de diagramme en boîte. 
figure;
boxplot(Mat(:,2));
title('Notes en mathématiques');


t = 'Solution d''exercice 3: '; 
disp(t); 
% Détermination de la mediane de la matrice par la fonction median();
t = 'Médiane de la matrice: ';
disp(t); 
nu = median(Mat(:,2));
disp(nu); 


% Détermination des quartiles Q1, Q2 et Q3 de la matrice par la fonction
% quantile();
t = 'Quartils Q1, Q2 et Q3:'; 
disp(t); 
quart = quantile(Mat(:,2), [0.25 0.5 0.75 ]);
disp(quart); 



% *****************************
% Solution du Problème proposé
% *****************************
 
t = 'Solution du problème proposé: '; 
disp(t);

[num, txt, raw] = xlsread('DonneesOzone', 'Feuil1');

% Définition des variables: 
% obs   : variable quantitative discrète ordinale
% maxo3 : variable quantitative discrète 
% T9    : variable quantitative continue
% T12   : variable quantitative continue
% T15   : variable quantitative continue
% Ne9   : variable quantitative discrète
% Ne12  : variable quantitative discrète
% Ne15  : variable quantitative discrète
% V9    : variable quantitative continue
% V12   : variable quantitative continue
% V15   : variable quantitative continue
% max03v: variable quantitative discrète
% vent  : variable qualitative nominale
% pluie : variable qualitative nominale
obs  = num(:,1);
maxo3= num(:,2); 
t9   = num(:,3); 
t12  = num(:,4); 
t15  = num(:,5); 
ne9  = num(:,6); 
ne12 = num(:,7); 
ne15 = num(:,8); 
v9   = num(:,9); 
v12  = num(:,10); 
v15  = num(:,11); 
maxo3v= num(:,12); 
vent = txt(:,13); 
pluie= txt(:,14); 

% Déterminer le nombre d'individus. Retourne deux valeurs: premier c'est le
% nombre d'individus; le deuxième, la quantité de variables présente dans
% la matrice. 
t = 'Nombre d''individus présents dans le fichier: ';
disp(t); 
qty_rows = size(num); 
disp(qty_rows); 


% Calculer les caractéristiques de tendence centrale et de dispersion des 
% variables.  
obs_moyenne   = mean(obs); 
obs_ecart     = std(obs); 
obs_mediane   = median(obs); 

maxo3_moyenne = mean(maxo3); 
maxo3_ecart   = std(maxo3); 
maxo3_mediane = median(maxo3); 

t9_moyenne    = mean(t9); 
t9_ecart      = std(t9); 
t9_mediane    = median(t9); 

t12_moyenne   = mean(t12); 
t12_ecart     = std(t12); 
t12_mediane   = median(t12); 

t15_moyenne   = mean(t15); 
t15_ecart     = std(t15); 
t15_mediane   = median(t15); 

ne9_moyenne    = mean(ne9); 
ne9_ecart      = std(ne9); 
ne9_mediane    = median(ne9); 

ne12_moyenne   = mean(ne12); 
ne12_ecart     = std(ne12); 
ne12_mediane   = median(ne12); 

ne15_moyenne   = mean(ne15); 
ne15_ecart     = std(ne15); 
ne15_mediane   = median(ne15); 

maxo3v_moyenne = mean(maxo3v); 
maxo3v_ecart   = std(maxo3v); 
maxo3v_mediane = median(maxo3v); 

% Présenter le résultat des variables dans un tableau. 
%Tab_names = {'maxo3'; 't9'; 't12'; 't15'; 'ne9'; 'ne12'; 'ne15'; 'maxo3v'};
Tab = [
       maxo3_moyenne ,  maxo3_ecart ,  maxo3_mediane 
       t9_moyenne    ,  t9_ecart    ,  t9_mediane
       t12_moyenne   ,  t12_ecart   ,  t12_mediane
       t15_moyenne   ,  t15_ecart   ,  t15_mediane
       ne9_moyenne   ,  ne9_ecart   ,  ne9_mediane
       ne12_moyenne  ,  ne12_ecart  ,  ne12_mediane
       ne15_moyenne  ,  ne15_ecart  ,  ne15_mediane
       maxo3v_moyenne,  maxo3v_ecart,  maxo3v_mediane
      ]; 


T = table(Tab, 'RowNames', {'maxo3' 't9' 't12' 't15' 'ne9' 'ne12' 'ne15'...
    'mav03v'}); 
disp(T); 

% Création du boxplot des variables de temperature et nebulosité.
figure; 
B = boxplot([t9, t12, t15, ne9, ne12, ne15],'labels', ...
    {'T9', 'T12', 'T15', 'Ne9', 'Ne12', 'Ne15'}, 'whisker', 1); 
title('Variables observées'); 


% Création du diagramme Cammembert pour la variable vent
% Compte chaque modalite de la variable
ventStatus = categorical(vent,...
    {'Nord' 'Sud' 'Est' 'Ouest'},'Ordinal',true);

% Plot le graphique
figure;
pie(ventStatus);
title('Direction du vent');

% Création du diagramme Cammembert pour la variable pluie
% Compte chaque modalite de la variable
pluieStatus = categorical(pluie,...       
    {'Sec' 'Pluie'},'Ordinal',true);

% Plot le graphique 
figure;
pie(pluieStatus);
title('Status de la pluie');

% *************************************************************************
% Fin du fichier
% *************************************************************************
