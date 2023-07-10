function [V, CONT] = RilevamentoLandmarks(canny,resize,landcont)
%  Questa funzione serve per determinare i Landmarks
%%

esiste=0;
[l,c] = size(canny);
x_sx = uint8(c/2);
x_dx = uint8(c/2)+1;
y_superiore = uint8(l/2);
y_inferiore = uint8(l/2) +1;
  
    for i = 1:1:l
        for j = 1:1:c
            if canny(i,j)> 0 && j <= x_sx  % Trovo la posizione del punto di interesse all'estremo sinistro
                x_sx = j;
                E= [i,j];
            end
            
            if canny(i,j)> 0 && j >= x_dx  % Trovo la posizione del punto di interesse all'estremo destro
                x_dx = j;
                D = [i,j];
                
            end
            
            if canny(i,j)> 0 && i <= y_superiore  % Trovo la posizione del punto di interesse all'estremo superiore
                y_superiore = i;
                S = [i,j];
            end
            
            if canny(i,j)> 0 && i >= y_inferiore  % Trovo la posizione del punto di interesse all'estremo inferiore
                y_inferiore = i;
                I = [i,j];
            end
        end
    end

    if ((exist('D','var')) && (exist('E','var')) && (exist('S','var')) && (exist('I','var')))
        % Allineamento sull'asse y dei punti S e I
        punto_medio = (Distanza(D(2), E(2))+1)/2;
        nuova_x = E(2) + punto_medio;
        nuovaposS = [S(1),nuova_x];
        nuovaposI = [I(1),nuova_x];
        
        esiste = 1;
    end
   
    %Verifica dell'esistenza dei punti( In caso contrario assegno [-1,1])
    if (~exist('E','var'))
        E = [-1,-1];
    end
    
    if (~exist('D','var'))
        D =  [-1,-1];
    end
    
    if (~exist('S','var'))
        S =  [-1,-1];
    end
    
    if (~exist('I','var'))
        I =  [-1,-1];
    end
    
    if (~exist('nuovaposI','var'))
        nuovaposI = [-1,-1];
    end
    
    if (~exist('nuovaposS','var'))
        nuovaposS =  [-1,-1];
    end
    
    %Assegnazione dei punti nel vettore V e CONT
    if (landcont == 2) || (landcont == 3) || (landcont == 4)
     V = [E/resize;
            D/resize;
            S/resize;
            I/resize;
            nuovaposI/resize;
            nuovaposS/resize];
        CONT(1) = 0;
        CONT(2) = esiste;
        CONT(3)= 0;
    end
    
    %Caso per 5 Landmarks (Occhi e bocca)
    if (landcont == 5)
       
    %Calcolo dei punti intermedi
         if ((S(1)~=-1) && (S(2)~=-1) && (nuovaposS(1)==-1) && (nuovaposS(2)==-1)) && ...
                 ((I(1)~=-1) && (I(2)~=-1) && (nuovaposI(1)==-1) && (nuovaposI(2)==-1))          
            de2 = Distanza(S, I)/(2*resize);
        end

        if ((S(1)~=-1) && (S(2)~=-1) && (nuovaposS(1)~=--1) && (nuovaposS(2)~=--1)) && ...
                ((I(1)~=-1) && (I(2)~=-1) && (nuovaposI(1)~=-1) && (nuovaposI(2)~=-1))
            de2 = Distanza(nuovaposS, nuovaposI)/(2*resize);
        end
        
        
    %Assegnazione dei punti nel vettore V e CONT
        V = [E/resize;
            D/resize;
            S/resize;
            I/resize;
            nuovaposI/resize;
            nuovaposS/resize
            ];
        CONT(1) = 0;
        CONT(2) = esiste;
        if (exist('de2','var'))
            CONT(3)= de2;
        end
    end
end