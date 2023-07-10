function [V, CONT] = ProcessingBocca(imgBocca, landcont)
%  Questa funzione rileva la bocca
%%
%Applicazione del Filtro Gaussiano
filtroGaussiano = fspecial('gaussian',[5 5],2);
imgFiltrata = imfilter(imgBocca,filtroGaussiano,'same');
%Fig.1

%Dimensionamento dell'immagine
resizeBocca = 15;
righeBocca = floor(length(imgFiltrata(:,1,1))*resizeBocca);
colonneBocca =  floor(length(imgFiltrata(1,:,1))*resizeBocca);
fotoBocca = imresize(imgFiltrata,[righeBocca,colonneBocca],'bilinear');
%Fig.2

%Separazione componenti dell'immagine: tonalità, saturazione e valore (HSV)
[h,~,~] = rgb2hsv(fotoBocca);
%Fig.3

%Erosione Immagine
Dilatatore = strel('disk',5);
imgErosa = imerode(h,Dilatatore);

%Dilatazione dell'immagine
Dilatatore = strel('disk',8);
imgDilatata = imdilate(imgErosa,Dilatatore);

%Conversione in Bianco e NEro
BN1Bocca = imbinarize(imgDilatata,graythresh(imgDilatata));

%Selezione dell'area d'interesse
labelBocca = bwconncomp(BN1Bocca);
AreaBocca = regionprops(labelBocca,'Area');
ConfrontoBocca = find([AreaBocca.Area] == max([AreaBocca.Area]));
BN2Bocca = ismember(labelmatrix(labelBocca), ConfrontoBocca);
%Fig.4

CannyBocca = edge(BN2Bocca,'canny',0.4);
%Fig.5

[V , CONT] = RilevamentoLandmarks(CannyBocca, resizeBocca,landcont);

end