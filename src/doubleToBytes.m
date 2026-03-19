function bytes = doubleToBytes(array, max_byte)

min_v = min(array);
max_v = max(array);

norm_str = (array - min_v)/(max_v - min_v)*max_byte;

bytes = round(norm_str);
    


end