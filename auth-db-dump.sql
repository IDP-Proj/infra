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

ALTER TABLE IF EXISTS ONLY public.client_token_settings DROP CONSTRAINT IF EXISTS fktnknkoj5uh8nd50k4o8xw87qi;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS fkplv86ks0kud2ne4c8pqje98u8;
ALTER TABLE IF EXISTS ONLY public.client_authentication_method DROP CONSTRAINT IF EXISTS fko1e3iawyo0982rcv7mpchom46;
ALTER TABLE IF EXISTS ONLY public.redirect_urls DROP CONSTRAINT IF EXISTS fknhwi3aa713jloc3p0tx9rdbau;
ALTER TABLE IF EXISTS ONLY public.authorities DROP CONSTRAINT IF EXISTS fkk91upmbueyim93v469wj7b2qh;
ALTER TABLE IF EXISTS ONLY public.client_grant_type DROP CONSTRAINT IF EXISTS fkdfjrbs80lislno3r42o5tu13t;
ALTER TABLE IF EXISTS ONLY public.client_authentication_method DROP CONSTRAINT IF EXISTS fkckt8k7yber0qgu146i8q47a5g;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS fk7nlsegqg2xdt4v04u3htr39lb;
ALTER TABLE IF EXISTS ONLY public.client_grant_type DROP CONSTRAINT IF EXISTS fk2ydxc41acpbpcd9o565rx4t65;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.client_token_settings DROP CONSTRAINT IF EXISTS uk_3pfey53xr28krpinyefvbikk8;
ALTER TABLE IF EXISTS ONLY public.scopes DROP CONSTRAINT IF EXISTS scopes_pkey;
ALTER TABLE IF EXISTS ONLY public.redirect_urls DROP CONSTRAINT IF EXISTS redirect_urls_pkey;
ALTER TABLE IF EXISTS ONLY public.grant_types DROP CONSTRAINT IF EXISTS grant_types_pkey;
ALTER TABLE IF EXISTS ONLY public.clients DROP CONSTRAINT IF EXISTS clients_pkey;
ALTER TABLE IF EXISTS ONLY public.client_token_settings DROP CONSTRAINT IF EXISTS client_token_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.client_scope DROP CONSTRAINT IF EXISTS client_scope_pkey;
ALTER TABLE IF EXISTS ONLY public.client_grant_type DROP CONSTRAINT IF EXISTS client_grant_type_pkey;
ALTER TABLE IF EXISTS ONLY public.client_authentication_method DROP CONSTRAINT IF EXISTS client_authentication_method_pkey;
ALTER TABLE IF EXISTS ONLY public.authorities DROP CONSTRAINT IF EXISTS authorities_pkey;
ALTER TABLE IF EXISTS ONLY public.authentication_methods DROP CONSTRAINT IF EXISTS authentication_methods_pkey;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.scopes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.redirect_urls ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.grant_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.clients ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.client_token_settings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.authorities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.authentication_methods ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.scopes_id_seq;
DROP TABLE IF EXISTS public.scopes;
DROP SEQUENCE IF EXISTS public.redirect_urls_id_seq;
DROP TABLE IF EXISTS public.redirect_urls;
DROP SEQUENCE IF EXISTS public.grant_types_id_seq;
DROP TABLE IF EXISTS public.grant_types;
DROP SEQUENCE IF EXISTS public.clients_id_seq;
DROP TABLE IF EXISTS public.clients;
DROP SEQUENCE IF EXISTS public.client_token_settings_id_seq;
DROP TABLE IF EXISTS public.client_token_settings;
DROP TABLE IF EXISTS public.client_scope;
DROP TABLE IF EXISTS public.client_grant_type;
DROP TABLE IF EXISTS public.client_authentication_method;
DROP SEQUENCE IF EXISTS public.authorities_id_seq;
DROP TABLE IF EXISTS public.authorities;
DROP SEQUENCE IF EXISTS public.authentication_methods_id_seq;
DROP TABLE IF EXISTS public.authentication_methods;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authentication_methods; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.authentication_methods (
    id bigint NOT NULL,
    authentication_method character varying(255)
);


ALTER TABLE public.authentication_methods OWNER TO "postgres-auth";

--
-- Name: authentication_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.authentication_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authentication_methods_id_seq OWNER TO "postgres-auth";

--
-- Name: authentication_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.authentication_methods_id_seq OWNED BY public.authentication_methods.id;


--
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.authorities (
    id bigint NOT NULL,
    name character varying(255),
    user_id bigint
);


ALTER TABLE public.authorities OWNER TO "postgres-auth";

--
-- Name: authorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.authorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authorities_id_seq OWNER TO "postgres-auth";

--
-- Name: authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.authorities_id_seq OWNED BY public.authorities.id;


--
-- Name: client_authentication_method; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.client_authentication_method (
    client_id bigint NOT NULL,
    authentication_method_id bigint NOT NULL
);


ALTER TABLE public.client_authentication_method OWNER TO "postgres-auth";

