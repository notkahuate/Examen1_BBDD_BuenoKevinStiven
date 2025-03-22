create database Universidad;

use Universidad;

create table departamento(
    id int(10) primary key,
    nombre varchar(50)
);

create table grado(
    id int(10) primary key,
    nombre varchar(100)
);

create table curso_escolar(
    id int(10) primary key,
    anyo_inicio year(4),
    anyo_fin year(4)
);

create table alumno(
    id int primary key,
    nif varchar(9),
    nombre varchar(25),
    apellido1 varchar(50),
    apellido2 varchar(50),
    ciudad varchar(25),
    direccion varchar(50),
    telefono varchar(9),
    fecha_nacimiento date,
    sexo ENUM ('H', 'M')
);


create table profesor (
    id int primary key,
    nif varchar(9),
    nombre varchar(25),
    apellido1 varchar(50),
    apellido2 varchar(50),
    ciudad varchar(25),
    direccion varchar(50),
    telefono varchar(9),
    fecha_nacimiento date,
    sexo ENUM ('M', 'H'),
    id_departamento int,
    foreign key (id_departamento) references departamento(id)
);

create table asignatura (
    id int primary key,
    nombre varchar(100),
    credito float,
    tipo ENUM ('obligatoria', 'basica'),
    curso tinyint(3),
    cuartimestre tinyint(3),
    id_profesor int,
    id_grado int,
    foreign key (id_profesor) references profesor(id),
    foreign key (id_grado) references grado(id)

);

create table alumno_se_matricula_asignatura(
    id_alumno int,
    id_asignatura int,
    id_curso_escolar int,
    primary key (id_alumno, id_asignatura, id_curso_escolar),
    foreign key (id_alumno) references alumno(id),
    foreign key (id_asignatura) references asignatura(id),
    foreign key (id_curso_escolar) references curso_escolar(id)
);

