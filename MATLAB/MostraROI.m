%% Input Immagine
  I = imread('Volto1.jpg'); % read an image of your dataset
  I = imresize(I, [224,224]);
  figure
  imshow(I)

%% Rilevamento Faccia
 RilevFaccia = vision.CascadeObjectDetector;
 Faccia = step(RilevFaccia,I);
 imgFaccia = (I(Faccia(1,2):Faccia(1,2)+Faccia(1,4),Faccia(1,1):Faccia(1,1)+Faccia(1,3),:));
 figure
 imshow(imgFaccia)
 
%% Rilevamento Occhio Sinistro
 RilevOcchio = vision.CascadeObjectDetector('LeftEye');
 Occhio =step(RilevOcchio,imgFaccia);
 OcchioSX  = Occhio(1,:);
 imgOcchioSX = (imgFaccia(OcchioSX(1,2):OcchioSX(1,2)+OcchioSX(1,4),OcchioSX(1,1):OcchioSX(1,1)+OcchioSX(1,3),:));
 figure
 imshow(imgOcchioSX)
 
%% Rilevamento Occhio Destro
 RilevOcchio = vision.CascadeObjectDetector('RightEye');
 Occhio =step(RilevOcchio,imgFaccia);
 OcchioDX = Occhio(2,:);
 imgOcchioDX = (imgFaccia(OcchioDX(1,2):OcchioDX(1,2)+OcchioDX(1,4),OcchioDX(1,1):OcchioDX(1,1)+OcchioDX(1,3),:));
 figure
 imshow(imgOcchioDX)
 
%% Rilevamento Bocca
 RilevBocca = vision.CascadeObjectDetector('Mouth');
 TrovaBocca =step(RilevBocca,imgFaccia);
 OrdinaBocca = sortrows(TrovaBocca,2);
 PosBocca = size(TrovaBocca,1);
 Bocca = OrdinaBocca(PosBocca,:);
 imgBocca = (imgFaccia(Bocca(1,2):Bocca(1,2)+Bocca(1,4),Bocca(1,1):Bocca(1,1)+Bocca(1,3),:));
 figure
 imshow(imgBocca)
 
%% Rilevamento Sopracciglio SX
 SopracciglioSX   = OcchioSX;
 SopracciglioSX(4) = (SopracciglioSX(4)/2)-4;
 SopracciglioSX(3) = SopracciglioSX(3);
 SopracciglioSX(4) = uint8(SopracciglioSX(4));
 SopracciglioSX(3) = uint8(SopracciglioSX(3));
 imgSopracciglioSX = (imgFaccia(SopracciglioSX(1,2):SopracciglioSX(1,2)+SopracciglioSX(1,4),SopracciglioSX(1,1):SopracciglioSX(1,1)+SopracciglioSX(1,3),:));
 figure
 imshow(imgSopracciglioSX)
 
%% Rilevamento Sopracciglio DX
 SopracciglioDX  = OcchioDX;
 SopracciglioDX(4) =  (SopracciglioDX(4)/2)-4;
 SopracciglioDX(3) = SopracciglioDX(3);
 SopracciglioDX(4) = uint8(SopracciglioDX(4));
 SopracciglioDX(3) = uint8(SopracciglioDX(3));
 imgSopracciglioDX = (imgFaccia(SopracciglioDX(1,2):SopracciglioDX(1,2)+SopracciglioDX(1,4),SopracciglioDX(1,1):SopracciglioDX(1,1)+SopracciglioDX(1,3),:));
 figure
 imshow(imgSopracciglioDX)