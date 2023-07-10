function [V, CONT] = ProcessingOcchi(imgOcchi, landcont)
%  Questa funzione rileva gli Occhi
%%

%Regolazione del Contrasto dell'immagine
limiti = stretchlim(imgOcchi);
imgRegolata = imadjust(imgOcchi,limiti,[]);
%Fig.1

%Aumento dimensioni dell'immagine
resizeOcchio = 5;
righeOcchio = floor(length(imgRegolata(:,1,1))*resizeOcchio);
colonneOcchio =  floor(length(imgRegolata(1,:,1))*resizeOcchio);
fotoOcchio = imresize(imgOcchi,[righeOcchio,colonneOcchio],'bilinear');
%Fig.2

%Conversione Immagine in Bianco e Nero 
TrasfCiano = makecform('srgb2lab');
imgCiano = applycform(fotoOcchio,TrasfCiano);
%Fig.3

 img1Grigia = graythresh(imgCiano(:,:,3));
 BN1Occhio = imbinarize(imgCiano(:,:,3),img1Grigia);
%Fig.4

%Selezione dell'area d'interesse
BN3Occhio = imcomplement(BN1Occhio);
%Fig.5

labelOcchio = bwconncomp(BN3Occhio);
AreaOcchio = regionprops(labelOcchio,'Area');
ConfrontoOcchio = find([AreaOcchio.Area] == max([AreaOcchio.Area]));
BN2Occhio = ismember(labelmatrix(labelOcchio), ConfrontoOcchio);
%Fig.6

%Immagine Dilatata
Dilatatore = strel('line',10,0);
DilatOcchio = imdilate(BN2Occhio,Dilatatore);
%Fig.7

%Riempimento Buchi
imgRiempita = imfill(DilatOcchio, 'holes');

CannyOcchio = edge(imgRiempita,'canny',0.4);
%Fig.8

[V, CONT] = RilevamentoLandmarks(CannyOcchio,resizeOcchio,landcont);
end