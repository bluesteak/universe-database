--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    composition text,
    is_potentially_hazardous boolean NOT NULL,
    diameter numeric NOT NULL,
    discovered_by text,
    discovery_date date
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text,
    number_of_stars integer NOT NULL,
    is_active boolean NOT NULL,
    discovery_date date
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    has_atmosphere boolean NOT NULL,
    diameter integer NOT NULL,
    discovered_by text,
    discovery_year integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    number_of_moons integer NOT NULL,
    orbital_period numeric,
    composition text,
    theme_food character varying(255) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    is_main_sequence boolean NOT NULL,
    age integer,
    spectral_type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rocky', false, 939, 'Giuseppe Piazzi', '1801-01-01');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Rocky', false, 512, 'Heinrich Olbers', '1802-03-28');
INSERT INTO public.asteroid VALUES (3, 'Juno', 'Rocky', false, 233, 'Karl Harding', '1804-09-01');
INSERT INTO public.asteroid VALUES (4, 'Vesta', 'Rocky', false, 525, 'Heinrich Olbers', '1807-03-29');
INSERT INTO public.asteroid VALUES (5, 'Eros', 'Rocky', true, 16, 'Gustav Witt', '1898-08-13');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 10, true, '2030-01-01');
INSERT INTO public.galaxy VALUES (2, 'Twix', 'Spiral', 10, true, '2030-02-01');
INSERT INTO public.galaxy VALUES (3, 'Snickers', 'Spiral', 5, true, '2030-03-01');
INSERT INTO public.galaxy VALUES (4, 'Mars', 'Spiral', 7, true, '2030-04-01');
INSERT INTO public.galaxy VALUES (5, 'Hershey', 'Spiral', 3, true, '2030-05-01');
INSERT INTO public.galaxy VALUES (6, 'KitKat', 'Spiral', 9, true, '2030-06-01');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, false, 3474, 'Humans', 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 22, 'Asaph Hall', 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 12, 'Asaph Hall', 1877);
INSERT INTO public.moon VALUES (4, 'Cheese', 5, true, 3643, 'Galileo', 1610);
INSERT INTO public.moon VALUES (5, 'Milk', 5, true, 3121, 'Galileo', 1610);
INSERT INTO public.moon VALUES (6, 'Butter', 5, true, 5262, 'Galileo', 1610);
INSERT INTO public.moon VALUES (7, 'Cream', 5, true, 4820, 'Galileo', 1610);
INSERT INTO public.moon VALUES (8, 'Ice', 6, true, 5150, 'Christiaan Huygens', 1655);
INSERT INTO public.moon VALUES (9, 'Tea', 6, false, 1528, 'Giovanni Cassini', 1672);
INSERT INTO public.moon VALUES (10, 'Coffee', 6, false, 1469, 'Giovanni Cassini', 1671);
INSERT INTO public.moon VALUES (11, 'Cocoa', 6, false, 1122, 'Giovanni Cassini', 1684);
INSERT INTO public.moon VALUES (12, 'Chocolate', 6, false, 1066, 'Giovanni Cassini', 1684);
INSERT INTO public.moon VALUES (13, 'Sugar', 6, true, 504, 'William Herschel', 1789);
INSERT INTO public.moon VALUES (14, 'Candy', 7, false, 471, 'Gerard Kuiper', 1948);
INSERT INTO public.moon VALUES (15, 'Biscuit', 7, true, 1158, 'William Lassell', 1851);
INSERT INTO public.moon VALUES (16, 'Cake', 7, false, 1169, 'William Lassell', 1851);
INSERT INTO public.moon VALUES (17, 'Pie', 7, false, 1578, 'William Herschel', 1787);
INSERT INTO public.moon VALUES (18, 'Pudding', 7, false, 1523, 'William Herschel', 1787);
INSERT INTO public.moon VALUES (19, 'Waffle', 8, true, 2706, 'William Lassell', 1846);
INSERT INTO public.moon VALUES (20, 'Pancake', 8, false, 340, 'Gerard Kuiper', 1949);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Pasta', 1, false, 0, 87.97, 'Rocky', 'Italian');
INSERT INTO public.planet VALUES (2, 'Pizza', 1, false, 0, 224.7, 'Rocky', 'Italian');
INSERT INTO public.planet VALUES (3, 'Burger', 1, true, 1, 365.25, 'Rocky', 'American');
INSERT INTO public.planet VALUES (4, 'Sushi', 1, false, 2, 687, 'Rocky', 'Japanese');
INSERT INTO public.planet VALUES (5, 'Taco', 1, false, 79, 4333, 'Gas Giant', 'Mexican');
INSERT INTO public.planet VALUES (6, 'Curry', 1, false, 82, 10759, 'Gas Giant', 'Indian');
INSERT INTO public.planet VALUES (7, 'Baguette', 1, false, 27, 30687, 'Ice Giant', 'French');
INSERT INTO public.planet VALUES (8, 'Croissant', 1, false, 14, 60190, 'Ice Giant', 'French');
INSERT INTO public.planet VALUES (9, 'Dumpling', 2, false, 0, 11.2, 'Rocky', 'Chinese');
INSERT INTO public.planet VALUES (10, 'Paella', 3, false, 0, 3.2, 'Rocky', 'Spanish');
INSERT INTO public.planet VALUES (11, 'Tapas', 4, false, 0, 5.2, 'Rocky', 'Spanish');
INSERT INTO public.planet VALUES (12, 'Falafel', 5, false, 0, 400, 'Rocky', 'Middle Eastern');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha', 1, 1.0, true, 4, 'G2V');
INSERT INTO public.star VALUES (2, 'Beta', 2, 0.12, true, 5, 'M5.5V');
INSERT INTO public.star VALUES (3, 'Gamma', 3, 1.1, true, 6, 'G2V');
INSERT INTO public.star VALUES (4, 'Delta', 4, 0.91, true, 7, 'K1V');
INSERT INTO public.star VALUES (5, 'Epsilon', 5, 20.0, false, 8, 'M2Iab');
INSERT INTO public.star VALUES (6, 'Zeta', 6, 2.1, true, 9, 'A1V');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

