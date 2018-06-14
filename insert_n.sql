declare
    col_n number := 1;

begin
    while col_n <= 255 loop
        insert into siracusa (n) values (col_n);
        col_n := col_n + 1;
    end loop;

end;
/