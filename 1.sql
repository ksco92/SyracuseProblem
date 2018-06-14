declare
    cursor cur_sir is
        select n from siracusa;

    sol varchar2(1000);
    valor number;

begin
    for sir in cur_sir loop

        valor := sir.n;
        sol := to_char(sir.n);

        while valor != 1 loop

            if mod(valor, 2) = 0 then
                valor := valor / 2;
                sol := sol || ', ' || to_char(valor);
            else
                valor := (valor * 3) + 1;
                sol := sol || ', ' || to_char(valor);
            end if;

        end loop;

        update siracusa set solucion = sol where n = sir.n;

    end loop;

end;
/