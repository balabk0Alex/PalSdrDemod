function [] = processStreamData(data, map_input_params )
addpath('../dev_function/detectFrames')
FS = map_input_params('FS');
mod = map_input_params('mod_process');
frame_sec = 0.01274;
frame_size = round(frame_sec * FS);


switch mod
    case "iq_mode"
        %TODO: 16.02.2026
        disp("TODO: 16.02.2026")
        tv_signal = fm_demod( data, "iq_mode");%<- here is IQ 





        
        len = length(data);
        I = data(1:2:len);
        Q = data(2:2:len);
        atv_signal = sqrt(I.^2 + Q.^2);


        %normalize
        
        frame_index = detect_frame(tv_signal, 1); 

        start_index_frame = frame_index(1);
        end_index_frame = frame_index(2);
        
         % if(end_index_frame < length(tv_signal) && start_index_frame > 0)
         %     frame = tv_signal(start_index_frame:end_index_frame);
         %     assignin('base', 'frame', frame );
         % else
         %     frame = zeros(1, frame_size);
         % end
         if(end_index_frame > length(tv_signal))
             end_index_frame = length(tv_signal);

         end

         frame = tv_signal(start_index_frame:end_index_frame);
         frame2 = atv_signal(start_index_frame:end_index_frame);






        assignin('base', 'tv_signal', tv_signal); 
        %%%%PROCESSING 

        n_str = 300;
        delta = 800;

       % delta_pulse = 1.5e4;
        %level = 0.8;
        %bin_signal = tv_signal < level;
        %assignin('base', 'bin_signal',  bin_signal); 
        %start_first_frame_index = detect_frames(m);
        %start_frame_index = start_first_frame_index + delta_pulse;
        %size_frame = round(1.65e5);
        %end_frame_index = start_frame_index + size_frame;
        %frame = tv_signal(start_frame_index:end_frame_index);

        [p, str_st]  = new_frame(frame, n_str, delta,1,0 );
        [p, str_st]  = new_frame(frame2, n_str, delta,str_st,1 );


      


        %%%
        if(false)
            write_in_file("signal_processing", tv_signal);
            disp("WRITE SUCCESS! ");

        end
       % tv_signal = tv_signal(1: 625 *64e-6 * FS );
        show_bw_image(p,delta, n_str, '2d_array');

       
    case "fm_mode"
        
end
