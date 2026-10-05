--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1791169506683', 1, 104);
INSERT INTO public.users VALUES (1, 'user_1791169506684', 4, 286);
INSERT INTO public.users VALUES (22, 'user_1791170284852', 2, 162);
INSERT INTO public.users VALUES (4, 'user_1791169595846', 2, 260);
INSERT INTO public.users VALUES (3, 'user_1791169595847', 5, 9);
INSERT INTO public.users VALUES (21, 'user_1791170284853', 5, 65);
INSERT INTO public.users VALUES (6, 'user_1791169699289', 2, 15);
INSERT INTO public.users VALUES (5, 'user_1791169699290', 5, 204);
INSERT INTO public.users VALUES (8, 'user_1791169794735', 1, 89);
INSERT INTO public.users VALUES (7, 'user_1791169794736', 4, 140);
INSERT INTO public.users VALUES (10, 'user_1791169808422', 1, 985);
INSERT INTO public.users VALUES (9, 'user_1791169808423', 4, 95);
INSERT INTO public.users VALUES (12, 'user_1791169817770', 2, 459);
INSERT INTO public.users VALUES (11, 'user_1791169817771', 5, 36);
INSERT INTO public.users VALUES (14, 'user_1791169857929', 2, 96);
INSERT INTO public.users VALUES (13, 'user_1791169857930', 5, 36);
INSERT INTO public.users VALUES (16, 'user_1791169982024', 2, 429);
INSERT INTO public.users VALUES (15, 'user_1791169982025', 5, 254);
INSERT INTO public.users VALUES (17, 'ok', 0, NULL);
INSERT INTO public.users VALUES (18, 'o', 1, 23);
INSERT INTO public.users VALUES (20, 'user_1791170251731', 2, 367);
INSERT INTO public.users VALUES (19, 'user_1791170251732', 5, 190);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