--
-- Name: client_grant_type; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.client_grant_type (
    client_id bigint NOT NULL,
    grant_type_id bigint NOT NULL
);


ALTER TABLE public.client_grant_type OWNER TO "postgres-auth";

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.client_scope (
    client_id bigint NOT NULL,
    scope_id bigint NOT NULL
);


ALTER TABLE public.client_scope OWNER TO "postgres-auth";

--
-- Name: client_token_settings; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.client_token_settings (
    id bigint NOT NULL,
    access_token_ttl bigint,
    type character varying(255),
    client_id bigint
);


ALTER TABLE public.client_token_settings OWNER TO "postgres-auth";

--
-- Name: client_token_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.client_token_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_token_settings_id_seq OWNER TO "postgres-auth";

--
-- Name: client_token_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.client_token_settings_id_seq OWNED BY public.client_token_settings.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    client_id character varying(255),
    client_secret character varying(255)
);


ALTER TABLE public.clients OWNER TO "postgres-auth";

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO "postgres-auth";

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: grant_types; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.grant_types (
    id bigint NOT NULL,
    grant_type character varying(255)
);


ALTER TABLE public.grant_types OWNER TO "postgres-auth";

--
-- Name: grant_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.grant_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grant_types_id_seq OWNER TO "postgres-auth";

--
-- Name: grant_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.grant_types_id_seq OWNED BY public.grant_types.id;


--
-- Name: redirect_urls; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.redirect_urls (
    id bigint NOT NULL,
    redirect_url character varying(255),
    client_id bigint
);


ALTER TABLE public.redirect_urls OWNER TO "postgres-auth";

--
-- Name: redirect_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.redirect_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.redirect_urls_id_seq OWNER TO "postgres-auth";

--
-- Name: redirect_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.redirect_urls_id_seq OWNED BY public.redirect_urls.id;


--
-- Name: scopes; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.scopes (
    id bigint NOT NULL,
    scope character varying(255)
);


ALTER TABLE public.scopes OWNER TO "postgres-auth";

--
-- Name: scopes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.scopes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scopes_id_seq OWNER TO "postgres-auth";

--
-- Name: scopes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.scopes_id_seq OWNED BY public.scopes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres-auth
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.users OWNER TO "postgres-auth";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres-auth
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "postgres-auth";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres-auth
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: authentication_methods id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.authentication_methods ALTER COLUMN id SET DEFAULT nextval('public.authentication_methods_id_seq'::regclass);


--
-- Name: authorities id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.authorities ALTER COLUMN id SET DEFAULT nextval('public.authorities_id_seq'::regclass);


