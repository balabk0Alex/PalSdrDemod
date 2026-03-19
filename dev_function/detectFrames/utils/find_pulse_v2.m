% --- Настройка параметров ---
filePath = fullfile('..', 'test/test1_find_pulse.mat');
data = load(filePath);
raw_signal = data.tv_signal; 

% Параметры (берем из контекста или задаем явно)
duration_pulse = 1.36e4; % Используем реальную длительность, а не 1.4e4
k = 5; 
threshold = -0.8;


bin_signal = raw_signal < threshold; 

size_signal = length(bin_signal);


pulse_template = ones(1, round(duration_pulse));


if length(pulse_template) > size_signal
    error('Длительность импульса больше длины сигнала!');
end

[corr_res, lags] = xcorr(bin_signal, pulse_template);
plot(lags, corr_res);