% INF-6409 - Forage de Donn�es
% Pr�nom: Julio-Cesar  Nom: Torres dos Santos 
% Prof : Neila Mezgani 
% Charg� d'encadrement: Youssef Ouakrim
% Mini-Projet Module 01

% Exercice 3
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

% R�presentation graphique des donn�s de la deuxi�me collonne (effetifs /
% notes) en forme de diagramme en bo�te. 
figure;
boxplot(Mat(:,2));
title('Notes en math�matiques');

% D�termination de la mediane de la matrice 
nu = median(Mat); 

% D�termination des quartiles Q1, Q2 et Q3 de la matrice
quantile(Mat(:,2), [0.25 0.5 0.75 ])


% Solution du Probl�me propos�
data = []; 
[num, txt] = xlsread('DonneesOzone', 'Feuil1', '', '', data);

% D�finition des variables: 
% obs   : variable quantitative discr�te ordinale
% maxo3 : variable quantitative discr�te 
% T9    : variable quantitative continue
% T12   : variable quantitative continue
% T15   : variable quantitative continue
% Ne9   : variable quantitative discr�te
% Ne12  : variable quantitative discr�te
% Ne15  : variable quantitative discr�te
% max03v: variable quantitative discr�te
% vent  : variable qualitative nominale
% pluie : variable qualitative nominale
obs  = data(:,1);
maxo3= data(:,2); 
t9   = data(:,3); 
t12  = data(:,4); 
t15  = data(:,5); 
ne9  = data(:,6); 
ne12 = data(:,7); 
ne15 = data(:,8); 
maxo3v= data(:,9); 
vent = data(:,10); 
pluie= data(:,11); 

% D�terminer le nombre d'individus. Retourne deux valeurs: premier c'est le
% nombre d'individus; le deuxi�me, la quantit� de variables pr�sente dans
% la matrice. 
qty_rows = size(data); 


% Calculer les caract�ristiques de tendence centrale et de dispersion des 
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

% Pr�senter le r�sultat des variables dans un tableau. 
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


T = table(Tab);

% Cr�ation du boxplot des variables de temperature et nebulosit�.
figure; 
B = boxplot([t9, t12, t15, ne9, ne12, ne15],'labels', ...
    {'T9', 'T12', 'T15', 'Ne9', 'Ne12', 'Ne15'}, 'whisker', 1); 
title('Variables observ�es'); 


% Cr�ation du diagramme camembert pour les variables qualitatives 
figure(3); 
directions = {'Nord', 'Sud', 'ouest', 'Est'};
vent = categorical(vent); 
h = pie(vent); 



 