--
-- Name: client_token_settings id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_token_settings ALTER COLUMN id SET DEFAULT nextval('public.client_token_settings_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: grant_types id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.grant_types ALTER COLUMN id SET DEFAULT nextval('public.grant_types_id_seq'::regclass);


--
-- Name: redirect_urls id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.redirect_urls ALTER COLUMN id SET DEFAULT nextval('public.redirect_urls_id_seq'::regclass);


--
-- Name: scopes id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.scopes ALTER COLUMN id SET DEFAULT nextval('public.scopes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: authentication_methods; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.authentication_methods (id, authentication_method) FROM stdin;
1       client_secret_basic
\.


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.authorities (id, name, user_id) FROM stdin;
2       read    1
3       read    6
4       sef-pe-zdanie   6
5       read    7
6       sef-pe-zdanie   7
7       read    8
8       sef-pe-zdanie   8
9       read    9
10      sef-pe-zdanie   9
11      read    10
12      sef-pe-zdanie   10
13      read    11
14      sef-pe-zdanie   11
\.


--
-- Data for Name: client_authentication_method; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.client_authentication_method (client_id, authentication_method_id) FROM stdin;
1       1
\.


--
-- Data for Name: client_grant_type; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.client_grant_type (client_id, grant_type_id) FROM stdin;
1       1
1       2
1       3
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.client_scope (client_id, scope_id) FROM stdin;
1       1
\.


--
-- Data for Name: client_token_settings; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.client_token_settings (id, access_token_ttl, type, client_id) FROM stdin;
2       3       self-contained  1
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.clients (id, client_id, client_secret) FROM stdin;
1       client  $2a$12$gVm.3P1YYWVXH5pPTlqeBeXDAlROeymiqV0l/T461RIAvVH84yoyu
\.


--
-- Data for Name: grant_types; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.grant_types (id, grant_type) FROM stdin;
2       client_credentials
1       authorization_code
3       refresh_token
\.


--
-- Data for Name: redirect_urls; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.redirect_urls (id, redirect_url, client_id) FROM stdin;
2       http:example.com/success        1
\.


--
-- Data for Name: scopes; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.scopes (id, scope) FROM stdin;
1       openid
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres-auth
--

COPY public.users (id, password, username) FROM stdin;
1       $2a$12$GQx111RPs7S.bmntC.ElqupB.NsG0AT4zisb/hv/XWiSSQV17/wpa    danutu
3       $2a$10$iIhllBxmtBYLMJf0fqnvcub5XyIuJ3qp1Pgiv8p3KcAxbXk16XISO    danutul-mamei@gmail.com
6       $2a$10$rbg5MEbWyZfJOnqP.zn8suXwUALB8HGCAHEzOfaH0gI7R/ychOpai    runi-comandantul@gmail.com
7       $2a$10$MC0a.LSaSGD02MERP9D8GeM4e9j8yfB50xeJS3FKKzrqZoG4hwREC    sasa-comandantul@gmail.com
8       $2a$10$.sl.fL8MzevOw8UbhScyJOq0ikRxOYb97gBKIM950HDV1VqaB4lA.    sasa2-comandantul2@gmail.com
9       $2a$10$jd61wukUlfm5L/K3uOvx/OqI9hfP/DnnNJrEOUxoPeSNn4SBPzsCS    tester1@gmail.com
10      $2a$10$mbr8nkun4RCugwtq2i/ryOJdcC2WR2hCgdMm6qqsmljbVMRuoGZxS    tester2@gmail.com
11      $2a$10$pAXfkoo3lctJ98WlVWK.DOCNhX8iKJR76go2Bog.EYT/gPeNLXiF2    tester3@gmail.com
\.


--
-- Name: authentication_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.authentication_methods_id_seq', 1, true);


--
-- Name: authorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.authorities_id_seq', 14, true);


--
-- Name: client_token_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.client_token_settings_id_seq', 2, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, true);


--
-- Name: grant_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.grant_types_id_seq', 3, true);


--
-- Name: redirect_urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.redirect_urls_id_seq', 2, true);


--
-- Name: scopes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.scopes_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres-auth
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: authentication_methods authentication_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.authentication_methods
    ADD CONSTRAINT authentication_methods_pkey PRIMARY KEY (id);


--
-- Name: authorities authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (id);


--
-- Name: client_authentication_method client_authentication_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_authentication_method
    ADD CONSTRAINT client_authentication_method_pkey PRIMARY KEY (client_id, authentication_method_id);


--
-- Name: client_grant_type client_grant_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_grant_type
    ADD CONSTRAINT client_grant_type_pkey PRIMARY KEY (client_id, grant_type_id);


--
-- Name: client_scope client_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT client_scope_pkey PRIMARY KEY (client_id, scope_id);


--
-- Name: client_token_settings client_token_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_token_settings
    ADD CONSTRAINT client_token_settings_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: grant_types grant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.grant_types
    ADD CONSTRAINT grant_types_pkey PRIMARY KEY (id);


--
-- Name: redirect_urls redirect_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.redirect_urls
    ADD CONSTRAINT redirect_urls_pkey PRIMARY KEY (id);


--
-- Name: scopes scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.scopes
    ADD CONSTRAINT scopes_pkey PRIMARY KEY (id);


--
-- Name: client_token_settings uk_3pfey53xr28krpinyefvbikk8; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_token_settings
    ADD CONSTRAINT uk_3pfey53xr28krpinyefvbikk8 UNIQUE (client_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: client_grant_type fk2ydxc41acpbpcd9o565rx4t65; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_grant_type
    ADD CONSTRAINT fk2ydxc41acpbpcd9o565rx4t65 FOREIGN KEY (grant_type_id) REFERENCES public.grant_types(id);


--
-- Name: client_scope fk7nlsegqg2xdt4v04u3htr39lb; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk7nlsegqg2xdt4v04u3htr39lb FOREIGN KEY (scope_id) REFERENCES public.scopes(id);


--
-- Name: client_authentication_method fkckt8k7yber0qgu146i8q47a5g; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_authentication_method
    ADD CONSTRAINT fkckt8k7yber0qgu146i8q47a5g FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: client_grant_type fkdfjrbs80lislno3r42o5tu13t; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_grant_type
    ADD CONSTRAINT fkdfjrbs80lislno3r42o5tu13t FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: authorities fkk91upmbueyim93v469wj7b2qh; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT fkk91upmbueyim93v469wj7b2qh FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: redirect_urls fknhwi3aa713jloc3p0tx9rdbau; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.redirect_urls
    ADD CONSTRAINT fknhwi3aa713jloc3p0tx9rdbau FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: client_authentication_method fko1e3iawyo0982rcv7mpchom46; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_authentication_method
    ADD CONSTRAINT fko1e3iawyo0982rcv7mpchom46 FOREIGN KEY (authentication_method_id) REFERENCES public.authentication_methods(id);


--
-- Name: client_scope fkplv86ks0kud2ne4c8pqje98u8; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fkplv86ks0kud2ne4c8pqje98u8 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: client_token_settings fktnknkoj5uh8nd50k4o8xw87qi; Type: FK CONSTRAINT; Schema: public; Owner: postgres-auth
--

ALTER TABLE ONLY public.client_token_settings
    ADD CONSTRAINT fktnknkoj5uh8nd50k4o8xw87qi FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- PostgreSQL database dump complete
--
