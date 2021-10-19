
create database DinDevs;

use DinDevs;

create table aluno	
(
	id_aluno		int 			not null auto_increment,
	id_logradouro	int				not null,
	nome			varchar(20) 	not null,
	sobrenome		varchar(30) 	not null,
	dt_nascimento	date			not null,
	constraint pk_aluno primary key (id_aluno),
	constraint fk_aluno_logradouro foreign key(id_logradouro)
	references logradouro(id_logradouro)
);

create table docaluno	
(
	id_docaluno		int 			not null auto_increment,
	id_aluno		int 			not null,
	telefone		varchar(20)		null,
	tipo_documento	varchar(20)		not null,
	n_documento		varchar(30)		not null,
	email			varchar(40)		not null,
	constraint pk_docaluno primary key (id_docaluno),
	constraint fk_docaluno_aluno foreign key (id_aluno)
	references aluno(id_aluno)
); 

create table professor
(
	id_professor	int 			not null auto_increment,
	id_logradouro	int				not null,
	nome			varchar(20) 	not null,
	sobrenome		varchar(30) 	not null,
	dt_nascimento	date			not null,
	constraint pk_professor primary key (id_professor), 
	constraint fk_professor_logradouro foreign key(id_logradouro)
	references logradouro (id_logradouro)
); 

create table docprofessor
(
	id_docprofessor	int 			not null auto_increment,
	id_professor	int				not null,
	telefone		varchar(20)		null,
	tipo_documento	varchar(20)		not null,
	n_documento		varchar(30)		not null,	
	email			varchar(40)		not null,
	constraint pk_docprofessor primary key (id_docprofessor),
	constraint fk_docprofessor_professor foreign key(id_professor)
	references professor(id_professor)
); 

create table logradouro
(
	id_logradouro	int				not null auto_increment,
	id_cidade		int				not null,
	nome			varchar(100)	not null,
	bairro			varchar(100)	not null,
	CEP				varchar(11)		not null,
	constraint pk_logradouro primary key (id_logradouro),
	constraint fk_logradouro_cidade foreign key (id_cidade)
	references cidade(id_cidade)
);

create table cidade
(	
	id_cidade		int				not null auto_increment,
	id_estado		int				not null,
	nome			varchar(100)	not null,
	ddd				varchar(2)		null,
	constraint pk_cidade primary key (id_cidade),
	constraint fk_cidade_estado foreign key(id_estado)
	references estado(id_estado)
);

create table estado
(	
	id_estado		int				not null auto_increment,
	nome			varchar(90)		not null,
	uf				varchar(2)		not null,
	constraint pk_estado primary key (id_estado)
);


create table curso
(
	id_curso		int 			not null auto_increment,
	nome			varchar(50) 	not null,
	duracao			varchar(30) 	not null,
	descricao		text			not null,
	constraint pk_curso primary key (id_curso)
); 

create table alunocurso
(
	id_alunocurso	int				not null auto_increment,
	id_curso		int 			not null,
	id_aluno		int			 	not null,
	constraint pk_alunocurso primary key (id_alunocurso),
	constraint fk_alunocurso_curso foreign key (id_curso)
	references curso(id_curso),
	constraint fk_alunocurso_aluno foreign key (id_aluno)
	references aluno(id_aluno)
); 

create table professorcurso
(	
	id_profcurso	int				not null auto_increment,
	id_curso		int 			not null,
	id_professor	int			 	not null,
	constraint pk_professorcurso primary key (id_profcurso),			
	constraint fk_professorcurso_curso foreign key (id_curso)
	references curso(id_curso),
	constraint fk_professorcurso_professor foreign key (id_professor)
	references professor(id_professor)
);

create table postblog
(
	id_post			int				not null auto_increment,
	id_professor	int				not null,
	dt_criacao		date			not null,
	titulo			varchar(50)		not null,
	publi			longtext		not null,
	constraint pk_postblog primary key (id_post),
	constraint fk_postblog_professor foreign key (id_professor)
	references professor(id_professor)	
);	

create table depoimento
(
	id_depoimento	int 			not null auto_increment,
	id_aluno		int				not null,
	depoimento		text			not null,
	constraint pk_depoimento primary key (id_depoimento),
	constraint fk_depoimento_aluno foreign key (id_aluno)
	references aluno(id_aluno)
);

create table pagamento
(
	id_pagamento	int				not null auto_increment,
	id_aluno		int				not null,
	id_curso		int				not null,
	forma_pgto		varchar(15)		not null,
	parcelas		int				null,
	valor			decimal(8,2)	not null,
	constraint pk_pagamento primary key (id_pagamento),
	constraint fk_pagamento_aluno foreign key (id_aluno)
	references aluno(id_aluno),
	constraint fk_pagamento_curso foreign key (id_curso)
	references curso(id_curso)	
);	

insert into curso (nome, duracao, descricao) values
('Investimento para iniciantes', '15 horas','São excelentes os motivos para começar a investir o seu dinheiro, mas por onde começar? Essa dúvida é comum, e se você se identifica, venha conosco que iremos te ajudar!'),
('Poupando e Rendendo', '25 horas','Já investe e é atuante no mercado financeiro mas se sente estagnado? Te damos uma mãozinha para mudar esse status!'),
('Independência financeira', '30 horas','Conquiste sua tão sonhada independência financeira definitivamente com a gente!');

select * from curso; 
