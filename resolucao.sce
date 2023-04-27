function f = fun(x)
   f = [x(1)+x(2)-3; x(1)^2+x(2)^2-9];//função a ser minimazada
endfunction
function G = jacob(x)
   G = [1 1; 2*x(1) 2*x(2)]; //jacobiana da função
endfunction


x0 = rand(2,1); //chutes iniciais randomicos
max_iter = 100; //numero maximo de interações
tol = 1e-4; //precisão dos chutes realizados
iter = 0; //iterações realizadas pelo programa
error = tol + 1; //condição de parada pela precisão



while (iter < max_iter && error > tol)
    //injetando os chutes nas funções
    f = fun(x0);
    G = jacob(x0);
    
    //Calculo dos valores ótimos para x
    S = -G\f;
    x1 = x0 + S;
    
    //Condição de parada
    error = max(abs(x1 - x0));
    
    x0 = x1;//x recebendo o novo valor ótimo
    iter = iter + 1;//incrementando o contador de interações
end

if (iter >= max_iter)//condição de parada caso as interações excedam o limite
    disp("Não foi possível encontrar o mínimo em ", max_iter, " iterações.");
else//disposição dos resultados
    disp("Valor ótimo:")
    disp(x0)
    disp("Número de iterações:")
    disp(iter)
    disp("Erro:")
    disp(error)

end

//Exibição do grafico
function f = fun(x)
   f = [x(1)+x(2)-3; x(1)^2+x(2)^2-9];//n sei pq tive que recirar a função aqui
endfunction

x = linspace(-10, 10, 100);//dimensoes do grafico
y = linspace(-10, 10, 100);

[X, Y] = meshgrid(x, y);

Z1 = X + Y - 3; //calculo do f(x)
Z2 = X.^2 + Y.^2 - 9;//calculo do g(x)

//Desenho dos graficos com as dimensões e o array de resultados da função
figure();
subplot(1, 2, 1);
surf(X, Y, Z1);
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
title('Superfície de otimalidade da função f(x,y)')

subplot(1, 2, 2);
surf(X, Y, Z2);
xlabel('x')
ylabel('y')
zlabel('g(x,y)')
title('Superfície de otimalidade da função g(x,y)')


