%Proyecto 
% Equipo 4
% Juan Pablo Suástegui | A01066742
% Fernando Arrieta | A01336257
% Jorge Axel Correa | A01636607
% Nicolás Gamboa | AA01336257
% Javier Tena Estrada | A01067470

clc, clear
f=input('Introduzca la función f(x):');
fprintf('Seleccione el método por el cual desea resolver:\n1.-Bisección\t2.-Secante\t3.-Newthon Raphson\n');
o = input('Método deseado = ');

while ( o == 1)
    fprintf('Método de Bisección\n'); 
    h = inline(f);
    a = input('limite inf: ');
    b = input('limite sup: ');
    tol = input('tolerancia: ');

    c = 0;
    n = 0;
    MEP = (b-a)/2;
    fprintf('\tn\t\ta\t\tc\t\tb\t\tMEP\n');

    while(MEP > tol)
        c = (a +b) / 2;
        disp([n, a, c, b, MEP])
            if (h(a) * h(c) <0 )
            b = c;
            else 
            a = c
            end
        MEP = (b - a) / 2;
        n = n + 1;
    end
fprintf('raiz %f:\n\t%f\n', tol, c);
    break
end

while ( o == 2)
    fprintf('Método de Secante\n'); 
    h = inline(f);
    x0 = input('limite inf: ');
    x1 = input('limite sup: ');
    tol = input('tolerancia: ');

    error = 100;
    
    n=0;
    fprintf('n\tx0\tx1\tx2\terror\n');
    
    while(error > tol)
        x2 = x1 - (x1 - x0) * h(x1) / (h(x1) - h(x0));
        error = abs(h(x2));
        fprintf('%i\t%4.4f\t%4.4f\t%4.4f\t%4.4f\n',n,x0,x1,x2,error);
        x0 = x1;
        x1 = x2;
        n = n + 1;
    end
    fprintf('raiz = %f\n',x2);
    break
end

while ( o == 3)
    fprintf('Método Newthon Raphson\n'); 
    sf = str2sym(f);
    ezplot(sf);
    tol = input('tolerancia del metodo = ');
    x0 = input('valor inicial = ');
    v = symvar(sf);
    f1 = diff(sf);

    sw = 0;

        while (sw == 0)
            x1 = x0 - ( subs(sf, v, x0) / subs (f1, v, x0));
            if abs(x0 - x1) > tol;
                x0 = x1;
                sw = 0;
            else
            sw = 1;
            end
        end

    vpa(x1)
    break
end
