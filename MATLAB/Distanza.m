function  distanza  =  Distanza(x,y)
%  Questa funzione calcola la distanza Euclidea fra x e y
dif = x - y;
distanza = sqrt( sum(dif) .^ 2);
end
