--
-- PostgreSQL database dump
--

\restrict Vn6Ln50qStfr67r7Cy3URrAUKoQf2unndmgkBGmCw7lx7Tnx9D24oKRcalAE9hX

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.4

-- Started on 2026-09-01 18:00:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 16427)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16426)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 224 (class 1259 OID 16411)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50) NOT NULL,
    total_amount numeric(10,2) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16410)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 228 (class 1259 OID 16449)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    order_id integer NOT NULL,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    amount numeric(10,2) NOT NULL,
    status character varying(50) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16448)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 227
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    category character varying(100),
    price numeric(10,2) NOT NULL,
    stock_quantity integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16399)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4881 (class 2604 OID 16430)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 16414)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 16452)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 16403)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4876 (class 2604 OID 16393)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5052 (class 0 OID 16427)
-- Dependencies: 226
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, quantity, price) FROM stdin;
1	1	1	2	1200.00
2	1	3	1	2500.00
3	2	2	1	800.00
4	2	5	2	1500.00
5	3	4	1	3200.00
6	3	7	3	450.00
7	4	1	1	1200.00
8	4	6	2	2100.00
9	5	8	1	900.00
10	5	10	2	1800.00
11	6	3	1	2500.00
12	7	2	3	800.00
13	8	5	1	1500.00
14	9	9	2	1100.00
15	10	4	1	3200.00
16	11	1	2	1200.00
17	12	7	1	450.00
18	13	6	1	2100.00
19	14	8	3	900.00
20	15	10	1	1800.00
\.


--
-- TOC entry 5050 (class 0 OID 16411)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, order_date, status, total_amount) FROM stdin;
1	1	2026-08-01 10:15:00	completed	66500.00
2	2	2026-08-02 12:30:00	completed	4500.00
3	3	2026-08-03 14:20:00	pending	18000.00
4	4	2026-08-04 09:45:00	completed	9700.00
5	5	2026-08-05 16:10:00	cancelled	2200.00
6	6	2026-08-06 11:25:00	completed	12000.00
7	7	2026-08-07 13:40:00	pending	9000.00
8	8	2026-08-08 15:00:00	completed	2500.00
9	9	2026-08-09 17:30:00	completed	73500.00
10	10	2026-08-10 10:00:00	pending	8500.00
11	11	2026-08-11 12:15:00	completed	1500.00
12	12	2026-08-12 14:45:00	completed	27000.00
13	13	2026-08-13 09:30:00	cancelled	4500.00
14	14	2026-08-14 16:20:00	completed	10000.00
15	15	2026-08-15 18:00:00	pending	7500.00
16	1	2026-08-16 11:10:00	completed	2200.00
17	2	2026-08-17 13:25:00	completed	18000.00
18	3	2026-08-18 15:40:00	pending	12000.00
19	4	2026-08-19 10:50:00	completed	9000.00
20	5	2026-08-20 17:15:00	completed	65000.00
\.


--
-- TOC entry 5054 (class 0 OID 16449)
-- Dependencies: 228
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, order_id, payment_date, amount, status) FROM stdin;
2	1	2026-08-01 10:15:00	4900.00	paid
3	2	2026-08-02 11:20:00	3800.00	paid
4	3	2026-08-03 12:10:00	4550.00	paid
5	4	2026-08-04 09:45:00	5400.00	paid
6	5	2026-08-05 14:30:00	4500.00	paid
7	6	2026-08-06 16:20:00	2500.00	paid
8	7	2026-08-07 10:05:00	2400.00	paid
9	8	2026-08-08 13:40:00	1500.00	paid
10	9	2026-08-09 15:10:00	2200.00	paid
11	10	2026-08-10 11:50:00	3200.00	paid
12	11	2026-08-11 12:25:00	2400.00	paid
13	12	2026-08-12 17:05:00	450.00	paid
14	13	2026-08-13 09:30:00	2100.00	paid
15	14	2026-08-14 14:15:00	2700.00	paid
16	15	2026-08-15 10:40:00	1800.00	paid
17	16	2026-08-16 13:20:00	9999.00	paid
18	17	2026-08-17 15:45:00	0.00	paid
19	18	2026-08-18 11:10:00	1500.00	pending
20	19	2026-08-19 16:35:00	3200.00	paid
21	20	2026-08-20 10:55:00	450.00	paid
\.


--
-- TOC entry 5048 (class 0 OID 16400)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, category, price, stock_quantity) FROM stdin;
1	Ноутбук Lenovo IdeaPad	Ноутбуки	65000.00	12
2	Мышь Logitech M185	Аксессуары	1500.00	50
3	Клавиатура Logitech K120	Аксессуары	2200.00	35
4	Монитор Samsung 24"	Мониторы	18000.00	20
5	Наушники JBL Tune 510BT	Аудио	4500.00	25
6	SSD Kingston 1TB	Комплектующие	7500.00	18
7	Веб-камера Logitech C920	Аксессуары	8500.00	10
8	Микрофон HyperX SoloCast	Аудио	9000.00	8
9	USB-флешка Kingston 128GB	Носители	1200.00	100
10	Коврик для мыши Razer	Аксессуары	2500.00	40
\.


--
-- TOC entry 5046 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, created_at) FROM stdin;
1	Иван Петров	ivan.petrov@example.com	2026-09-01 16:19:06.305742
2	Анна Смирнова	anna.smirnova@example.com	2026-09-01 16:19:06.305742
3	Дмитрий Иванов	dmitry.ivanov@example.com	2026-09-01 16:19:06.305742
4	Елена Кузнецова	elena.kuznetsova@example.com	2026-09-01 16:19:06.305742
5	Алексей Соколов	alexey.sokolov@example.com	2026-09-01 16:19:06.305742
6	Мария Попова	maria.popova@example.com	2026-09-01 16:19:06.305742
7	Сергей Лебедев	sergey.lebedev@example.com	2026-09-01 16:19:06.305742
8	Ольга Новикова	olga.novikova@example.com	2026-09-01 16:19:06.305742
9	Андрей Морозов	andrey.morozov@example.com	2026-09-01 16:19:06.305742
10	Наталья Волкова	natalia.volkova@example.com	2026-09-01 16:19:06.305742
11	Максим Федоров	maxim.fedorov@example.com	2026-09-01 16:19:06.305742
12	Екатерина Михайлова	ekaterina.mikhailova@example.com	2026-09-01 16:19:06.305742
13	Роман Орлов	roman.orlov@example.com	2026-09-01 16:19:06.305742
14	Татьяна Захарова	tatyana.zakharova@example.com	2026-09-01 16:19:06.305742
15	Павел Виноградов	pavel.vinogradov@example.com	2026-09-01 16:19:06.305742
\.


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 225
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 20, true);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 223
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 20, true);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 227
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 21, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 10, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- TOC entry 4891 (class 2606 OID 16437)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 16420)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 16459)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 16409)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4885 (class 2606 OID 16398)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 16438)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4896 (class 2606 OID 16443)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4894 (class 2606 OID 16421)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4897 (class 2606 OID 16460)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


-- Completed on 2026-09-01 18:00:13

--
-- PostgreSQL database dump complete
--

\unrestrict Vn6Ln50qStfr67r7Cy3URrAUKoQf2unndmgkBGmCw7lx7Tnx9D24oKRcalAE9hX

