function out = detect_frame(tv_signal, params)
DEV = true;
a = addpath('../dev_function/detectFrames/utils/');
%normalize 
if(~DEV)
    normalize_tv_signal = aaaa;%here normalize
else 
    tv_signal = tv_signal;%from .mat
    interval_sec = 0.00101333;
    frame_sec = 0.01274;
    FS = 13500000;
    k = 5 ;
    n = 10 ;
    less_level = mean(tv_signal) ;
    duration_pulse = round(interval_sec * FS);
    frame_size = 2.58e5;
end
normalize_tv_signal = tv_signal;
bin_signal = normalize_tv_signal < less_level;

first_between_frame = find_pulse_v1( bin_signal, duration_pulse, k, n);
assignin('base', 'bin_signal', bin_signal );
assignin('base', 'tv_signal', tv_signal );
st_ind = first_between_frame(1);
end_ind = first_between_frame(2);

if(~st_ind && ~end_ind)
    st_ind = 1;
    end_ind = 1 + frame_size;

end



start_frame = end_ind;
end_frame = start_frame + frame_size; 

out = [start_frame end_frame];
%specify index 
%out = [start_frame end_frame];

end