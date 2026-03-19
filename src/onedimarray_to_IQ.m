function [I, Q] = onedimarray_to_IQ(array)
size = length(array);

I = array(1:2:size);
Q = array(2:2:size);


end
