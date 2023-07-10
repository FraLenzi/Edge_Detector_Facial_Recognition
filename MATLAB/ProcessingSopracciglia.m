function [V , CONT] = ProcessingSopracciglia(imgSopracciglio, landcont)
%  Questa funzione rileva le Sopracciglia
%%
%Trasformazione immagine in scala di grigi e equalizzazione dell'istogramma
SopracciglioGrigio = rgb2gray(imgSopracciglio);
SopracciglioIst= histeq (SopracciglioGrigio);
LimSopracciglio = stretchlim(SopracciglioIst);
Sopracciglio_Regolato = imadjust(SopracciglioIst,LimSopracciglio,[]);
%Fig.1

%Aumento dimensioni dell'immagine
resizeSopracciglio  = 8;
righeSopracciglio = floor(length(SopracciglioIst(:,1,1))*resizeSopracciglio);
ColonneSopracciglio =  floor(length(SopracciglioIst(1,:,1))*resizeSopracciglio);
fotoSopracciglio = imresize(Sopracciglio_Regolato,[righeSopracciglio,ColonneSopracciglio],'bilinear');
%Fig.2

%Immagine in Bianco e Nero
BN1Sopracciglio = imbinarize(fotoSopracciglio,0.46);
%Fig.3

%Immagine in Bianco e Nero invertita
BN2Sopracciglio = imcomplement(BN1Sopracciglio);
%Fig.4

%Selezione dell'area d'interesse
labelSopracciglio = bwconncomp(BN2Sopracciglio);
AreaSopracciglio = regionprops(labelSopracciglio,'Area');
ConfrontoSopracciglio = find([AreaSopracciglio.Area] == max([AreaSopracciglio.Area]));
BN3Sopracciglio = ismember(labelmatrix(labelSopracciglio), ConfrontoSopracciglio);
%Fig.5

%Dilatazione dell'immagine
Dilatatore = strel('line',10,0);
DilatSopracciglio = imdilate(BN3Sopracciglio ,Dilatatore);
    
%Riempimento dei Buchi
imgRiempita = imfill(DilatSopracciglio, 'holes');

%Applichiamo Canny
cannySopracciglio = edge(imgRiempita,'canny');
%Fig.6
  
[V, CONT] = RilevamentoLandmarks(cannySopracciglio,resizeSopracciglio,landcont);

end