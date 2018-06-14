declare
    num number := &num;
    s varchar2(1000);
    g number;
    p number(10,2);
    t varchar2(5);

begin
    select
        n,
        solucion,
        grado,
        peso,
        case mod(n, 2)
            when 0 then 'Par'
            else 'Impar'
            end
    into num, s, g, p, t
    from siracusa
    where n = num;

    dbms_output.put_line('N = ' || num || '    Grado = ' || g || '    Peso = ' || p || '    Tipo = ' || t);
    dbms_output.put_line('Solucion = ' || s);

end;
/