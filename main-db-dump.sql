--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2 (Debian 16.2-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.timeoffs DROP CONSTRAINT IF EXISTS fkmq92tq2v1osjttii4r52d3wfl;
ALTER TABLE IF EXISTS ONLY public.invitations DROP CONSTRAINT IF EXISTS fkc93ihvftpd11j547qgc9fobmc;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS fka1nclli5p7wblkociovr2hwbs;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS fk5p1ci5btqfwvtaqx5n2wxi182;
ALTER TABLE IF EXISTS ONLY public.invitations DROP CONSTRAINT IF EXISTS fk5biqc9oqg3bna6s2bqqx0y0u1;
ALTER TABLE IF EXISTS ONLY public.organisations DROP CONSTRAINT IF EXISTS fk3f1ljd0cqqjj0j39pdvlpd4mv;
ALTER TABLE IF EXISTS ONLY public.timeoffs DROP CONSTRAINT IF EXISTS fk2t4xko4opm75aqgtfundn4218;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.invitations DROP CONSTRAINT IF EXISTS ukld6rbd8u7g4us28ctp9nfty2e;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS uk_r43af9ap4edm43mmtq01oddj6;
ALTER TABLE IF EXISTS ONLY public.organisations DROP CONSTRAINT IF EXISTS uk_cl14qdjxea44tyhjbxcgfqk19;
ALTER TABLE IF EXISTS ONLY public.timeoffs DROP CONSTRAINT IF EXISTS timeoffs_pkey;
ALTER TABLE IF EXISTS ONLY public.organisations DROP CONSTRAINT IF EXISTS organisations_pkey;
ALTER TABLE IF EXISTS ONLY public.invitations DROP CONSTRAINT IF EXISTS invitations_pkey;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timeoffs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.organisations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.invitations ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.timeoffs_id_seq;
DROP TABLE IF EXISTS public.timeoffs;
DROP SEQUENCE IF EXISTS public.organisations_id_seq;
DROP TABLE IF EXISTS public.organisations;
DROP SEQUENCE IF EXISTS public.invitations_id_seq;
DROP TABLE IF EXISTS public.invitations;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: invitations; Type: TABLE; Schema: public; Owner: postgres-io
--

CREATE TABLE public.invitations (
    id bigint NOT NULL,
    invitee character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    inviter_id bigint NOT NULL,
    organisation_id bigint NOT NULL,
    CONSTRAINT invitations_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACCEPTED'::character varying, 'REJECTED'::character varying])::text[])))
);


ALTER TABLE public.invitations OWNER TO "postgres-io";

--
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-io
--

CREATE SEQUENCE public.invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invitations_id_seq OWNER TO "postgres-io";

--
-- Name: invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-io
--

ALTER SEQUENCE public.invitations_id_seq OWNED BY public.invitations.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: postgres-io
--

CREATE TABLE public.organisations (
    id bigint NOT NULL,
    address character varying(255),
    city character varying(255),
    country character varying(255),
    name character varying(255),
    phone_number character varying(255),
    preferred_language character varying(255),
    owner_id bigint NOT NULL
);


ALTER TABLE public.organisations OWNER TO "postgres-io";

--
-- Name: organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-io
--

CREATE SEQUENCE public.organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organisations_id_seq OWNER TO "postgres-io";

--
-- Name: organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-io
--

ALTER SEQUENCE public.organisations_id_seq OWNED BY public.organisations.id;


--
-- Name: timeoffs; Type: TABLE; Schema: public; Owner: postgres-io
--

CREATE TABLE public.timeoffs (
    id bigint NOT NULL,
    description text,
    from_date date NOT NULL,
    status character varying(255) NOT NULL,
    to_date date NOT NULL,
    type character varying(255) NOT NULL,
    employee_id bigint NOT NULL,
    manager_id bigint NOT NULL,
    CONSTRAINT timeoffs_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACCEPTED'::character varying, 'REJECTED'::character varying])::text[]))),
    CONSTRAINT timeoffs_type_check CHECK (((type)::text = ANY ((ARRAY['VACATION'::character varying, 'WORK_FROM_HOME'::character varying, 'MEDICAL_LEAVE'::character varying])::text[])))
);


ALTER TABLE public.timeoffs OWNER TO "postgres-io";

--
-- Name: timeoffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-io
--

CREATE SEQUENCE public.timeoffs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.timeoffs_id_seq OWNER TO "postgres-io";

--
-- Name: timeoffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-io
--

ALTER SEQUENCE public.timeoffs_id_seq OWNED BY public.timeoffs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres-io
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    city character varying(255),
    country character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone_number character varying(255),
    username character varying(255),
    manager_id bigint,
    organisation_id bigint,
    vacation_days bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO "postgres-io";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-io
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "postgres-io";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-io
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: invitations id; Type: DEFAULT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.invitations ALTER COLUMN id SET DEFAULT nextval('public.invitations_id_seq'::regclass);


--
-- Name: organisations id; Type: DEFAULT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.organisations ALTER COLUMN id SET DEFAULT nextval('public.organisations_id_seq'::regclass);


--
-- Name: timeoffs id; Type: DEFAULT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.timeoffs ALTER COLUMN id SET DEFAULT nextval('public.timeoffs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: invitations; Type: TABLE DATA; Schema: public; Owner: postgres-io
--

COPY public.invitations (id, invitee, status, inviter_id, organisation_id) FROM stdin;
5       sasa-comandantul@gmail.com      ACCEPTED        16      3
8       tester3@gmail.com       ACCEPTED        16      3
7       tester2@gmail.com       ACCEPTED        16      3
6       tester1@gmail.com       ACCEPTED        16      3
\.


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: postgres-io
--

COPY public.organisations (id, address, city, country, name, phone_number, preferred_language, owner_id) FROM stdin;
3       Hajdeu 41       Ialoveni        Moldova DanutuOrg       069721089       Romana  16
\.


--
-- Data for Name: timeoffs; Type: TABLE DATA; Schema: public; Owner: postgres-io
--

COPY public.timeoffs (id, description, from_date, status, to_date, type, employee_id, manager_id) FROM stdin;
1       Vreau sa ma odihnesc o zi       2024-04-19      PENDING 2024-04-19      VACATION        34      16
2       Vreau sa ma odihnesc inca o zi  2024-04-18      PENDING 2024-04-18      VACATION        34      16
3       Vreau sa ma odihnesc si pot     2024-04-22      ACCEPTED        2024-04-26      VACATION        34      16
4       Danutul ia concediu     2024-04-23      PENDING 2024-04-25      VACATION        16      16
5       Sasa ia work from home  2024-04-29      PENDING 2024-04-30      WORK_FROM_HOME  34      16
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres-io
--

COPY public.users (id, city, country, first_name, last_name, phone_number, username, manager_id, organisation_id, vacation_days) FROM stdin;
1       Ciorescu        Moldova Runi    Padurisca       0692pulisi4oua  runi-comandantul@gmail.com      \N      \N      0
34      Slobozia-Dusca  Moldova Sasco   Comandantul     069999999       sasa-comandantul@gmail.com      16      3       4
16      Ialoveni        Moldova Danutul Mamei   069721089       danutul-mamei@gmail.com \N      3       0
38      Slobozia-Dusca  Moldova tester3 tester  069333333       tester3@gmail.com       16      3       0
37      Slobozia-Dusca  Moldova tester2 tester  069222222       tester2@gmail.com       36      3       0
36      Slobozia-Dusca  Moldova tester1 tester  069111111       tester1@gmail.com       34      3       0
\.


--
-- Name: invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-io
--

SELECT pg_catalog.setval('public.invitations_id_seq', 8, true);


--
-- Name: organisations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-io
--

SELECT pg_catalog.setval('public.organisations_id_seq', 8, true);


--
-- Name: timeoffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-io
--

SELECT pg_catalog.setval('public.timeoffs_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-io
--

SELECT pg_catalog.setval('public.users_id_seq', 38, true);


--
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


--
-- Name: timeoffs timeoffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.timeoffs
    ADD CONSTRAINT timeoffs_pkey PRIMARY KEY (id);


--
-- Name: organisations uk_cl14qdjxea44tyhjbxcgfqk19; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT uk_cl14qdjxea44tyhjbxcgfqk19 UNIQUE (owner_id);


--
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: invitations ukld6rbd8u7g4us28ctp9nfty2e; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT ukld6rbd8u7g4us28ctp9nfty2e UNIQUE (invitee, organisation_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: timeoffs fk2t4xko4opm75aqgtfundn4218; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.timeoffs
    ADD CONSTRAINT fk2t4xko4opm75aqgtfundn4218 FOREIGN KEY (manager_id) REFERENCES public.users(id);


--
-- Name: organisations fk3f1ljd0cqqjj0j39pdvlpd4mv; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT fk3f1ljd0cqqjj0j39pdvlpd4mv FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: invitations fk5biqc9oqg3bna6s2bqqx0y0u1; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fk5biqc9oqg3bna6s2bqqx0y0u1 FOREIGN KEY (organisation_id) REFERENCES public.organisations(id);


--
-- Name: users fk5p1ci5btqfwvtaqx5n2wxi182; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk5p1ci5btqfwvtaqx5n2wxi182 FOREIGN KEY (manager_id) REFERENCES public.users(id);


--
-- Name: users fka1nclli5p7wblkociovr2hwbs; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fka1nclli5p7wblkociovr2hwbs FOREIGN KEY (organisation_id) REFERENCES public.organisations(id);


--
-- Name: invitations fkc93ihvftpd11j547qgc9fobmc; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fkc93ihvftpd11j547qgc9fobmc FOREIGN KEY (inviter_id) REFERENCES public.users(id);


--
-- Name: timeoffs fkmq92tq2v1osjttii4r52d3wfl; Type: FK CONSTRAINT; Schema: public; Owner: postgres-io
--

ALTER TABLE ONLY public.timeoffs
    ADD CONSTRAINT fkmq92tq2v1osjttii4r52d3wfl FOREIGN KEY (employee_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--
