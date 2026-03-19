function  write_in_file(Name_file, data )

fid = fopen(Name_file, 'w');
    if fid == -1
        error(['Не удалось открыть файл: ', Name_file]);
    end
    fwrite(fid, data,'float32')
fclose(fid);
