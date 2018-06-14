declare
    cursor cur_sol is
        select n,
        solucion,
        length(solucion) - length(replace(solucion,',')) as grado
        from siracusa;

    cursor cur_peso (sol_var varchar2) is
        select to_number(column_value) as id from xmltable(sol_var);

    grado number;
    p number(10,2);

begin

    for sol in cur_sol loop
        update siracusa set grado = sol.grado where n = sol.n;
    end loop;

    for sol in cur_sol loop

        grado := sol.grado;
        p := 0;

        for val in cur_peso(sol.solucion) loop
            p := p + val.id * grado;
            grado := grado - 1;
        end loop;

        p := p / 5;

        update siracusa set peso = p where n = sol.n;

    end loop;

end;
/