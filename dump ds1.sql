--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-06-17 16:35:57 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 198 (class 1255 OID 16613)
-- Name: altera_salario(integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION altera_salario(integer, numeric) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
declare
v_nome func.nome%type;
v_salario func.salario%type;
p_codigo alias for $1;
p_aumento alias for $2;
begin
select into v_nome,v_salario nome,salario from func where codigo=p_codigo;
raise notice'nome:%',v_nome;
raise notice'salario atual:%',v_salario;
v_salario:=v_salario+p_aumento;
raise notice'novo salario:%',v_salario;
update func set salario=v_salario where codigo=p_codigo;
return 't';
end;
$_$;


ALTER FUNCTION public.altera_salario(integer, numeric) OWNER TO postgres;

--
-- TOC entry 199 (class 1255 OID 16614)
-- Name: contador_cli(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION contador_cli() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
registro record;
qtde integer;
begin
qtde:=0;
for registro in select * from func loop
qtde:=qtde+1;
raise notice 'nome:%,salario:%,codigo:%',registro.nome,registro.salario,registro.codigo;
end loop;
return qtde;
end;
$$;


ALTER FUNCTION public.contador_cli() OWNER TO postgres;

--
-- TOC entry 200 (class 1255 OID 16615)
-- Name: fatorial(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION fatorial(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$

declare

arg integer;

begin

arg := $1;

if arg is null or arg < 0 then

raise notice 'valor inválido!';

return null;

else

if arg = 1 then

return 1;

else

declare

next_value integer;

begin

next_value := fatorial(arg-1)*arg;

return next_value;

end;

end if;

end if;

end;

$_$;


ALTER FUNCTION public.fatorial(integer) OWNER TO postgres;

--
-- TOC entry 201 (class 1255 OID 16616)
-- Name: fatorial2(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION fatorial2(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
declare
arg integer;
begin
arg := $1;
if arg is null or arg < 0 then
raise notice 'valor invalido';
return null;
else
if arg = 1 then
return 1;
else
declare
next_value integer;
begin
next_value:=fatorial(arg-1)*arg;
return next_value;
end;
end if;
end if;
end;
$_$;


ALTER FUNCTION public.fatorial2(integer) OWNER TO postgres;

--
-- TOC entry 202 (class 1255 OID 16617)
-- Name: media(numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION media(numeric, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
declare
result numeric;
begin
result:=($1+$2)/2;
return result;
end;
$_$;


ALTER FUNCTION public.media(numeric, numeric) OWNER TO postgres;

--
-- TOC entry 203 (class 1255 OID 16618)
-- Name: media(numeric, numeric, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION media(numeric, numeric, numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $_$
declare
result numeric;
begin
result:=($4+$5+$6)/3;
return result;
end;
$_$;


ALTER FUNCTION public.media(numeric, numeric, numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 16627)
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE entrada (
    id integer NOT NULL,
    hora_entrada timestamp without time zone,
    hora_saida timestamp without time zone,
    placa_veiculo character varying,
    valor money,
    andar_vaga integer,
    numero_vaga integer
);


ALTER TABLE public.entrada OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16633)
-- Name: entrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE entrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entrada_id_seq OWNER TO postgres;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 176
-- Name: entrada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE entrada_id_seq OWNED BY entrada.id;


--
-- TOC entry 177 (class 1259 OID 16635)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE funcionario (
    id integer NOT NULL,
    login character varying NOT NULL,
    senha character varying,
    admin boolean NOT NULL
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16641)
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE funcionario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcionario_id_seq OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 178
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE funcionario_id_seq OWNED BY funcionario.id;


--
-- TOC entry 179 (class 1259 OID 16643)
-- Name: preco; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE preco (
    id integer NOT NULL,
    valor money,
    tipo integer
);


ALTER TABLE public.preco OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16646)
-- Name: preco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE preco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preco_id_seq OWNER TO postgres;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 180
-- Name: preco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE preco_id_seq OWNED BY preco.id;


--
-- TOC entry 181 (class 1259 OID 16648)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo (
    id integer NOT NULL,
    nome character varying
);


ALTER TABLE public.tipo OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16654)
-- Name: tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_id_seq OWNER TO postgres;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 182
-- Name: tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_id_seq OWNED BY tipo.id;


--
-- TOC entry 183 (class 1259 OID 16656)
-- Name: vaga; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vaga (
    andar integer NOT NULL,
    numero integer NOT NULL,
    tipo_vaga integer
);


ALTER TABLE public.vaga OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16659)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE veiculo (
    placa character varying(8) NOT NULL,
    tipo integer,
    marca character varying,
    modelo character varying,
    cor character varying,
    CONSTRAINT veiculo_placa_fmt CHECK (((placa)::text ~ '[A-Z]{3}-[0-9]{4}'::text))
);


ALTER TABLE public.veiculo OWNER TO postgres;

--
-- TOC entry 1912 (class 2604 OID 16668)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada ALTER COLUMN id SET DEFAULT nextval('entrada_id_seq'::regclass);


--
-- TOC entry 1913 (class 2604 OID 16669)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY funcionario ALTER COLUMN id SET DEFAULT nextval('funcionario_id_seq'::regclass);


--
-- TOC entry 1914 (class 2604 OID 16670)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preco ALTER COLUMN id SET DEFAULT nextval('preco_id_seq'::regclass);


--
-- TOC entry 1915 (class 2604 OID 16671)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo ALTER COLUMN id SET DEFAULT nextval('tipo_id_seq'::regclass);


--
-- TOC entry 2041 (class 0 OID 16627)
-- Dependencies: 175
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 176
-- Name: entrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('entrada_id_seq', 1, false);


--
-- TOC entry 2043 (class 0 OID 16635)
-- Dependencies: 177
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO funcionario (id, login, senha, admin) VALUES (4, 'joao', 'mango', false);


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 178
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('funcionario_id_seq', 4, true);


--
-- TOC entry 2045 (class 0 OID 16643)
-- Dependencies: 179
-- Data for Name: preco; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 180
-- Name: preco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('preco_id_seq', 1, false);


--
-- TOC entry 2047 (class 0 OID 16648)
-- Dependencies: 181
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo (id, nome) VALUES (1, 'Carro');
INSERT INTO tipo (id, nome) VALUES (2, 'Moto');
INSERT INTO tipo (id, nome) VALUES (3, 'Utilitario');


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 182
-- Name: tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_id_seq', 3, true);


--
-- TOC entry 2049 (class 0 OID 16656)
-- Dependencies: 183
-- Data for Name: vaga; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2050 (class 0 OID 16659)
-- Dependencies: 184
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO veiculo (placa, tipo, marca, modelo, cor) VALUES ('ABC-1234', 1, 'Honda', '2013', 'Agouti');
INSERT INTO veiculo (placa, tipo, marca, modelo, cor) VALUES ('CDE-5555', 2, 'smt', '2000', 'avc');


--
-- TOC entry 1918 (class 2606 OID 16675)
-- Name: entrada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT entrada_pkey PRIMARY KEY (id);


--
-- TOC entry 1920 (class 2606 OID 16677)
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- TOC entry 1922 (class 2606 OID 16679)
-- Name: preco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY preco
    ADD CONSTRAINT preco_pkey PRIMARY KEY (id);


--
-- TOC entry 1924 (class 2606 OID 16681)
-- Name: tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 1926 (class 2606 OID 16683)
-- Name: vaga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vaga
    ADD CONSTRAINT vaga_pkey PRIMARY KEY (andar, numero);


--
-- TOC entry 1928 (class 2606 OID 16685)
-- Name: veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (placa);


--
-- TOC entry 1929 (class 2606 OID 16686)
-- Name: entrada_andar_vaga_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT entrada_andar_vaga_fkey FOREIGN KEY (andar_vaga, numero_vaga) REFERENCES vaga(andar, numero);


--
-- TOC entry 1930 (class 2606 OID 16691)
-- Name: entrada_placa_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY entrada
    ADD CONSTRAINT entrada_placa_veiculo_fkey FOREIGN KEY (placa_veiculo) REFERENCES veiculo(placa);


--
-- TOC entry 1931 (class 2606 OID 16696)
-- Name: preco_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY preco
    ADD CONSTRAINT preco_tipo_fkey FOREIGN KEY (tipo) REFERENCES tipo(id);


--
-- TOC entry 1933 (class 2606 OID 16701)
-- Name: tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT tipo_fkey FOREIGN KEY (tipo) REFERENCES tipo(id);


--
-- TOC entry 1932 (class 2606 OID 16706)
-- Name: vaga_tipo_vaga_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vaga
    ADD CONSTRAINT vaga_tipo_vaga_fkey FOREIGN KEY (tipo_vaga) REFERENCES tipo(id);


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-06-17 16:35:57 BRT

--
-- PostgreSQL database dump complete
--

