% Introduccion a Octave - 2022 - FCAI-UNCuyo - MoCCAI/DIMEC

% Unidad 4 - Programacion Estructurada
% Ejemplo empleando bucles for y while, se emplean break y continue

clc   %limpiamos la pantalla de la terminal de comandos
clear %borramos variables del espacio de trabajo

disp("###############  INICIO  ###############")
for i=1:10
    
    %Si el valor de i no es multiplo de 3 se "continua" con el sgte
    if mod(i,3) != 0
        printf("i=%d continue\n",i);
        continue;
    else
        printf("i=%d\n",i);
    endif
    
    %Inicializamos el valor de j empleado para evaluar la condicion
    j=sum(1:i);  %suma de los elementos [1,...,i] = 1+...+i
    
    %Si el valor acumulado en j es menor que 100 se ejecutan las sentencias
    while(j<100)  
        printf("  j=%d\n",j);
        if mod(j,2)==0  %si el valor de j es par se termina el while
            printf("  break\n",j);
            break;
        else
            j = j + ceil(10*rand(1,1));
        endif
    end
    
    %Si la suma de i+j es par se termina el bucle for de forma abrupta
    %[NO se recomienda realizar este tipo de terminaciones abruptas]
    if mod(i+j,5)==0
        printf("i+j=%d es multiplo de 5 ==> break!\n",i+j);
        break;
    endif

    disp("----------------- siguiente")
end

disp("##########  FIN  ##########")
