clc; clear; close all;
%% Scelta dei Parametri:
% Foto (faccia 1, 2 o 3)
f=1;

% Numero Landmarks Occhi e bocca (4 o 5)
landcont = 5;

% Numero Landmarks Sopracciglia (2 o 3)
landconSopracciglia = 3;

% Grado di interpolazione (1° grado o 2° grado)
grado = 2;

% Sfondo ( 1-Immagine 2-Bianco);
sfondo = 2;

%% Lettura dell'immagine selezionata
if (f==1)
    img = imread('Volto1.jpg');
elseif (f==2)
    img = imread('Volto2.jpg');
elseif (f==3)
    img = imread('Volto3.jpg');
end

img = imresize(img, [224,224]);

[imgFaccia, OcchioSX, OcchioDX, Bocca, SopracciglioSX,  SopracciglioDX] = RilevamentoROI(img);

% Landmarks Occhio Sinistro
imgOcchioSX = (imgFaccia(OcchioSX(1,2):OcchioSX(1,2)+OcchioSX(1,4),OcchioSX(1,1):OcchioSX(1,1)+OcchioSX(1,3),:));
[landOcchioSX, OcchioSXcont] = ProcessingOcchi(imgOcchioSX,landcont);

% Landmarks Occhio Destro
imgOcchioDX = (imgFaccia(OcchioDX(1,2):OcchioDX(1,2)+OcchioDX(1,4),OcchioDX(1,1):OcchioDX(1,1)+OcchioDX(1,3),:));
[landOcchioDX, OcchioDXcont] = ProcessingOcchi(imgOcchioDX,landcont);

% Landmarks Bocca
imgBocca = (imgFaccia(Bocca(1,2):Bocca(1,2)+Bocca(1,4),Bocca(1,1):Bocca(1,1)+Bocca(1,3),:));
[landBocca, BoccaCont] = ProcessingBocca(imgBocca,landcont);

% Landmarks Sopracciglio Sinistro 
imgSopracciglioSX = (imgFaccia(SopracciglioSX(1,2):SopracciglioSX(1,2)+SopracciglioSX(1,4),SopracciglioSX(1,1):SopracciglioSX(1,1)+SopracciglioSX(1,3),:));
[landSopracciglioSX, SopracciglioSXcont] = ProcessingSopracciglia(imgSopracciglioSX,landconSopracciglia);

% Landmarks Sopracciglio Destro  
imgSopracciglioDX = (imgFaccia(SopracciglioDX(1,2):SopracciglioDX(1,2)+SopracciglioDX(1,4),SopracciglioDX(1,1):SopracciglioDX(1,1)+SopracciglioDX(1,3),:));
[landSopracciglioDX, SopracciglioDXcont] = ProcessingSopracciglia(imgSopracciglioDX,landconSopracciglia);

%% Mostra Landmarks interpolati
if sfondo == 1
    imshow(imgFaccia,'InitialMagnification',1000);
    hold on;
    mostraLandmarks(landOcchioSX,OcchioSXcont,OcchioSX,landcont,grado);
    mostraLandmarks(landOcchioDX,OcchioDXcont,OcchioDX,landcont,grado);
    mostraLandmarks(landBocca,BoccaCont,Bocca,landcont,grado);
    mostraLandmarks(landSopracciglioSX,SopracciglioSXcont,SopracciglioSX,landconSopracciglia,grado);
    mostraLandmarks(landSopracciglioDX,SopracciglioDXcont,SopracciglioDX,landconSopracciglia,grado);
elseif sfondo == 2
    imshow(imcomplement(0.*imgFaccia),'InitialMagnification',1000);
    hold on;
    mostraLandmarks(landOcchioSX,OcchioSXcont,OcchioSX,landcont,grado);
    mostraLandmarks(landOcchioDX,OcchioDXcont,OcchioDX,landcont,grado);
    mostraLandmarks(landBocca,BoccaCont,Bocca,landcont,grado);
    mostraLandmarks(landSopracciglioSX,SopracciglioSXcont,SopracciglioSX,landconSopracciglia,grado);
    mostraLandmarks(landSopracciglioDX,SopracciglioDXcont,SopracciglioDX,landconSopracciglia,grado);
end
