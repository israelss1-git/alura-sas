LIBNAME ALURA "/folders/myfolders/AluraPlay";

PROC DATASETS
	LIB=ALURA DETAILS;
RUN;

data teste1;
	set alura.cadastro_cliente;
	
	format Estado $14.;
	
	if "01000-000" <= cep <= "09999-999" then 
		Estado="Grande SP";
	else if "10000-000" <= cep <= "19999-999" then 
		Estado="Interior SP";
	else if "20000-000" <= cep <= "28999-999" then 
		Estado="Rio de Janeiro";
	else if "30000-000" <= cep <= "39999-999" then 
		Estado="Minas Gerais";
	else if "80000-000" <= cep <= "87999-999" then 
		Estado="Paraná";
	else 
		Estado="Demais estados";
run;

proc freq data=teste1;
	table Estado /missing;
run;

data teste2;
	set alura.cadastro_cliente;
	
	precep = substr(cep, 1, 2);
	precep2 = input(precep, 2.);
	precep3 = substr(precep, 1, 2)*1;
	precep4 = input(precep, best.);
	precep5 = input(substr(cep, 1, 2), best.);
run;