function show_bw_image(data, nRows, nCols, mod)
% SHOW_BW_IMAGE Отображает/Обновляет ЧБ изображение в одном окне.
% Работает как видеопоток: окно не закрывается, меняется только кадр.
%
% ВХОДНЫЕ ПАРАМЕТРЫ:
%   data  - одномерный массив (вектор) с данными пикселей.
%   nRows - количество строк изображения (высота).
%   nCols - количество столбцов (ширина).

switch (mod)

    case '2d_array'
        img_matrix = data;


    case '1d_array'
        totalPixels = nRows * nCols;
    if length(data) ~= totalPixels
        error('Ошибка: Длина массива (%d) не совпадает с размером (%d x %d).', ...
            length(data), nRows, nCols);
    end

    % 2. Формирование матрицы (Reshape)
    % Транспонирование (') обязательно для корректной ориентации строк
    img_matrix = reshape(data, nCols, nRows)';

end

    % 3. Поиск существующего окна и объекта изображения
    figTag = 'BW_Video_Window';
    hFig = findall(0, 'Tag', figTag);
    
    % Если окна нет — создаем его
    if isempty(hFig)
        hFig = figure('Name', 'Black & White Video', ...
                      'Color', 'w', ...
                      'Tag', figTag, ...
                      'NumberTitle', 'off', ...
                      'MenuBar', 'none', ... % Убираем меню для чистоты
                      'ToolBar', 'none');    % Убираем панель инструментов
        % Создаем объект изображения и сохраняем его дескриптор в UserData фигуры
        hImg = imshow(img_matrix, []);
        colormap(gray);
        title(['Изображение ' num2str(nRows) 'x' num2str(nCols)]);
        % Сохраняем handle изображения внутри фигуры для следующего раза
        setappdata(hFig, 'ImageHandle', hImg); 
    else
        % Если окно есть — достаем дескриптор изображения
        hImg = getappdata(hFig, 'ImageHandle');
        
        % Обновляем ТОЛЬКО данные пикселей (CData)
        set(hImg, 'CData', img_matrix);
        
        % Возвращаем фокус на окно (чтобы оно не ушло на задний план)
        figure(hFig); 
    end
    
    % Принудительная отрисовка кадра
    drawnow; 
end