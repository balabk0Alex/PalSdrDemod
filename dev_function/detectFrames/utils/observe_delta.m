function result = observe_delta(signal_slice, n)
    % OBSERVE_DELTA Проверка количества нулей в бинарном массиве
    %   result = observe_delta(signal_slice, n) возвращает 1, если кол-во нулей <= n,
    %   и 0, если кол-во нулей > n.

    % Подсчет количества нулей в переданном фрагменте
    zeros_count = sum(signal_slice == 0);

    % Проверка условия
    if zeros_count <= n
        result = 1;
    else
        result = 0;
    end
end