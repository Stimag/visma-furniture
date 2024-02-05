--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-02-05 23:33:09

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

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: my_schema; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA my_schema;


ALTER SCHEMA my_schema OWNER TO pg_database_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16554)
-- Name: customer; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.customer (
    id uuid DEFAULT my_schema.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    membership boolean NOT NULL
);


ALTER TABLE my_schema.customer OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16607)
-- Name: food; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.food (
    id uuid DEFAULT my_schema.uuid_generate_v4() NOT NULL,
    flavor text,
    product_id uuid
);


ALTER TABLE my_schema.food OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16595)
-- Name: furniture; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.furniture (
    id uuid DEFAULT my_schema.uuid_generate_v4() NOT NULL,
    weight double precision,
    product_id uuid,
    product_number character varying(100)
);


ALTER TABLE my_schema.furniture OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16566)
-- Name: order; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema."order" (
    id uuid DEFAULT my_schema.uuid_generate_v4() NOT NULL,
    order_date date NOT NULL,
    total_price double precision NOT NULL,
    customer_id uuid,
    products text[]
);


ALTER TABLE my_schema."order" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16548)
-- Name: product; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.product (
    id uuid DEFAULT my_schema.uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    category text
);


ALTER TABLE my_schema.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16601)
-- Name: textile; Type: TABLE; Schema: my_schema; Owner: postgres
--

CREATE TABLE my_schema.textile (
    id uuid DEFAULT my_schema.uuid_generate_v4() NOT NULL,
    color text,
    product_id uuid,
    product_number character varying(100)
);


ALTER TABLE my_schema.textile OWNER TO postgres;

--
-- TOC entry 4831 (class 0 OID 16554)
-- Dependencies: 217
-- Data for Name: customer; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

COPY my_schema.customer (id, name, membership) FROM stdin;
8c1d181b-e1ef-4021-a549-75e4ebf41052	Stian	f
90066e32-4e39-4b15-b91f-b576d49bcc24	Belen	t
\.


--
-- TOC entry 4835 (class 0 OID 16607)
-- Dependencies: 221
-- Data for Name: food; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

COPY my_schema.food (id, flavor, product_id) FROM stdin;
3a58ecae-4128-4451-a23e-c684a2c8a9fb	Chili	367300d8-ed83-4e5a-9f7b-dd77f07e7c00
b801eb10-1cb4-4182-a9f1-c96eaa57987d	Vegetarian	a84218a4-5733-421d-95de-c9facd25aef9
\.


--
-- TOC entry 4833 (class 0 OID 16595)
-- Dependencies: 219
-- Data for Name: furniture; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

COPY my_schema.furniture (id, weight, product_id, product_number) FROM stdin;
7a66fc42-a588-4dbb-92d5-fed69ac59b74	19.54	367300d8-ed83-4e5a-9f7b-dd77f07e7c00	123.456.789
\.


--
-- TOC entry 4832 (class 0 OID 16566)
-- Dependencies: 218
-- Data for Name: order; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

COPY my_schema."order" (id, order_date, total_price, customer_id, products) FROM stdin;
809f38b7-8c36-4cd0-88ac-c555071502fd	2024-02-05	1004.98	8c1d181b-e1ef-4021-a549-75e4ebf41052	{"Red Carpet","Chili dog"}
ec539792-a6e7-414f-bfc1-8dc08029c633	2024-02-05	1009.99	8c1d181b-e1ef-4021-a549-75e4ebf41052	{"Blue rug","Red Carpet"}
eb1d770b-c041-4cf2-a246-49f8eb096d99	2024-02-05	144.98000000000002	8c1d181b-e1ef-4021-a549-75e4ebf41052	{Wardrobe,"Blue rug","Chili dog"}
9b679671-6ea1-4ff3-b694-b9855dbf7263	2024-02-05	999.99	90066e32-4e39-4b15-b91f-b576d49bcc24	{"Red Carpet"}
3c0ed16b-8e1e-4bbc-8cd6-984d5444fec9	2024-02-05	233.98200000000003	90066e32-4e39-4b15-b91f-b576d49bcc24	{Wardrobe,Wardrobe}
8eb1b770-f74a-459a-a4b2-844c425f7dea	2024-02-05	999.99	90066e32-4e39-4b15-b91f-b576d49bcc24	{"Red Carpet"}
fbbbbaa3-ba41-4ec2-9ddb-565b4474f81f	2024-02-05	999.99	90066e32-4e39-4b15-b91f-b576d49bcc24	{"Red Carpet"}
\.


--
-- TOC entry 4830 (class 0 OID 16548)
-- Dependencies: 216
-- Data for Name: product; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

COPY my_schema.product (id, name, description, price, category) FROM stdin;
8d5c5e7f-3498-47d8-960a-64ec5543fdbc	Red Carpet	A red carpet that feels great to walk on.	999.99	Textile
367300d8-ed83-4e5a-9f7b-dd77f07e7c00	Chili dog	A hot dog with spice.	4.99	Food
7fc8fda5-e4fb-4ff5-a84c-63ef6b2dfa0b	Wardrobe	Can store lots of clothes.	129.99	Furniture
5ae75672-daab-432c-8563-0d17f48c8ac5	Blue rug	A simple rug.	10	Textile
a84218a4-5733-421d-95de-c9facd25aef9	Veggie hot dog	A vegetarion option for hot dogs.	4.49	Food
\.


--
-- TOC entry 4834 (class 0 OID 16601)
-- Dependencies: 220
-- Data for Name: textile; Type: TABLE DATA; Schema: my_schema; Owner: postgres
--

COPY my_schema.textile (id, color, product_id, product_number) FROM stdin;
8ff36b19-9528-41d7-9946-0713e873993d	Red	8d5c5e7f-3498-47d8-960a-64ec5543fdbc	234.567.890
51939416-3727-4c63-81a2-7958be933bc0	Blue	5ae75672-daab-432c-8563-0d17f48c8ac5	345.678.901
\.


--
-- TOC entry 4673 (class 2606 OID 16559)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 4682 (class 2606 OID 16612)
-- Name: food food_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);


--
-- TOC entry 4678 (class 2606 OID 16600)
-- Name: furniture furniture_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.furniture
    ADD CONSTRAINT furniture_pkey PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 16571)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 4671 (class 2606 OID 16553)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4680 (class 2606 OID 16606)
-- Name: textile textile_pkey; Type: CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.textile
    ADD CONSTRAINT textile_pkey PRIMARY KEY (id);


--
-- TOC entry 4674 (class 1259 OID 16670)
-- Name: fki_Customer_id; Type: INDEX; Schema: my_schema; Owner: postgres
--

CREATE INDEX "fki_Customer_id" ON my_schema."order" USING btree (customer_id);


--
-- TOC entry 4683 (class 2606 OID 16665)
-- Name: order customer_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema."order"
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES my_schema.customer(id) NOT VALID;


--
-- TOC entry 4685 (class 2606 OID 16638)
-- Name: textile product_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.textile
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES my_schema.product(id) NOT VALID;


--
-- TOC entry 4684 (class 2606 OID 16643)
-- Name: furniture product_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.furniture
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES my_schema.product(id) NOT VALID;


--
-- TOC entry 4686 (class 2606 OID 16648)
-- Name: food product_id; Type: FK CONSTRAINT; Schema: my_schema; Owner: postgres
--

ALTER TABLE ONLY my_schema.food
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES my_schema.product(id) NOT VALID;


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA my_schema; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA my_schema FROM PUBLIC;


-- Completed on 2024-02-05 23:33:09

--
-- PostgreSQL database dump complete
--

