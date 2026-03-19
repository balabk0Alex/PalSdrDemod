%gen  [] -> one_dim_array 
from_file_signal = read_from_file('/home/computer/Desktop/GitHub/ExplorePlutoSdr/SignalExampleForProcessing/PalSignal_ex');
end_p = 6800000;
from_file_signal = from_file_signal(1:end_p);
%test one_dim_array -> [] -> plot()
processStreamData(from_file_signal, "iq_mode");

