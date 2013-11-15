
CREATE OR REPLACE PROCEDURE sup_views_sch is

CURSOR curs is
	select view_name from user_views;
monExc exception;
BEGIN
	for view_c in curs
	loop
		execute immediate 'drop view '||view_c.view_name||' cascade constraints';
		dbms_output.put_line('La view '||view_c.view_name||'a bien été supprimée');
		if view_c.view_name is null then raise monExc;
		end if;
	end loop;
exception
	when monExc then raise_application_error(-20000, 'il n''ya aucune view');
end;
/
	

