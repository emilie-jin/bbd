
CREATE OR REPLACE PROCEDURE sup is

CURSOR curs is
	select object_name from user_objects;
monExc exception;
BEGIN
	for c in curs
	loop
		execute immediate 'drop table '||c.object_name||' cascade constraints';
		if tab_c.table_name is null then raise monExc;
		end if;
	end loop;
exception
	when monExc then raise_application_error(-20000, 'il n''ya aucune table');
end;
/
	

