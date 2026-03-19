function [frame, start_ind] = new_frame(tv_signal, n_str, delta, start_str_index, DEV );
data_from_file = tv_signal;

st_step = 1;
en_step = length(data_from_file);

data_from_file = data_from_file(st_step:en_step); 
data_from_file1 = data_from_file;
if(~DEV)
addpath('../../develop'); 
file_name = "../../develop/signal_processing";
data_from_file = tv_signal;

st_step = 1;
en_step = length(data_from_file);

data_from_file = data_from_file(st_step:en_step); 
data_from_file1 = data_from_file;

%frame = demod_pal_signal(tv_pal_signal)   ; 
%FS = 13500000;
%frame_t = 0.00005195 + 0.00001040;
%n_str= 600;
%str_sample = 860;
%start = 181727;
%data = data_from_file(st_step:n_str*str_sample);
%show_bw_image(data, str_sample, n_str)


%ALGORITM 1
%input data_from_file1
% k = 1:length(data_from_file);
 low_level = 1.8;
% for k = 1:length(data_from_file)
%     if(data_from_file1(k) < low_level)
% 
%     end
% end

less_then_low_level = data_from_file1 < low_level;
assignin('base', 'less_then_low_level', less_then_low_level); 


diff_les = [diff(less_then_low_level) 0];

%%%%
result = zeros(1, length(diff_les));
x = diff_les;

assignin('base', 'diff_les', diff_les); 


%%%%%%%FIND START INDEX ARRAY 
k_p = 1; 
v_p = 1;%if zero ??????

per = 10;
d = 64;
d_max = 64 +per/100*d ;
d_min = 64 - per/100*d;
for k = 2:length(diff_les)
    if(abs(x(k)) == 1)

        if(v_p == 1 && x(k) == -1)
            dist = k - k_p;
            if( dist < d_max && dist > d_min)
                result(k_p)=1;
                k_p = k;
                v_p = x(k);

            end
        else
            v_p = x(k);
            k_p = k;
        end
    end




end


assignin('base', 'result', result); 


start_str_index = find(result == 1);
white_level =100; 

black_level = -1;
%n_str = length(start_str_index);%%!!!!
%delta = 800;%111
picture = zeros(n_str, delta);


end%END DEVELOP 

white_level =0.8; 

black_level = -0.2;
%n_str = length(start_str_index);%%!!!!
%delta = 800;%111
picture = zeros(n_str, delta);

if(n_str > length(start_str_index))
    n_str = length(start_str_index);
end

for n = 1:n_str %!!!!!!!!!!ERROR CAN BE
    if (start_str_index(n) + delta-1 < length(data_from_file1))
        str = data_from_file1(start_str_index(n):(start_str_index(n) + delta-1));
    else 
      %  str = zeros(1, delta -1);
       % str(1:length(data_from_file1)- start_str_index(n)) = data_from_file1(start_str_index(n):length(data_from_file1));

    end
    %str1 = str(str > black_level & str < while_level);
    str1 = str;  % Копируем исходный массив
    ind_ = str > black_level & str < white_level;  % Исправлена опечатка
    str1(~ind_) = 0;                               % Обнуляем где условие НЕ выполняется
    norm_str = doubleToBytes(str1, 127);
    picture(n, :) =norm_str;

end
%assignin('base', 'result', result); 
frame = picture;
start_ind = start_str_index;



%%%%
%indexes = find(abs(diff_les) == 1);
%indexes_diff = diff(indexes);
%distance = 50;
% start_str =indexes(indexes_diff > distance);
% figure
% hold on
% fl = zeros(1,length(data_from_file1));
% fl(start_str) = 2;
% plot(fl);
% plot(data_from_file1)
