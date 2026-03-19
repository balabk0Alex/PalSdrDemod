function data = read_from_file(Name_file)

fid = fopen(Name_file, 'r');
    if fid == -1
        error(['Не удалось открыть файл: ', Name_file]);
    end
    
data = fread(fid, inf,"float32");
data = data';
fclose(fid);
