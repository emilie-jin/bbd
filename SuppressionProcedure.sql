

CREATE OR REPLACE PROCEDURE sup_pros_sch is

CURSOR curs is
	select procedure_name from user_procedures;
monExc exception;
BEGIN
	for procedure_c in curs
	loop
		execute immediate 'drop procedure '||procedure_c.procedure_name||' cascade constraints';
		dbms_output.put_line('Le procedure '||procedure_c.procedure_name||'a bien été supprimée');
		if procedure_c.procedure_name is null then raise monExc;
		end if;
	end loop;
exception
	when monExc then raise_application_error(-20000, 'il n''ya aucune procedure');
end;
/
	

