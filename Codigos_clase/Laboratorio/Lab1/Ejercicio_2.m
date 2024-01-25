%% Lab 1 Ejercicio 2
figure('Name','Ejercicio 2')
I=SE2();  
F=SE2(4.5,1,35,'deg');
p1=SE2(1,0,0,'deg')
h=fill([4,5,5,4],[4,4,5,5],'red');
    h.FaceAlpha=0.3;
    hold on
    h1=fill([2,3,3,2],[0,0,3,3],'red');
    h1.FaceAlpha=0.3;
    h2=fill([0,0,1,1],[3.5,4.5,3.5,4.5],'red');
    h2.FaceAlpha=0.3;
    h3=fill([2,3,2,3],[3,3,4,4.5],'red');
    h3.FaceAlpha=0.3;
    trplot(I,'arrow','frame','Inicio')
    trplot(F,'arrow','frame','Fin','color','k')
    tranimate(p1)
    
    xlim([0 5.5]);
    ylim([0 5]);
    title('Ejercicio 2')