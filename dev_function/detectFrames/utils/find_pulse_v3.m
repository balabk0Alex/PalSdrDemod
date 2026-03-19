function [indexes , find_pulse_out] = find_pulse_v3( input_signal, duration_pulse, k, n)

window_len = round(duration_pulse);
% Скользящая сумма: считает количество единиц в окне длиной window_len
moving_sum = movsum(double(bin_signal), [window_len-1, 0]); 

% Находим максимум
[max_count, start_idx] = max(moving_sum);

% Проверка: если max_count близок к window_len, значит импульс найден
if max_count >= window_len * 0.9
    fprintf('Импульс найден через movsum: старт %d, конец %d\n', ...
        start_idx, start_idx + window_len - 1);
end