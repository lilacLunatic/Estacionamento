--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.2
-- Dumped by pg_dump version 9.3.2
-- Started on 2015-06-12 17:14:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1990 (class 1262 OID 27449)
-- Name: cinema; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE cinema WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE cinema OWNER TO postgres;

\connect cinema

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 179 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 179
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 176 (class 1259 OID 27489)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE admin (
    login character varying NOT NULL,
    senha_md5 character varying
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 27501)
-- Name: classificacao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE classificacao (
    id integer NOT NULL,
    descricao character varying
);


ALTER TABLE public.classificacao OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 27499)
-- Name: classificacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE classificacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classificacao_id_seq OWNER TO postgres;

--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 177
-- Name: classificacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE classificacao_id_seq OWNED BY classificacao.id;


--
-- TOC entry 171 (class 1259 OID 27452)
-- Name: filme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE filme (
    titulo character varying,
    genero integer,
    classificacao integer,
    direcao character varying,
    elenco character varying,
    sinopse text,
    link_trailer character varying,
    id integer NOT NULL,
    duracao interval
);


ALTER TABLE public.filme OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 27450)
-- Name: filme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE filme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filme_id_seq OWNER TO postgres;

--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 170
-- Name: filme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE filme_id_seq OWNED BY filme.id;


--
-- TOC entry 175 (class 1259 OID 27478)
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE genero (
    id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 27476)
-- Name: genero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genero_id_seq OWNER TO postgres;

--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 174
-- Name: genero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genero_id_seq OWNED BY genero.id;


--
-- TOC entry 173 (class 1259 OID 27465)
-- Name: sessao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessao (
    id integer NOT NULL,
    filme integer,
    horario timestamp without time zone,
    valor_adulto money,
    valor_estudante money,
    valor_idoso money,
    is3d boolean,
    is_legendado boolean,
    sala integer
);


ALTER TABLE public.sessao OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 27463)
-- Name: sessao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessao_id_seq OWNER TO postgres;

--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 172
-- Name: sessao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessao_id_seq OWNED BY sessao.id;


--
-- TOC entry 1852 (class 2604 OID 27504)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classificacao ALTER COLUMN id SET DEFAULT nextval('classificacao_id_seq'::regclass);


--
-- TOC entry 1849 (class 2604 OID 27455)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY filme ALTER COLUMN id SET DEFAULT nextval('filme_id_seq'::regclass);


--
-- TOC entry 1851 (class 2604 OID 27481)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genero ALTER COLUMN id SET DEFAULT nextval('genero_id_seq'::regclass);


--
-- TOC entry 1850 (class 2604 OID 27468)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessao ALTER COLUMN id SET DEFAULT nextval('sessao_id_seq'::regclass);


--
-- TOC entry 1983 (class 0 OID 27489)
-- Dependencies: 176
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO admin (login, senha_md5) VALUES ('admin', '"21232f297a57a5a743894a0e4a801fc3"');


--
-- TOC entry 1985 (class 0 OID 27501)
-- Dependencies: 178
-- Data for Name: classificacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO classificacao (id, descricao) VALUES (1, 'livre');
INSERT INTO classificacao (id, descricao) VALUES (2, '12+');
INSERT INTO classificacao (id, descricao) VALUES (3, '16+');
INSERT INTO classificacao (id, descricao) VALUES (4, '18+');
INSERT INTO classificacao (id, descricao) VALUES (5, '14+');


--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 177
-- Name: classificacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('classificacao_id_seq', 5, true);


--
-- TOC entry 1978 (class 0 OID 27452)
-- Dependencies: 171
-- Data for Name: filme; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO filme (titulo, genero, classificacao, direcao, elenco, sinopse, link_trailer, id, duracao) VALUES ('mad max', 1, 2, 'superman', 'chimbinha;ekko', 'o mad max vence', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 1, '02:00:00');
INSERT INTO filme (titulo, genero, classificacao, direcao, elenco, sinopse, link_trailer, id, duracao) VALUES ('jurassic world', 1, 2, 'direcao', 'amarante sniper 666', 'dino', 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 2, '01:59:00');


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 170
-- Name: filme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('filme_id_seq', 2, true);


--
-- TOC entry 1982 (class 0 OID 27478)
-- Dependencies: 175
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO genero (id, descricao) VALUES (1, 'acao');
INSERT INTO genero (id, descricao) VALUES (2, 'romance');
INSERT INTO genero (id, descricao) VALUES (3, 'comedia');
INSERT INTO genero (id, descricao) VALUES (4, 'drama');
INSERT INTO genero (id, descricao) VALUES (5, 'suspense');
INSERT INTO genero (id, descricao) VALUES (6, 'classico');
INSERT INTO genero (id, descricao) VALUES (7, 'faroeste');
INSERT INTO genero (id, descricao) VALUES (8, 'outro');
INSERT INTO genero (id, descricao) VALUES (9, 'aventura');


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 174
-- Name: genero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genero_id_seq', 9, true);


--
-- TOC entry 1980 (class 0 OID 27465)
-- Dependencies: 173
-- Data for Name: sessao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sessao (id, filme, horario, valor_adulto, valor_estudante, valor_idoso, is3d, is_legendado, sala) VALUES (1, 1, '2015-12-01 18:00:00', 'R$ 40,00', 'R$ 20,00', 'R$ 21,00', true, true, 7);
INSERT INTO sessao (id, filme, horario, valor_adulto, valor_estudante, valor_idoso, is3d, is_legendado, sala) VALUES (2, 2, '2015-12-01 20:30:00', 'R$ 39,00', 'R$ 19,00', 'R$ 20,00', true, true, 7);


--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 172
-- Name: sessao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessao_id_seq', 2, true);


--
-- TOC entry 1864 (class 2606 OID 27496)
-- Name: admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (login);


--
-- TOC entry 1866 (class 2606 OID 27509)
-- Name: classificacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY classificacao
    ADD CONSTRAINT classificacao_pk PRIMARY KEY (id);


--
-- TOC entry 1868 (class 2606 OID 27511)
-- Name: classificacao_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY classificacao
    ADD CONSTRAINT classificacao_unique UNIQUE (descricao);


--
-- TOC entry 1854 (class 2606 OID 27460)
-- Name: filme_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filme
    ADD CONSTRAINT filme_pk PRIMARY KEY (id);


--
-- TOC entry 1856 (class 2606 OID 27462)
-- Name: filme_titulo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY filme
    ADD CONSTRAINT filme_titulo_unique UNIQUE (titulo);


--
-- TOC entry 1862 (class 2606 OID 27486)
-- Name: genero_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genero
    ADD CONSTRAINT genero_pk PRIMARY KEY (id);


--
-- TOC entry 1858 (class 2606 OID 27470)
-- Name: sessao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessao
    ADD CONSTRAINT sessao_pk PRIMARY KEY (id);


--
-- TOC entry 1860 (class 2606 OID 27498)
-- Name: sessao_unique_horario_sala; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessao
    ADD CONSTRAINT sessao_unique_horario_sala UNIQUE (horario, sala);


--
-- TOC entry 1869 (class 2606 OID 27471)
-- Name: sessao_filme_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessao
    ADD CONSTRAINT sessao_filme_fk FOREIGN KEY (filme) REFERENCES filme(id) ON DELETE CASCADE;


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-06-12 17:14:42

--
-- PostgreSQL database dump complete
--

