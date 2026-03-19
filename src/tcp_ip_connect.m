%todo: detect video signal
DEV = true;
close all
clear all
%Input data
ip = "127.0.0.1";
port = 2000;
%
m =containers.Map;
FS = 13500000;
duration_signal = 10e-6;%seconds 
length_data = FS *duration_signal ;

%%%%
m('FS') = FS;
m('mod_process') = 'iq_mode';
m('sync_frame_level') = 0.8;
m('length_data') = length_data;
DEV = true;
%%%
if(DEV)
    length_data = 360e3*2;  
end
%
while (1)
    con = udpport("LocalHost", ip , "LocalPort" , port);
    val = read(con, length_data, "single");
    if (length_data > 0)

        processStreamData(val, m );
    end

    clear("con")
end