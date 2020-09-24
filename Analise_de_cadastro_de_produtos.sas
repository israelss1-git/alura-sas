LIBNAME ALURA "/folders/myfolders/AluraPlay";

PROC DATASETS
	LIB=ALURA DETAILS;
RUN;

PROC CONTENTS
	DATA = ALURA.cadastro_produto;
RUN;

PROC PRINT
	DATA = ALURA.cadastro_cliente;
RUN;

PROC FREQ
	DATA=alura.cadastro_produto nlevels;
	TABLE PLATAFORMA PRECO;
RUN;

DATA PRODUTO2;
	SET ALURA.cadastro_produto;
	
	IF DATA > 201606
		THEN lancamento = 1;
		ELSE lancamento = 0;
		
	IF DATA < 201401
		THEN antigo = 1;
		ELSE antigo = 0;		

PROC PRINT
	DATA=produto2 NOOBS;
	
PROC FREQ
	DATA=produto2;
	TABLE lancamento antigo;
	
RUN;

PROC FREQ
	DATA = produto2;
	table genero*lancamento
	/nocol norow nopercent;
RUN;

PROC FREQ
    data = alura.cadastro_produto;
    table plataforma*genero
    / list nopercent;
RUN;

PROC FREQ
    data = alura.cadastro_produto;
    table nome*genero
    / list nocum;
RUN;

data alura.cadastro_produto_v2;
	set produto2;
	rename lancamento = flag_lancamento;
	label genero = "Gênero"
		  lancamento = "Marca 1 para jogos lancados após junho de 2016 e 0 para anteriores";
run;
	



