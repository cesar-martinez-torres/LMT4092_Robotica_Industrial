function generarSolucionesRobot()
    clc; clear; close all;

    % Pedir número de GDL
    n = input('¿Cuántos GDL tiene tu robot? ');

    % Recopilar soluciones posibles por articulación (pueden ser números o strings)
    soluciones_por_articulacion = cell(1, n);
    for i = 1:n
        num_sol = input(sprintf('¿Cuántas soluciones tiene la articulación %d? ', i));
        articulacion_i = cell(1, num_sol);
        for j = 1:num_sol
            val = input(sprintf('  Valor de solución %d para articulación %d (puede ser número o texto): ', j, i), 's');
            num_val = str2double(val);
            if isnan(num_val)
                articulacion_i{j} = val;  % texto
            else
                articulacion_i{j} = num_val;  % número
            end
        end
        soluciones_por_articulacion{i} = articulacion_i;
    end

    % Obtener todas las combinaciones
    combinaciones = allcomb(soluciones_por_articulacion{:});

    % Convertir todas las celdas a strings para la tabla
    combinaciones_str = strings(size(combinaciones));
    for i = 1:numel(combinaciones)
        combinaciones_str(i) = string(combinaciones{i});
    end

    % Mostrar tabla de soluciones
    fprintf('\nTabla de soluciones posibles:\n');
    headers = arrayfun(@(i) sprintf('q_%d', i), 1:n, 'UniformOutput', false);
    T = array2table(combinaciones_str, 'VariableNames', headers);
    disp(T)

    % Dibujar árbol
    figure('Name', 'Árbol de soluciones cinemáticas', 'NumberTitle', 'off');
    hold on; axis off;
    title('Árbol de soluciones cinemáticas');

    % Llamar recursivamente para graficar el árbol
    dibujar_nodo(soluciones_por_articulacion, [], 1, 0, 0, 50);
end

% Función recursiva para dibujar el árbol
function dibujar_nodo(sol_por_art, camino_actual, nivel, x, y, x_offset)
    if nivel > numel(sol_por_art)
        % Nodo hoja: mostrar solución completa como texto
        txt = sprintf('(%s)', strjoin(string(camino_actual), ', '));
        text(x, y - 1.5, txt, 'HorizontalAlignment', 'center', ...
            'FontWeight', 'bold', 'FontSize', 12);
        return;
    end

    valores = sol_por_art{nivel};
    num_hijos = numel(valores);
    total_span = (num_hijos - 1) * x_offset;

    for i = 1:num_hijos
        x_hijo = x - total_span/2 + (i-1)*x_offset;
        y_hijo = y - 10;
        nuevo_camino = [camino_actual, valores{i}];

        % Dibujar línea del padre al hijo
        line([x x_hijo], [y y_hijo], 'Color', [0.5 0.5 0.5]);

        % Dibujar nodo con texto (convertido a string)
        txt = string(valores{i});
        text(x_hijo, y_hijo, txt, 'HorizontalAlignment', 'center', ...
            'FontSize', 12);

        % Llamada recursiva
        dibujar_nodo(sol_por_art, nuevo_camino, nivel + 1, x_hijo, y_hijo, x_offset / 1.5);
    end
end

% Función auxiliar: combinaciones de celdas
function A = allcomb(varargin)
    args = varargin;
    n = nargin;
    [F{1:n}] = ndgrid(args{:});
    A = cell(numel(F{1}), n);
    for i = 1:n
        A(:, i) = reshape(F{i}, [], 1);
    end
end
