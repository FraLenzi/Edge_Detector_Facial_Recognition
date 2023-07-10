function mostraLandmarks(V,CONT,varv,landcont,grado)
%% Plot Sopracciglia con 2 Landmarks interpolati
if (landcont == 2)
    
    Elandmark =  V(1,:);
    Dlandmark =  V(2,:);
    
    vectx1 = [Elandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
    vecty1 = [Elandmark(1)+varv(1,2),Dlandmark(1)+varv(1,2)];
    
%Interpolazione polinomiale a tratti di grado 1
    if (grado==1)
    range1 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
    inter1 = interp1(vectx1,vecty1, range1, 'linear');
    plot(vectx1,vecty1,'yo','LineWidth',2);
    plot(range1,inter1, 'LineWidth',2, 'Color', '#00FF00');
%Interpolazione polinomiale a tratti di grado 2
    elseif (grado ==2)
    coeff1 = polyfit(vectx1,vecty1,grado);
    range1 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
    inter1 = polyval(coeff1,range1);
    plot(vectx1,vecty1,'yo','LineWidth',2);
    plot(range1,inter1, 'LineWidth',2, 'Color', '#00FF00');
    end
    
end

%% Plot Sopracciglia con 3 Landmarks interpolati
if (landcont == 3)
    Elandmark =  V(1,:);
    Dlandmark =  V(2,:);
    Slandmark =  V(3,:);
    
    vectx2 = [Elandmark(2)+varv(1,1),Slandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
    vecty2 = [Elandmark(1)+varv(1,2),Slandmark(1)+varv(1,2),Dlandmark(1)+varv(1,2)];

%Interpolazione polinomiale a tratti di grado 1
    if (grado==1)
        range2 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter2 = interp1(vectx2,vecty2, range2, 'linear');
        plot(vectx2,vecty2,'yo','LineWidth',2);
        plot(range2,inter2, 'LineWidth',2, 'Color', '#00FF00');
%Interpolazione polinomiale a tratti di grado 2
    elseif (grado ==2)
        coeff2 = polyfit(vectx2,vecty2,grado);
        range2 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter2 = polyval(coeff2,range2);
        plot(vectx2,vecty2,'yo','LineWidth',2);
        plot(range2,inter2, 'LineWidth',2, 'Color', '#00FF00');
    end
    
end

%% Plot Bocca e Occhi con 4 Landmarks interpolati
if (landcont == 4)
    
    Elandmark =  V(1,:);
    Dlandmark =  V(2,:);
    newposIlandmark =  V(5,:);
    newposSlandmark =  V(6,:);

    
    vectx3 = [Elandmark(2)+varv(1,1),newposSlandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
    vecty3 = [Elandmark(1)+varv(1,2),newposSlandmark(1)+varv(1,2),Dlandmark(1)+varv(1,2)];

    vectx4 = [Elandmark(2)+varv(1,1),newposIlandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
    vecty4 = [Elandmark(1)+varv(1,2),newposIlandmark(1)+varv(1,2),Dlandmark(1)+varv(1,2)];

%Interpolazione polinomiale a tratti di grado 1    
    if (grado==1)
        range3 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter3 = interp1(vectx3,vecty3, range3, 'linear');
        plot(vectx3,vecty3,'bo','LineWidth',2);
        plot(range3,inter3, 'LineWidth',2, 'Color', '#4DBEEE');
        range4 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter4 = interp1(vectx4,vecty4, range4, 'linear');
        plot(vectx4,vecty4,'bo','LineWidth',2);
        plot(range4,inter4, 'LineWidth',2, 'Color', '#4DBEEE');
%Interpolazione polinomiale a tratti di grado 2
    elseif (grado ==2)
        coeff3 = polyfit(vectx3,vecty3,2);
        range3 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter3 = polyval(coeff3,range3);
        plot(vectx3,vecty3,'bo','LineWidth',2);
        plot(range3,inter3, 'LineWidth',2, 'Color', '#4DBEEE');
        coeff4 = polyfit(vectx3,vecty4,3);
        range4 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter4 = polyval(coeff4,range4);
        plot(vectx4,vecty4,'bo','LineWidth',2);
        plot(range4,inter4, 'LineWidth',2, 'Color', '#4DBEEE');
    end 
end

%% Plot Bocca e Occhi con 5 Landmarks interpolati
if (landcont == 5)
    
    Elandmark =  V(1,:);
    Dlandmark =  V(2,:);
    newposIlandmark =  V(5,:);
    newposSlandmark =  V(6,:);
    de2 = CONT(3);


vectx5 = [Elandmark(2)+varv(1,1),newposSlandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
vecty5 = [Elandmark(1)+varv(1,2),newposSlandmark(1)+varv(1,2),Dlandmark(1)+varv(1,2)];

vectx6 = [Elandmark(2)+varv(1,1),newposIlandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
vecty6 = [Elandmark(1)+varv(1,2),newposIlandmark(1)+varv(1,2),Dlandmark(1)+varv(1,2)];

vectx7 = [Elandmark(2)+varv(1,1),newposSlandmark(2)+varv(1,1),Dlandmark(2)+varv(1,1)];
vecty7 = [Elandmark(1)+varv(1,2),newposSlandmark(1)+varv(1,2)+de2,Dlandmark(1)+varv(1,2)];

%Interpolazione polinomiale a tratti di grado 1
    if (grado==1)
        range5 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter5 = interp1(vectx5,vecty5, range5, 'linear');
        plot(vectx5,vecty5,'bo','LineWidth',2);
        plot(range5,inter5, 'LineWidth',2, 'Color', '#4DBEEE');
        range6 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter6 = interp1(vectx6,vecty6, range6, 'linear');
        plot(vectx6,vecty6,'bo','LineWidth',2);
        plot(range6,inter6, 'LineWidth',2, 'Color', '#4DBEEE');
        range7 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter7 = interp1(vectx7,vecty7, range7, 'linear');
        plot(vectx7,vecty7,'bo','LineWidth',2);
        plot(range7,inter7, 'LineWidth',2, 'Color', '#4DBEEE');
        
%Interpolazione polinomiale a tratti di grado 2
    elseif (grado ==2)
        coeff5 = polyfit(vectx5,vecty5,2);
        range5 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter5 = polyval(coeff5,range5);
        plot(vectx5,vecty5,'bo','LineWidth',2);
        plot(range5,inter5, 'LineWidth',2, 'Color', '#4DBEEE');
        coeff6 = polyfit(vectx6,vecty6,2);
        range6 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter6 = polyval(coeff6,range6);
        plot(vectx6,vecty6,'bo','LineWidth',2);
        plot(range6,inter6, 'LineWidth',2, 'Color', '#4DBEEE');
        coeff7 = polyfit(vectx7,vecty7,2);
        range7 = (Elandmark(2)+varv(1,1)):0.1:(Dlandmark(2)+varv(1,1));
        inter7 = polyval(coeff7,range7);
        plot(vectx7,vecty7,'bo','LineWidth',2);
        plot(range7,inter7, 'LineWidth',2, 'Color', '#4DBEEE');
    end 
end

end
       