--
-- PostgreSQL database dump
--

-- Dumped from database version 11.9 (Ubuntu 11.9-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.9 (Ubuntu 11.9-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO foo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO foo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO foo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO foo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO foo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO foo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO foo;

--
-- Name: bookings_booking; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.bookings_booking (
    id integer NOT NULL,
    reserved boolean NOT NULL,
    ticket_id uuid NOT NULL,
    user_id uuid
);


ALTER TABLE public.bookings_booking OWNER TO foo;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_booking_id_seq OWNER TO foo;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings_booking.id;


--
-- Name: bookings_bookingpayment; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.bookings_bookingpayment (
    id integer NOT NULL,
    price numeric(5,2) NOT NULL,
    completed boolean NOT NULL,
    payment_id uuid NOT NULL
);


ALTER TABLE public.bookings_bookingpayment OWNER TO foo;

--
-- Name: bookings_bookingpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.bookings_bookingpayment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_bookingpayment_id_seq OWNER TO foo;

--
-- Name: bookings_bookingpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.bookings_bookingpayment_id_seq OWNED BY public.bookings_bookingpayment.id;


--
-- Name: cities_city; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.cities_city (
    guid uuid NOT NULL,
    city character varying(250) NOT NULL,
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.cities_city OWNER TO foo;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO foo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO foo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO foo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO foo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO foo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO foo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO foo;

--
-- Name: languages_language; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.languages_language (
    guid uuid NOT NULL,
    name character varying(250),
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.languages_language OWNER TO foo;

--
-- Name: movies_genre; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.movies_genre (
    guid uuid NOT NULL,
    name character varying(250),
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.movies_genre OWNER TO foo;

--
-- Name: movies_movie; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.movies_movie (
    guid uuid NOT NULL,
    name character varying(250),
    release_date date NOT NULL,
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.movies_movie OWNER TO foo;

--
-- Name: movies_movie_genres; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.movies_movie_genres (
    id integer NOT NULL,
    movie_id uuid NOT NULL,
    genre_id uuid NOT NULL
);


ALTER TABLE public.movies_movie_genres OWNER TO foo;

--
-- Name: movies_movie_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.movies_movie_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movie_genres_id_seq OWNER TO foo;

--
-- Name: movies_movie_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.movies_movie_genres_id_seq OWNED BY public.movies_movie_genres.id;


--
-- Name: movies_movie_languages; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.movies_movie_languages (
    id integer NOT NULL,
    movie_id uuid NOT NULL,
    language_id uuid NOT NULL
);


ALTER TABLE public.movies_movie_languages OWNER TO foo;

--
-- Name: movies_movie_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.movies_movie_languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movie_languages_id_seq OWNER TO foo;

--
-- Name: movies_movie_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.movies_movie_languages_id_seq OWNED BY public.movies_movie_languages.id;


--
-- Name: theaters_bookedticket; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_bookedticket (
    guid uuid NOT NULL,
    seat integer NOT NULL,
    reserved_for date NOT NULL,
    booked_on timestamp with time zone NOT NULL,
    category_id uuid,
    row_id integer,
    show_time_id uuid
);


ALTER TABLE public.theaters_bookedticket OWNER TO foo;

--
-- Name: theaters_category; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_category (
    guid uuid NOT NULL,
    name character varying(250),
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.theaters_category OWNER TO foo;

--
-- Name: theaters_row; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_row (
    id integer NOT NULL,
    name character varying(3)
);


ALTER TABLE public.theaters_row OWNER TO foo;

--
-- Name: theaters_row_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.theaters_row_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theaters_row_id_seq OWNER TO foo;

--
-- Name: theaters_row_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.theaters_row_id_seq OWNED BY public.theaters_row.id;


--
-- Name: theaters_theater; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_theater (
    guid uuid NOT NULL,
    name character varying(250),
    location text NOT NULL,
    pin_code character varying(6) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    city_id uuid NOT NULL
);


ALTER TABLE public.theaters_theater OWNER TO foo;

--
-- Name: theaters_theaterscreen; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_theaterscreen (
    guid uuid NOT NULL,
    name character varying(6) NOT NULL,
    seats_arrangement character varying(30),
    max_seats integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    movie_id uuid NOT NULL,
    theater_id uuid
);


ALTER TABLE public.theaters_theaterscreen OWNER TO foo;

--
-- Name: theaters_theaterscreen_show_timings; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_theaterscreen_show_timings (
    id integer NOT NULL,
    theaterscreen_id uuid NOT NULL,
    timings_id uuid NOT NULL
);


ALTER TABLE public.theaters_theaterscreen_show_timings OWNER TO foo;

--
-- Name: theaters_theaterscreen_show_timings_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.theaters_theaterscreen_show_timings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theaters_theaterscreen_show_timings_id_seq OWNER TO foo;

--
-- Name: theaters_theaterscreen_show_timings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.theaters_theaterscreen_show_timings_id_seq OWNED BY public.theaters_theaterscreen_show_timings.id;


--
-- Name: theaters_theaterscreencategory; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_theaterscreencategory (
    guid uuid NOT NULL,
    price numeric(5,2) NOT NULL,
    created_on timestamp with time zone NOT NULL,
    category_id uuid,
    last_row_id integer,
    screen_id uuid
);


ALTER TABLE public.theaters_theaterscreencategory OWNER TO foo;

--
-- Name: theaters_theaterscreencategoryrowgap; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_theaterscreencategoryrowgap (
    guid uuid NOT NULL,
    seat integer NOT NULL,
    positions integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    category_id uuid,
    row_id integer
);


ALTER TABLE public.theaters_theaterscreencategoryrowgap OWNER TO foo;

--
-- Name: theaters_timings; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.theaters_timings (
    guid uuid NOT NULL,
    start time without time zone NOT NULL,
    "end" time without time zone NOT NULL,
    created_on timestamp with time zone NOT NULL
);


ALTER TABLE public.theaters_timings OWNER TO foo;

--
-- Name: users_user; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.users_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    guid uuid NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO foo;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO foo;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO foo;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: foo
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO foo;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: foo
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO foo;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: foo
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: bookings_booking id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_booking ALTER COLUMN id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);


--
-- Name: bookings_bookingpayment id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_bookingpayment ALTER COLUMN id SET DEFAULT nextval('public.bookings_bookingpayment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: movies_movie_genres id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_genres ALTER COLUMN id SET DEFAULT nextval('public.movies_movie_genres_id_seq'::regclass);


--
-- Name: movies_movie_languages id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_languages ALTER COLUMN id SET DEFAULT nextval('public.movies_movie_languages_id_seq'::regclass);


--
-- Name: theaters_row id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_row ALTER COLUMN id SET DEFAULT nextval('public.theaters_row_id_seq'::regclass);


--
-- Name: theaters_theaterscreen_show_timings id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen_show_timings ALTER COLUMN id SET DEFAULT nextval('public.theaters_theaterscreen_show_timings_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add City	2	add_city
6	Can change City	2	change_city
7	Can delete City	2	delete_city
8	Can view City	2	view_city
9	Can add Movie Genre	3	add_genre
10	Can change Movie Genre	3	change_genre
11	Can delete Movie Genre	3	delete_genre
12	Can view Movie Genre	3	view_genre
13	Can add Movie	4	add_movie
14	Can change Movie	4	change_movie
15	Can delete Movie	4	delete_movie
16	Can view Movie	4	view_movie
17	Can add Category	5	add_category
18	Can change Category	5	change_category
19	Can delete Category	5	delete_category
20	Can view Category	5	view_category
21	Can add Row	6	add_row
22	Can change Row	6	change_row
23	Can delete Row	6	delete_row
24	Can view Row	6	view_row
25	Can add Theater	7	add_theater
26	Can change Theater	7	change_theater
27	Can delete Theater	7	delete_theater
28	Can view Theater	7	view_theater
29	Can add Theater Screen	8	add_theaterscreen
30	Can change Theater Screen	8	change_theaterscreen
31	Can delete Theater Screen	8	delete_theaterscreen
32	Can view Theater Screen	8	view_theaterscreen
33	Can add Theater Screen Category	9	add_theaterscreencategory
34	Can change Theater Screen Category	9	change_theaterscreencategory
35	Can delete Theater Screen Category	9	delete_theaterscreencategory
36	Can view Theater Screen Category	9	view_theaterscreencategory
37	Can add Show Timing	10	add_timings
38	Can change Show Timing	10	change_timings
39	Can delete Show Timing	10	delete_timings
40	Can view Show Timing	10	view_timings
41	Can add Gap	11	add_theaterscreencategoryrowgap
42	Can change Gap	11	change_theaterscreencategoryrowgap
43	Can delete Gap	11	delete_theaterscreencategoryrowgap
44	Can view Gap	11	view_theaterscreencategoryrowgap
45	Can add Booked Ticket	12	add_bookedticket
46	Can change Booked Ticket	12	change_bookedticket
47	Can delete Booked Ticket	12	delete_bookedticket
48	Can view Booked Ticket	12	view_bookedticket
49	Can add Booking Payment	13	add_bookingpayment
50	Can change Booking Payment	13	change_bookingpayment
51	Can delete Booking Payment	13	delete_bookingpayment
52	Can view Booking Payment	13	view_bookingpayment
53	Can add Booking	14	add_booking
54	Can change Booking	14	change_booking
55	Can delete Booking	14	delete_booking
56	Can view Booking	14	view_booking
57	Can add Language	15	add_language
58	Can change Language	15	change_language
59	Can delete Language	15	delete_language
60	Can view Language	15	view_language
61	Can add Token	16	add_token
62	Can change Token	16	change_token
63	Can delete Token	16	delete_token
64	Can view Token	16	view_token
65	Can add log entry	17	add_logentry
66	Can change log entry	17	change_logentry
67	Can delete log entry	17	delete_logentry
68	Can view log entry	17	view_logentry
69	Can add permission	18	add_permission
70	Can change permission	18	change_permission
71	Can delete permission	18	delete_permission
72	Can view permission	18	view_permission
73	Can add group	19	add_group
74	Can change group	19	change_group
75	Can delete group	19	delete_group
76	Can view group	19	view_group
77	Can add content type	20	add_contenttype
78	Can change content type	20	change_contenttype
79	Can delete content type	20	delete_contenttype
80	Can view content type	20	view_contenttype
81	Can add session	21	add_session
82	Can change session	21	change_session
83	Can delete session	21	delete_session
84	Can view session	21	view_session
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
7a883f1e3b976acf909346e285f118940c0a113c	2020-09-21 11:45:21.244217+05:30	84d6101f-6fd2-4279-90fe-61e010e74f7d
\.


--
-- Data for Name: bookings_booking; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.bookings_booking (id, reserved, ticket_id, user_id) FROM stdin;
\.


--
-- Data for Name: bookings_bookingpayment; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.bookings_bookingpayment (id, price, completed, payment_id) FROM stdin;
\.


--
-- Data for Name: cities_city; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.cities_city (guid, city, created_on) FROM stdin;
28207fc5-8289-41ce-b7fb-d2ec7c1f14dd	Hyderabad	2020-09-21 11:30:41.514237+05:30
09efba32-f5a2-4dc8-b4a0-036caf76aa27	Bangalore	2020-09-21 11:30:46.467111+05:30
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-09-21 11:30:41.518505+05:30	28207fc5-8289-41ce-b7fb-d2ec7c1f14dd	Hyderabad	1	[{"added": {}}]	2	78a518b4-c802-489c-b382-af0e32855789
2	2020-09-21 11:30:46.468268+05:30	09efba32-f5a2-4dc8-b4a0-036caf76aa27	Bangalore	1	[{"added": {}}]	2	78a518b4-c802-489c-b382-af0e32855789
3	2020-09-21 11:30:52.022561+05:30	e35c8717-1256-4c17-a767-6c590cfc64f7	Telugu	1	[{"added": {}}]	15	78a518b4-c802-489c-b382-af0e32855789
4	2020-09-21 11:30:56.939361+05:30	9b2a3972-1f20-461b-95a5-3b486cc790f8	English	1	[{"added": {}}]	15	78a518b4-c802-489c-b382-af0e32855789
5	2020-09-21 11:31:01.336049+05:30	96908a8d-97d2-46d1-aafb-4f956f0dd038	Hindi	1	[{"added": {}}]	15	78a518b4-c802-489c-b382-af0e32855789
6	2020-09-21 11:31:33.326668+05:30	17a38ed1-9530-4c47-9e7a-f9031c901170	ACTION	1	[{"added": {}}]	3	78a518b4-c802-489c-b382-af0e32855789
7	2020-09-21 11:31:40.400967+05:30	84e00cd9-6b86-49bb-ad25-22079ec517e2	DRAMA	1	[{"added": {}}]	3	78a518b4-c802-489c-b382-af0e32855789
8	2020-09-21 11:31:45.15343+05:30	88457c4b-889a-40d0-a45f-fde029a1d656	ROMANTIC	1	[{"added": {}}]	3	78a518b4-c802-489c-b382-af0e32855789
9	2020-09-21 11:31:47.588428+05:30	30a0c90d-ab34-4e81-9e7a-7017f606140b	CRIME	1	[{"added": {}}]	3	78a518b4-c802-489c-b382-af0e32855789
10	2020-09-21 11:31:52.143508+05:30	0ee3da73-9054-4711-865c-9acdea15bb4a	THRILLER	1	[{"added": {}}]	3	78a518b4-c802-489c-b382-af0e32855789
11	2020-09-21 11:32:16.078641+05:30	b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	V	1	[{"added": {}}]	4	78a518b4-c802-489c-b382-af0e32855789
12	2020-09-21 11:34:11.722627+05:30	c3c2305a-781a-485f-8fd5-cc3dc90969ca	First Class	1	[{"added": {}}]	5	78a518b4-c802-489c-b382-af0e32855789
13	2020-09-21 11:34:17.420272+05:30	9928baf1-9603-41ca-be41-b7888f92dede	Second Class	1	[{"added": {}}]	5	78a518b4-c802-489c-b382-af0e32855789
14	2020-09-21 11:34:21.359551+05:30	b404fedd-aff0-464e-aa90-3000e34fe581	Gold	1	[{"added": {}}]	5	78a518b4-c802-489c-b382-af0e32855789
15	2020-09-21 11:34:27.543952+05:30	f6959e62-9f89-45c0-912c-a3db50ff670a	Platinum	1	[{"added": {}}]	5	78a518b4-c802-489c-b382-af0e32855789
16	2020-09-21 11:34:33.73904+05:30	1	A	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
17	2020-09-21 11:34:36.914197+05:30	2	B	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
18	2020-09-21 11:34:39.455262+05:30	3	C	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
19	2020-09-21 11:34:40.56679+05:30	4	D	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
20	2020-09-21 11:34:43.899436+05:30	5	E	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
21	2020-09-21 11:34:45.228435+05:30	6	F	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
22	2020-09-21 11:34:46.447689+05:30	7	G	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
23	2020-09-21 11:34:47.631409+05:30	8	H	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
24	2020-09-21 11:34:49.080769+05:30	9	I	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
25	2020-09-21 11:34:50.87144+05:30	10	J	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
26	2020-09-21 11:34:51.923025+05:30	11	K	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
27	2020-09-21 11:34:53.428638+05:30	12	L	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
28	2020-09-21 11:34:56.282354+05:30	13	M	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
29	2020-09-21 11:34:57.757865+05:30	14	N	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
30	2020-09-21 11:34:59.271662+05:30	15	O	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
31	2020-09-21 11:35:00.551178+05:30	16	P	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
32	2020-09-21 11:35:02.311246+05:30	17	Q	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
33	2020-09-21 11:35:05.55958+05:30	18	R	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
34	2020-09-21 11:35:07.104134+05:30	19	S	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
35	2020-09-21 11:35:08.846351+05:30	20	T	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
36	2020-09-21 11:35:10.245803+05:30	21	U	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
37	2020-09-21 11:35:11.417523+05:30	22	V	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
38	2020-09-21 11:35:12.909394+05:30	23	W	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
39	2020-09-21 11:35:14.172212+05:30	24	X	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
40	2020-09-21 11:35:15.538141+05:30	25	Y	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
41	2020-09-21 11:35:16.842084+05:30	26	Z	1	[{"added": {}}]	6	78a518b4-c802-489c-b382-af0e32855789
42	2020-09-21 11:35:47.637387+05:30	42d1ce2a-e41e-411a-8a13-b36a84f6dec9	11:00:00 - 14:00:00	1	[{"added": {}}]	10	78a518b4-c802-489c-b382-af0e32855789
43	2020-09-21 11:36:01.558192+05:30	93d5978c-62b0-4b14-b9f0-4c4a05c5a876	14:00:00 - 18:00:00	1	[{"added": {}}]	10	78a518b4-c802-489c-b382-af0e32855789
44	2020-09-21 11:36:24.780056+05:30	9bea167b-6c04-472d-b5c6-96a6023e4b84	18:00:00 - 21:00:00	1	[{"added": {}}]	10	78a518b4-c802-489c-b382-af0e32855789
45	2020-09-21 11:36:42.143263+05:30	34c89f39-7ced-4d4f-8169-15a1b319b41a	21:00:00 - 00:00:00	1	[{"added": {}}]	10	78a518b4-c802-489c-b382-af0e32855789
46	2020-09-21 11:37:25.547795+05:30	7c347f77-4d20-49ae-9ee3-06745112ee26	Avr Plaza	1	[{"added": {}}]	7	78a518b4-c802-489c-b382-af0e32855789
47	2020-09-21 11:37:44.438185+05:30	4cc6a0b2-cb31-47ef-8045-8544001aafc8	Avr Plaza - Screen 1	1	[{"added": {}}]	8	78a518b4-c802-489c-b382-af0e32855789
48	2020-09-21 11:38:12.462079+05:30	0848c61b-8256-432b-ac3a-c60b8ff958e7	Avr Plaza - Screen 2	1	[{"added": {}}]	8	78a518b4-c802-489c-b382-af0e32855789
49	2020-09-21 11:38:31.218296+05:30	a0041e3b-3dac-4678-8205-de3be399e72f	Avr Plaza - Screen 1 - First Class	1	[{"added": {}}]	9	78a518b4-c802-489c-b382-af0e32855789
50	2020-09-21 11:38:52.369868+05:30	822b3e57-03a1-4810-be45-6a7ca6c3b318	Avr Plaza - Screen 1 - Second Class	1	[{"added": {}}]	9	78a518b4-c802-489c-b382-af0e32855789
51	2020-09-21 11:39:54.007492+05:30	29e47867-d235-4aa5-946e-88db6c4bed86	Row E,  Seat 5, Gaps 3	1	[{"added": {}}]	11	78a518b4-c802-489c-b382-af0e32855789
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	users	user
2	cities	city
3	movies	genre
4	movies	movie
5	theaters	category
6	theaters	row
7	theaters	theater
8	theaters	theaterscreen
9	theaters	theaterscreencategory
10	theaters	timings
11	theaters	theaterscreencategoryrowgap
12	theaters	bookedticket
13	bookings	bookingpayment
14	bookings	booking
15	languages	language
16	authtoken	token
17	admin	logentry
18	auth	permission
19	auth	group
20	contenttypes	contenttype
21	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-09-21 11:29:05.623853+05:30
2	contenttypes	0002_remove_content_type_name	2020-09-21 11:29:05.635885+05:30
3	auth	0001_initial	2020-09-21 11:29:05.671038+05:30
4	auth	0002_alter_permission_name_max_length	2020-09-21 11:29:05.704825+05:30
5	auth	0003_alter_user_email_max_length	2020-09-21 11:29:05.716174+05:30
6	auth	0004_alter_user_username_opts	2020-09-21 11:29:05.72847+05:30
7	auth	0005_alter_user_last_login_null	2020-09-21 11:29:05.73951+05:30
8	auth	0006_require_contenttypes_0002	2020-09-21 11:29:05.743554+05:30
9	auth	0007_alter_validators_add_error_messages	2020-09-21 11:29:05.754604+05:30
10	auth	0008_alter_user_username_max_length	2020-09-21 11:29:05.768028+05:30
11	auth	0009_alter_user_last_name_max_length	2020-09-21 11:29:05.778586+05:30
12	auth	0010_alter_group_name_max_length	2020-09-21 11:29:05.789991+05:30
13	auth	0011_update_proxy_permissions	2020-09-21 11:29:05.801668+05:30
14	auth	0012_alter_user_first_name_max_length	2020-09-21 11:29:05.81246+05:30
15	users	0001_initial	2020-09-21 11:29:05.843414+05:30
16	admin	0001_initial	2020-09-21 11:29:05.913229+05:30
17	admin	0002_logentry_remove_auto_add	2020-09-21 11:29:05.935973+05:30
18	admin	0003_logentry_add_action_flag_choices	2020-09-21 11:29:05.951589+05:30
19	authtoken	0001_initial	2020-09-21 11:29:05.977288+05:30
20	authtoken	0002_auto_20160226_1747	2020-09-21 11:29:06.031882+05:30
21	languages	0001_initial	2020-09-21 11:29:06.040767+05:30
22	movies	0001_initial	2020-09-21 11:29:06.06968+05:30
23	cities	0001_initial	2020-09-21 11:29:06.106244+05:30
24	theaters	0001_initial	2020-09-21 11:29:06.241836+05:30
25	bookings	0001_initial	2020-09-21 11:29:06.366574+05:30
26	bookings	0002_booking_user	2020-09-21 11:29:06.403181+05:30
27	sessions	0001_initial	2020-09-21 11:29:06.418755+05:30
28	bookings	0003_auto_20200921_0616	2020-09-21 11:47:04.166917+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
awrtakl3jr4k8wc9pxeuslhwhiwkg6tg	.eJxVjcsOgjAUBf-la9u0paUXl-z9BnIfraAGEh4r478LCQtdn5kzb9XhtvbdtuS5G0RdVQKMDihoBut1gIY1VeA1FpsrDzEmaNTlVyPkZx4PVx443ifD07jOA5kDMee6mNsk-dWe7N9Bj0u_26XEEpkhsdDesk1B2ZNJ0BGjTwUCBnEEuXaEkiw6rpyg1Bg8B1KfL8coQic:1kKEsA:U62we8tyDp3-kqmjj-_qGafx6vo7lTRY9MuZAWCVXJw	2020-10-05 11:30:22.602123+05:30
\.


--
-- Data for Name: languages_language; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.languages_language (guid, name, created_on) FROM stdin;
e35c8717-1256-4c17-a767-6c590cfc64f7	Telugu	2020-09-21 11:30:52.019501+05:30
9b2a3972-1f20-461b-95a5-3b486cc790f8	English	2020-09-21 11:30:56.938521+05:30
96908a8d-97d2-46d1-aafb-4f956f0dd038	Hindi	2020-09-21 11:31:01.334726+05:30
\.


--
-- Data for Name: movies_genre; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.movies_genre (guid, name, created_on) FROM stdin;
17a38ed1-9530-4c47-9e7a-f9031c901170	ACTION	2020-09-21 11:31:33.32465+05:30
84e00cd9-6b86-49bb-ad25-22079ec517e2	DRAMA	2020-09-21 11:31:40.399892+05:30
88457c4b-889a-40d0-a45f-fde029a1d656	ROMANTIC	2020-09-21 11:31:45.150201+05:30
30a0c90d-ab34-4e81-9e7a-7017f606140b	CRIME	2020-09-21 11:31:47.58704+05:30
0ee3da73-9054-4711-865c-9acdea15bb4a	THRILLER	2020-09-21 11:31:52.141191+05:30
\.


--
-- Data for Name: movies_movie; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.movies_movie (guid, name, release_date, created_on) FROM stdin;
b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	V	2020-09-01	2020-09-21 11:32:16.0677+05:30
\.


--
-- Data for Name: movies_movie_genres; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.movies_movie_genres (id, movie_id, genre_id) FROM stdin;
1	b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	84e00cd9-6b86-49bb-ad25-22079ec517e2
2	b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	17a38ed1-9530-4c47-9e7a-f9031c901170
\.


--
-- Data for Name: movies_movie_languages; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.movies_movie_languages (id, movie_id, language_id) FROM stdin;
1	b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	e35c8717-1256-4c17-a767-6c590cfc64f7
\.


--
-- Data for Name: theaters_bookedticket; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_bookedticket (guid, seat, reserved_for, booked_on, category_id, row_id, show_time_id) FROM stdin;
\.


--
-- Data for Name: theaters_category; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_category (guid, name, created_on) FROM stdin;
c3c2305a-781a-485f-8fd5-cc3dc90969ca	First Class	2020-09-21 11:34:11.719528+05:30
9928baf1-9603-41ca-be41-b7888f92dede	Second Class	2020-09-21 11:34:17.419148+05:30
b404fedd-aff0-464e-aa90-3000e34fe581	Gold	2020-09-21 11:34:21.35706+05:30
f6959e62-9f89-45c0-912c-a3db50ff670a	Platinum	2020-09-21 11:34:27.541328+05:30
\.


--
-- Data for Name: theaters_row; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_row (id, name) FROM stdin;
1	A
2	B
3	C
4	D
5	E
6	F
7	G
8	H
9	I
10	J
11	K
12	L
13	M
14	N
15	O
16	P
17	Q
18	R
19	S
20	T
21	U
22	V
23	W
24	X
25	Y
26	Z
\.


--
-- Data for Name: theaters_theater; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_theater (guid, name, location, pin_code, created_on, city_id) FROM stdin;
7c347f77-4d20-49ae-9ee3-06745112ee26	Avr Plaza	Ameerpet, Hyderabad, 500043	500043	2020-09-21 11:37:25.546098+05:30	28207fc5-8289-41ce-b7fb-d2ec7c1f14dd
\.


--
-- Data for Name: theaters_theaterscreen; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_theaterscreen (guid, name, seats_arrangement, max_seats, created_on, movie_id, theater_id) FROM stdin;
4cc6a0b2-cb31-47ef-8045-8544001aafc8	1	LTR	20	2020-09-21 11:37:44.430887+05:30	b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	7c347f77-4d20-49ae-9ee3-06745112ee26
0848c61b-8256-432b-ac3a-c60b8ff958e7	2	LTR	20	2020-09-21 11:38:12.452535+05:30	b7fd91e2-a994-4e2d-a2ce-5bef3b5f1b7c	7c347f77-4d20-49ae-9ee3-06745112ee26
\.


--
-- Data for Name: theaters_theaterscreen_show_timings; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_theaterscreen_show_timings (id, theaterscreen_id, timings_id) FROM stdin;
1	4cc6a0b2-cb31-47ef-8045-8544001aafc8	93d5978c-62b0-4b14-b9f0-4c4a05c5a876
2	4cc6a0b2-cb31-47ef-8045-8544001aafc8	42d1ce2a-e41e-411a-8a13-b36a84f6dec9
3	0848c61b-8256-432b-ac3a-c60b8ff958e7	93d5978c-62b0-4b14-b9f0-4c4a05c5a876
4	0848c61b-8256-432b-ac3a-c60b8ff958e7	42d1ce2a-e41e-411a-8a13-b36a84f6dec9
\.


--
-- Data for Name: theaters_theaterscreencategory; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_theaterscreencategory (guid, price, created_on, category_id, last_row_id, screen_id) FROM stdin;
a0041e3b-3dac-4678-8205-de3be399e72f	150.00	2020-09-21 11:38:31.212804+05:30	c3c2305a-781a-485f-8fd5-cc3dc90969ca	10	4cc6a0b2-cb31-47ef-8045-8544001aafc8
822b3e57-03a1-4810-be45-6a7ca6c3b318	100.00	2020-09-21 11:38:52.366852+05:30	9928baf1-9603-41ca-be41-b7888f92dede	6	4cc6a0b2-cb31-47ef-8045-8544001aafc8
\.


--
-- Data for Name: theaters_theaterscreencategoryrowgap; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_theaterscreencategoryrowgap (guid, seat, positions, created_on, category_id, row_id) FROM stdin;
29e47867-d235-4aa5-946e-88db6c4bed86	5	3	2020-09-21 11:39:54.00553+05:30	a0041e3b-3dac-4678-8205-de3be399e72f	5
\.


--
-- Data for Name: theaters_timings; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.theaters_timings (guid, start, "end", created_on) FROM stdin;
42d1ce2a-e41e-411a-8a13-b36a84f6dec9	11:00:00	14:00:00	2020-09-21 11:35:47.636232+05:30
93d5978c-62b0-4b14-b9f0-4c4a05c5a876	14:00:00	18:00:00	2020-09-21 11:36:01.55708+05:30
9bea167b-6c04-472d-b5c6-96a6023e4b84	18:00:00	21:00:00	2020-09-21 11:36:24.778949+05:30
34c89f39-7ced-4d4f-8169-15a1b319b41a	21:00:00	00:00:00	2020-09-21 11:36:42.139579+05:30
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.users_user (password, last_login, is_superuser, guid, email, name, is_active, is_staff, date_joined) FROM stdin;
pbkdf2_sha256$216000$6RWkIV8SWBI0$tIDr9he6S6cF7eWsG2YRSBSLzYWVnm+XjMUeA248c3s=	2020-09-21 11:30:22.598714+05:30	t	78a518b4-c802-489c-b382-af0e32855789	admin@gmail.com	Ravi Varma	t	t	2020-09-21 11:29:58.580737+05:30
pbkdf2_sha256$216000$yu6iaVKp6P4N$L5KgPmDR1ISdE3YgLCXjaGIdghGgYsN+uzi7pUcV4qI=	\N	f	84d6101f-6fd2-4279-90fe-61e010e74f7d	sample@gmail.com	sample	t	f	2020-09-21 11:44:31.340034+05:30
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: foo
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.bookings_booking_id_seq', 1, false);


--
-- Name: bookings_bookingpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.bookings_bookingpayment_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 51, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: movies_movie_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.movies_movie_genres_id_seq', 2, true);


--
-- Name: movies_movie_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.movies_movie_languages_id_seq', 1, true);


--
-- Name: theaters_row_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.theaters_row_id_seq', 26, true);


--
-- Name: theaters_theaterscreen_show_timings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.theaters_theaterscreen_show_timings_id_seq', 4, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: foo
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: bookings_booking bookings_booking_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_booking
    ADD CONSTRAINT bookings_booking_pkey PRIMARY KEY (id);


--
-- Name: bookings_booking bookings_booking_ticket_id_ce890805_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_booking
    ADD CONSTRAINT bookings_booking_ticket_id_ce890805_uniq UNIQUE (ticket_id);


--
-- Name: bookings_bookingpayment bookings_bookingpayment_payment_id_key; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_bookingpayment
    ADD CONSTRAINT bookings_bookingpayment_payment_id_key UNIQUE (payment_id);


--
-- Name: bookings_bookingpayment bookings_bookingpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_bookingpayment
    ADD CONSTRAINT bookings_bookingpayment_pkey PRIMARY KEY (id);


--
-- Name: cities_city cities_city_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.cities_city
    ADD CONSTRAINT cities_city_pkey PRIMARY KEY (guid);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: languages_language languages_language_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.languages_language
    ADD CONSTRAINT languages_language_pkey PRIMARY KEY (guid);


--
-- Name: movies_genre movies_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_genre
    ADD CONSTRAINT movies_genre_pkey PRIMARY KEY (guid);


--
-- Name: movies_movie_genres movies_movie_genres_movie_id_genre_id_5ff3c723_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_genres
    ADD CONSTRAINT movies_movie_genres_movie_id_genre_id_5ff3c723_uniq UNIQUE (movie_id, genre_id);


--
-- Name: movies_movie_genres movies_movie_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_genres
    ADD CONSTRAINT movies_movie_genres_pkey PRIMARY KEY (id);


--
-- Name: movies_movie_languages movies_movie_languages_movie_id_language_id_11fe4a3d_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_languages
    ADD CONSTRAINT movies_movie_languages_movie_id_language_id_11fe4a3d_uniq UNIQUE (movie_id, language_id);


--
-- Name: movies_movie_languages movies_movie_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_languages
    ADD CONSTRAINT movies_movie_languages_pkey PRIMARY KEY (id);


--
-- Name: movies_movie movies_movie_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie
    ADD CONSTRAINT movies_movie_pkey PRIMARY KEY (guid);


--
-- Name: theaters_bookedticket theaters_bookedticket_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_bookedticket
    ADD CONSTRAINT theaters_bookedticket_pkey PRIMARY KEY (guid);


--
-- Name: theaters_category theaters_category_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_category
    ADD CONSTRAINT theaters_category_pkey PRIMARY KEY (guid);


--
-- Name: theaters_row theaters_row_name_key; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_row
    ADD CONSTRAINT theaters_row_name_key UNIQUE (name);


--
-- Name: theaters_row theaters_row_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_row
    ADD CONSTRAINT theaters_row_pkey PRIMARY KEY (id);


--
-- Name: theaters_theater theaters_theater_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theater
    ADD CONSTRAINT theaters_theater_pkey PRIMARY KEY (guid);


--
-- Name: theaters_theaterscreen theaters_theaterscreen_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen
    ADD CONSTRAINT theaters_theaterscreen_pkey PRIMARY KEY (guid);


--
-- Name: theaters_theaterscreen_show_timings theaters_theaterscreen_s_theaterscreen_id_timings_4c28b1e3_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen_show_timings
    ADD CONSTRAINT theaters_theaterscreen_s_theaterscreen_id_timings_4c28b1e3_uniq UNIQUE (theaterscreen_id, timings_id);


--
-- Name: theaters_theaterscreen_show_timings theaters_theaterscreen_show_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen_show_timings
    ADD CONSTRAINT theaters_theaterscreen_show_timings_pkey PRIMARY KEY (id);


--
-- Name: theaters_theaterscreencategory theaters_theaterscreencategory_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategory
    ADD CONSTRAINT theaters_theaterscreencategory_pkey PRIMARY KEY (guid);


--
-- Name: theaters_theaterscreencategoryrowgap theaters_theaterscreencategoryrowgap_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategoryrowgap
    ADD CONSTRAINT theaters_theaterscreencategoryrowgap_pkey PRIMARY KEY (guid);


--
-- Name: theaters_timings theaters_timings_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_timings
    ADD CONSTRAINT theaters_timings_pkey PRIMARY KEY (guid);


--
-- Name: theaters_timings theaters_timings_start_end_4569e9a8_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_timings
    ADD CONSTRAINT theaters_timings_start_end_4569e9a8_uniq UNIQUE (start, "end");


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (guid);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: bookings_booking_user_id_834dfc23; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX bookings_booking_user_id_834dfc23 ON public.bookings_booking USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: movies_movie_genres_genre_id_c3609db2; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX movies_movie_genres_genre_id_c3609db2 ON public.movies_movie_genres USING btree (genre_id);


--
-- Name: movies_movie_genres_movie_id_ff5e55a1; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX movies_movie_genres_movie_id_ff5e55a1 ON public.movies_movie_genres USING btree (movie_id);


--
-- Name: movies_movie_languages_language_id_f2d52bdc; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX movies_movie_languages_language_id_f2d52bdc ON public.movies_movie_languages USING btree (language_id);


--
-- Name: movies_movie_languages_movie_id_69a43c50; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX movies_movie_languages_movie_id_69a43c50 ON public.movies_movie_languages USING btree (movie_id);


--
-- Name: theaters_bookedticket_category_id_eb9073c5; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_bookedticket_category_id_eb9073c5 ON public.theaters_bookedticket USING btree (category_id);


--
-- Name: theaters_bookedticket_row_id_4a7a96a1; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_bookedticket_row_id_4a7a96a1 ON public.theaters_bookedticket USING btree (row_id);


--
-- Name: theaters_bookedticket_show_time_id_4fd41c09; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_bookedticket_show_time_id_4fd41c09 ON public.theaters_bookedticket USING btree (show_time_id);


--
-- Name: theaters_row_name_e5b0be12_like; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_row_name_e5b0be12_like ON public.theaters_row USING btree (name varchar_pattern_ops);


--
-- Name: theaters_theater_city_id_8f10ea3c; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theater_city_id_8f10ea3c ON public.theaters_theater USING btree (city_id);


--
-- Name: theaters_theaterscreen_movie_id_b7f1af48; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreen_movie_id_b7f1af48 ON public.theaters_theaterscreen USING btree (movie_id);


--
-- Name: theaters_theaterscreen_show_timings_theaterscreen_id_2214d3e6; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreen_show_timings_theaterscreen_id_2214d3e6 ON public.theaters_theaterscreen_show_timings USING btree (theaterscreen_id);


--
-- Name: theaters_theaterscreen_show_timings_timings_id_d2fdb4c0; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreen_show_timings_timings_id_d2fdb4c0 ON public.theaters_theaterscreen_show_timings USING btree (timings_id);


--
-- Name: theaters_theaterscreen_theater_id_5c77ba4f; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreen_theater_id_5c77ba4f ON public.theaters_theaterscreen USING btree (theater_id);


--
-- Name: theaters_theaterscreencategory_category_id_d60b110d; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreencategory_category_id_d60b110d ON public.theaters_theaterscreencategory USING btree (category_id);


--
-- Name: theaters_theaterscreencategory_last_row_id_cadeaa83; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreencategory_last_row_id_cadeaa83 ON public.theaters_theaterscreencategory USING btree (last_row_id);


--
-- Name: theaters_theaterscreencategory_screen_id_2dfd4759; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreencategory_screen_id_2dfd4759 ON public.theaters_theaterscreencategory USING btree (screen_id);


--
-- Name: theaters_theaterscreencategoryrowgap_category_id_c50f8c27; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreencategoryrowgap_category_id_c50f8c27 ON public.theaters_theaterscreencategoryrowgap USING btree (category_id);


--
-- Name: theaters_theaterscreencategoryrowgap_row_id_fe67b590; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX theaters_theaterscreencategoryrowgap_row_id_fe67b590 ON public.theaters_theaterscreencategoryrowgap USING btree (row_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: foo
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_guid FOREIGN KEY (user_id) REFERENCES public.users_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_booking bookings_booking_ticket_id_ce890805_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_booking
    ADD CONSTRAINT bookings_booking_ticket_id_ce890805_fk_theaters_ FOREIGN KEY (ticket_id) REFERENCES public.theaters_bookedticket(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_booking bookings_booking_user_id_834dfc23_fk_users_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_booking
    ADD CONSTRAINT bookings_booking_user_id_834dfc23_fk_users_user_guid FOREIGN KEY (user_id) REFERENCES public.users_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bookings_bookingpayment bookings_bookingpaym_payment_id_1fdd6f06_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.bookings_bookingpayment
    ADD CONSTRAINT bookings_bookingpaym_payment_id_1fdd6f06_fk_theaters_ FOREIGN KEY (payment_id) REFERENCES public.theaters_bookedticket(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_guid FOREIGN KEY (user_id) REFERENCES public.users_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: movies_movie_genres movies_movie_genres_genre_id_c3609db2_fk_movies_genre_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_genres
    ADD CONSTRAINT movies_movie_genres_genre_id_c3609db2_fk_movies_genre_guid FOREIGN KEY (genre_id) REFERENCES public.movies_genre(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: movies_movie_genres movies_movie_genres_movie_id_ff5e55a1_fk_movies_movie_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_genres
    ADD CONSTRAINT movies_movie_genres_movie_id_ff5e55a1_fk_movies_movie_guid FOREIGN KEY (movie_id) REFERENCES public.movies_movie(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: movies_movie_languages movies_movie_languag_language_id_f2d52bdc_fk_languages; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_languages
    ADD CONSTRAINT movies_movie_languag_language_id_f2d52bdc_fk_languages FOREIGN KEY (language_id) REFERENCES public.languages_language(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: movies_movie_languages movies_movie_languages_movie_id_69a43c50_fk_movies_movie_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.movies_movie_languages
    ADD CONSTRAINT movies_movie_languages_movie_id_69a43c50_fk_movies_movie_guid FOREIGN KEY (movie_id) REFERENCES public.movies_movie(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_bookedticket theaters_bookedticke_category_id_eb9073c5_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_bookedticket
    ADD CONSTRAINT theaters_bookedticke_category_id_eb9073c5_fk_theaters_ FOREIGN KEY (category_id) REFERENCES public.theaters_theaterscreencategory(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_bookedticket theaters_bookedticke_show_time_id_4fd41c09_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_bookedticket
    ADD CONSTRAINT theaters_bookedticke_show_time_id_4fd41c09_fk_theaters_ FOREIGN KEY (show_time_id) REFERENCES public.theaters_timings(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_bookedticket theaters_bookedticket_row_id_4a7a96a1_fk_theaters_row_id; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_bookedticket
    ADD CONSTRAINT theaters_bookedticket_row_id_4a7a96a1_fk_theaters_row_id FOREIGN KEY (row_id) REFERENCES public.theaters_row(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theater theaters_theater_city_id_8f10ea3c_fk_cities_city_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theater
    ADD CONSTRAINT theaters_theater_city_id_8f10ea3c_fk_cities_city_guid FOREIGN KEY (city_id) REFERENCES public.cities_city(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreencategoryrowgap theaters_theaterscre_category_id_c50f8c27_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategoryrowgap
    ADD CONSTRAINT theaters_theaterscre_category_id_c50f8c27_fk_theaters_ FOREIGN KEY (category_id) REFERENCES public.theaters_theaterscreencategory(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreencategory theaters_theaterscre_category_id_d60b110d_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategory
    ADD CONSTRAINT theaters_theaterscre_category_id_d60b110d_fk_theaters_ FOREIGN KEY (category_id) REFERENCES public.theaters_category(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreencategory theaters_theaterscre_last_row_id_cadeaa83_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategory
    ADD CONSTRAINT theaters_theaterscre_last_row_id_cadeaa83_fk_theaters_ FOREIGN KEY (last_row_id) REFERENCES public.theaters_row(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreencategoryrowgap theaters_theaterscre_row_id_fe67b590_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategoryrowgap
    ADD CONSTRAINT theaters_theaterscre_row_id_fe67b590_fk_theaters_ FOREIGN KEY (row_id) REFERENCES public.theaters_row(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreencategory theaters_theaterscre_screen_id_2dfd4759_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreencategory
    ADD CONSTRAINT theaters_theaterscre_screen_id_2dfd4759_fk_theaters_ FOREIGN KEY (screen_id) REFERENCES public.theaters_theaterscreen(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreen theaters_theaterscre_theater_id_5c77ba4f_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen
    ADD CONSTRAINT theaters_theaterscre_theater_id_5c77ba4f_fk_theaters_ FOREIGN KEY (theater_id) REFERENCES public.theaters_theater(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreen_show_timings theaters_theaterscre_theaterscreen_id_2214d3e6_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen_show_timings
    ADD CONSTRAINT theaters_theaterscre_theaterscreen_id_2214d3e6_fk_theaters_ FOREIGN KEY (theaterscreen_id) REFERENCES public.theaters_theaterscreen(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreen_show_timings theaters_theaterscre_timings_id_d2fdb4c0_fk_theaters_; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen_show_timings
    ADD CONSTRAINT theaters_theaterscre_timings_id_d2fdb4c0_fk_theaters_ FOREIGN KEY (timings_id) REFERENCES public.theaters_timings(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: theaters_theaterscreen theaters_theaterscreen_movie_id_b7f1af48_fk_movies_movie_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.theaters_theaterscreen
    ADD CONSTRAINT theaters_theaterscreen_movie_id_b7f1af48_fk_movies_movie_guid FOREIGN KEY (movie_id) REFERENCES public.movies_movie(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_guid FOREIGN KEY (user_id) REFERENCES public.users_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: foo
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_guid FOREIGN KEY (user_id) REFERENCES public.users_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

