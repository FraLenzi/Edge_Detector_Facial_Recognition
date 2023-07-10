function  [imgFaccia, OcchioSX, OcchioDX, Bocca, SopracciglioSX,  SopracciglioDX] = RilevamentoROI(I)
% Questa funzione ricava le ROI (Occhi, Bocca e Sopracciglia)
%%

%Rilevamento Faccia
 RilevFaccia = vision.CascadeObjectDetector;
 Faccia = step(RilevFaccia,I);
 imgFaccia = (I(Faccia(1,2):Faccia(1,2)+Faccia(1,4),Faccia(1,1):Faccia(1,1)+Faccia(1,3),:));

 %Rilevamento Occhio Sinistro
 RilevOcchio = vision.CascadeObjectDetector('LeftEye');
 Occhio =step(RilevOcchio,imgFaccia);
 OcchioSX  = Occhio(1,:);
 
 %Rilevamento Occhio Destro
 RilevOcchio = vision.CascadeObjectDetector('RightEye');
 Occhio =step(RilevOcchio,imgFaccia);
 OcchioDX = Occhio(2,:);
 
 %Rilevamento Bocca
 RilevBocca = vision.CascadeObjectDetector('Mouth');
 TrovaBocca =step(RilevBocca,imgFaccia);
 OrdinaBocca = sortrows(TrovaBocca,2);
 PosBocca = size(TrovaBocca,1);
 Bocca = OrdinaBocca(PosBocca,:);

%Rilevamento Sopracciglio SX
 SopracciglioSX   = OcchioSX;
 SopracciglioSX(4) = (SopracciglioSX(4)/2)-4;
 SopracciglioSX(3) = SopracciglioSX(3);
 SopracciglioSX(4) = uint8(SopracciglioSX(4));
 SopracciglioSX(3) = uint8(SopracciglioSX(3));

%Rilevamento Sopracciglio DX
 SopracciglioDX  = OcchioDX;
 SopracciglioDX(4) =  (SopracciglioDX(4)/2)-4;
 SopracciglioDX(3) = SopracciglioDX(3);
 SopracciglioDX(4) = uint8(SopracciglioDX(4));
 SopracciglioDX(3) = uint8(SopracciglioDX(3));

end