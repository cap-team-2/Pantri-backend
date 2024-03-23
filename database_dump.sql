--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_products (
    cart_id integer NOT NULL,
    session_id integer NOT NULL,
    product_id uuid NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT cart_products_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.cart_products OWNER TO postgres;

--
-- Name: cart_products_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_products_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_products_cart_id_seq OWNER TO postgres;

--
-- Name: cart_products_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_products_cart_id_seq OWNED BY public.cart_products.cart_id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    product_id uuid NOT NULL,
    comment text
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    total numeric(10,2) NOT NULL,
    order_placed_at text NOT NULL,
    CONSTRAINT orders_total_check CHECK ((total >= (0)::numeric))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_products (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT orders_products_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.orders_products OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    seller_id uuid NOT NULL,
    name text NOT NULL,
    image text NOT NULL,
    cost numeric(10,2) NOT NULL,
    weight numeric(6,2),
    unit_measurement text,
    category text NOT NULL,
    description text,
    stock integer NOT NULL,
    CONSTRAINT products_cost_check CHECK ((cost >= (0)::numeric)),
    CONSTRAINT products_stock_check CHECK ((stock >= 0)),
    CONSTRAINT products_weight_check CHECK ((weight >= (0)::numeric))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    product_id uuid NOT NULL,
    rating integer,
    CONSTRAINT ratings_rating_check CHECK (((rating >= 0) AND (rating <= 5)))
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: shopping_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_session (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    total numeric(10,2) NOT NULL,
    created_at text NOT NULL,
    CONSTRAINT shopping_session_total_check CHECK ((total >= (0)::numeric))
);


ALTER TABLE public.shopping_session OWNER TO postgres;

--
-- Name: shopping_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shopping_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shopping_session_id_seq OWNER TO postgres;

--
-- Name: shopping_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shopping_session_id_seq OWNED BY public.shopping_session.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    phone text,
    address_1 text,
    address_2 text,
    city text,
    zipcode integer,
    image text NOT NULL,
    type text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: cart_products cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_products_cart_id_seq'::regclass);


--
-- Name: shopping_session id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_session ALTER COLUMN id SET DEFAULT nextval('public.shopping_session_id_seq'::regclass);


--
-- Data for Name: cart_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_products (cart_id, session_id, product_id, quantity) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, user_id, product_id, comment) FROM stdin;
38915f8a-e154-426d-b52c-61dc50d1dd22	7142ef7c-5310-11ee-be56-0242ac120002	74bcb6f2-7f2b-4787-b6cc-cc0446e939d5	This parsely was great, I was able to get a bunch!
16d629d7-7246-4636-b36b-b5cb4d8c074d	bf83f4e0-530d-11ee-be56-0242ac120002	74bcb6f2-7f2b-4787-b6cc-cc0446e939d5	I needed some of this for a recipe
e92e6162-b327-475a-a609-91a0644e80ce	7710079e-a564-44f2-b6b6-1b2b3882a6ef	50b9f14e-1baa-43f2-9e85-b336ea03a6fe	This is from my favorite farmer!
6b0a5022-0882-4038-8d87-dd89933cefdc	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	50b9f14e-1baa-43f2-9e85-b336ea03a6fe	I wish I could support more offten
d29a8947-94d9-487c-a999-7b9db5d5f5e2	7d395d9c-76e1-4c5a-b7f5-0b708785836b	74bcb6f2-7f2b-4787-b6cc-cc0446e939d5	It feels nice to support local farmers
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, total, order_placed_at) FROM stdin;
21d70293-4ee5-4ce8-8fde-599047743451	7d395d9c-76e1-4c5a-b7f5-0b708785836b	12.00	10pm
d848d6c5-6883-4ec0-8e04-d1f6bcec7884	7d395d9c-76e1-4c5a-b7f5-0b708785836b	40.00	11pm
f684e1d6-225f-49c3-8ba9-306cd038f0bd	9e6ef4fb-5574-4968-912a-ea28257d708e	100.30	5pm
\.


--
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_products (id, order_id, product_id, quantity) FROM stdin;
96476349-ef6b-421d-a198-c5ab51f6c6dc	21d70293-4ee5-4ce8-8fde-599047743451	908adff5-351d-471e-8296-6c6e1c82b9be	5
176b98a4-79a0-473e-a810-48797d07ccf9	d848d6c5-6883-4ec0-8e04-d1f6bcec7884	479a1150-a3f3-43f6-89e7-142e8b6943e6	4
923d6578-f5c2-4e83-a139-1468239659d1	f684e1d6-225f-49c3-8ba9-306cd038f0bd	908adff5-351d-471e-8296-6c6e1c82b9be	7
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, seller_id, name, image, cost, weight, unit_measurement, category, description, stock) FROM stdin;
74bcb6f2-7f2b-4787-b6cc-cc0446e939d5	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	parsley	https://images.unsplash.com/photo-1598998255703-ea48fb246da0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80	0.98	2.00	oz	Vegetables	A Bunch Of Freshly Grown Parsley	100
908adff5-351d-471e-8296-6c6e1c82b9be	055038a8-59a3-11ee-8c99-0242ac120002	sunchoke	https://www.mikuniwildharvest.com/mm5/graphics/00000001/1/sunchokes1.jpeg	13.99	2.00	lb	Vegetables	Jerusalem Artichoke	50
479a1150-a3f3-43f6-89e7-142e8b6943e6	9e6ef4fb-5574-4968-912a-ea28257d708e	cauliflower	https://images.unsplash.com/photo-1613743983303-b3e89f8a2b80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80	3.86	2.00	lb	Vegetables	Cauliflower	15
ef81a5a2-b012-45e2-8754-8539c32de3b2	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	quail eggs	https://jacobsheritagefarm.com/wp-content/uploads/2014/08/bigstock-Quail-Eggs-On-Wooden-Backgroun-59882948.jpg	3.99	3.80	oz	Dairy	One Dozen Fresh Quail Eggs	50
46471e87-ca06-4195-82c2-3979a1901f24	08b42780-59a2-11ee-8c99-0242ac120002	red apple	https://images.unsplash.com/photo-1572166365087-96ac83103260?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80	1.30	0.90	lb	Fruits	Juicy Red Apple	20
ecc3af32-5b5c-4871-9e4f-de8397584102	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	orange	https://images.unsplash.com/photo-1551030797-46c120009b82?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80	1.20	0.68	lb	Fruits	Florida Orange	30
4768d8de-b9d9-4915-ae85-682a047e20e0	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	banana	https://images.unsplash.com/photo-1690047003542-9e0c770a0f62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODZ8fGJhbmFuYSUyMGJ1bmNofGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60	1.60	2.70	lb	Fruits	Bunch Of Bananas	15
a7361c07-f66c-4307-8a1b-1454d94883f5	9e6ef4fb-5574-4968-912a-ea28257d708e	cherry	https://images.unsplash.com/photo-1594150749328-c7288bf2eb0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80	3.49	1.00	lb	Fruits	Red Cherries	10
b9f2d47d-a96b-468d-b317-f8d387467f94	9e6ef4fb-5574-4968-912a-ea28257d708e	strawberry	https://images.unsplash.com/photo-1569613562636-7492d9f77aed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2848&q=80	5.76	2.00	lb	Fruits	Bundle Of Fresh Strawberries	40
0d2b71de-5721-11ee-8c99-0242ac120002	9e6ef4fb-5574-4968-912a-ea28257d708e	watermelon	https://images.unsplash.com/photo-1632751291436-0ed76ad22f9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2978&q=80	8.40	7.00	lb	Fruits	Whole Watermelon	20
c4cf3176-8d65-48bc-93b7-888505179ea4	9e6ef4fb-5574-4968-912a-ea28257d708e	blueberry	https://images.unsplash.com/photo-1445628680538-19da88adb5bb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80	3.59	24.00	oz	Fruits	Bundle Of Fresh Blueberries	100
840c66c9-92df-48d7-9c00-23e8031481e1	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	raspberry	https://images.unsplash.com/photo-1620417981458-1c9990f17b45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80	2.97	6.00	oz	Fruits	Bundle Of Fresh Raspberries	100
37dbc664-5476-4a67-a3c7-1f8a65bddafa	9e6ef4fb-5574-4968-912a-ea28257d708e	blackberry	https://images.unsplash.com/photo-1500301802642-622bee979621?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2880&q=80	2.97	6.00	oz	Fruits	Bundle Of Blackberries	100
d3c0232b-7ecf-4849-81b7-50f7f7a1d638	08b42780-59a2-11ee-8c99-0242ac120002	red grapes	https://images.unsplash.com/photo-1596380862374-ad7fa9407822?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80	4.68	2.22	lb	Fruits	Bundle Of Red Grapes	50
1630c00b-1b0f-40c0-9729-19bda1f00531	9e6ef4fb-5574-4968-912a-ea28257d708e	green grapes	https://images.unsplash.com/photo-1605164881986-cf242f87f711?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2948&q=80	4.68	2.22	lb	Fruits	Bundle Of Green Grapes	50
94a3c367-863e-4ed2-bbf1-91e848d038c6	08b42780-59a2-11ee-8c99-0242ac120002	black grapes	https://images.unsplash.com/photo-1504868173-db962b7c3757?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80	4.68	2.22	lb	Fruits	Bundle Of Black Grapes	50
e50a19a9-e730-457c-b8b3-c1cdcd736718	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	duck eggs	https://i.ebayimg.com/images/g/UcEAAOSwmBhiRvQX/s-l960.png	6.29	13.80	oz	Dairy	Duck Eggs	30
3a637835-5a69-4dc5-86dc-37007ca04795	08b42780-59a2-11ee-8c99-0242ac120002	chicken eggs	https://assets.wfcdn.com/im/68603822/resize-h445%5Ecompr-r85/2313/231347907/Organic+Brown+Eggs+On+Canvas+by+Dmuratsahin+Print.jpg	2.99	24.00	oz	dairy	Chicken Eggs	100
c268c3c0-d219-4a7a-a6f3-c62592e4f6f0	9e6ef4fb-5574-4968-912a-ea28257d708e	cows milk	https://images.unsplash.com/photo-1523473827533-2a64d0d36748?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2960&q=80	4.26	1.00	lb	dairy	Cows Milk	50
e5786026-877b-4cb6-a310-392aef64d7b8	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	buttermilk	https://www.aspicyperspective.com/wp-content/uploads/2019/10/How-To-Make-Buttermilk-15.jpg	4.49	1.00	qt	dairy	Buttermilk	25
019fd618-198f-4e09-866b-6f539eb88277	08b42780-59a2-11ee-8c99-0242ac120002	heavy cream	https://res.cloudinary.com/hz3gmuqw6/image/upload/c_fill,q_auto,w_750/f_auto/heavy-cream-substitute-phpogRHC4	5.99	1.00	qt	dairy	Heavy Cream	25
364fbdce-3dc2-492e-ad64-a1add3fe9a44	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	yogurt	https://www.alphafoodie.com/wp-content/uploads/2022/11/Natural-Yogurt-Main-1.jpeg	5.49	24.00	oz	dairy	Yogurt	50
15e9e648-6837-4f70-ab81-d62326024261	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	greek yogurt	https://www.homemadefoodjunkie.com/wp-content/uploads/2021/11/greek-yogurt-3.jpg.webp	5.89	32.00	oz	dairy	Greek Yogurt	50
35d85556-9f43-4365-b93e-442377b79f8f	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	soy milk	https://woonheng.com/wp-content/uploads/2021/07/Homemade-Soymilk-5693-3-e1627507383825.jpg	3.89	32.00	oz	dairy alternative	Soy Milk	50
8443fc9b-618e-4ef2-976a-a61ccddd5fcd	9e6ef4fb-5574-4968-912a-ea28257d708e	oat milk	https://images.immediate.co.uk/production/volatile/sites/30/2020/04/oat-milk73-e160b62.jpg?quality=90&webp=true&fit=724,482	5.89	32.00	oz	dairy alternative	Oat Milk	50
f0f11c33-f5de-499c-829f-2fe63abe0826	9e6ef4fb-5574-4968-912a-ea28257d708e	rice milk	https://capital-brands-llc.imgix.net/recipe-r2362-rice-milk-fullsize-061602.jpg	4.99	32.00	oz	dairy alternative	Rice Milk	20
673d6e03-fc72-4ea7-b6fb-5bab830bbc63	9e6ef4fb-5574-4968-912a-ea28257d708e	potato milk	https://hips.hearstapps.com/hmg-prod/images/potato-milk-alternative-non-dairy-drink-in-glass-royalty-free-image-1644264955.jpg	8.99	32.00	oz	dairy alternative	Potato Milk	20
8956e23b-5898-42db-a3f3-a0a706486bc3	9e6ef4fb-5574-4968-912a-ea28257d708e	hemp milk	https://www.alphafoodie.com/wp-content/uploads/2020/03/All-Milks-2-of-7-e1583253966416.jpeg	4.99	32.00	oz	dairy alternative	Hemp Milk	50
129a72a5-1050-4db5-a7d3-71327e7c8f76	9e6ef4fb-5574-4968-912a-ea28257d708e	almond milk	https://images.immediate.co.uk/production/volatile/sites/30/2020/04/almond-milk73-955d56f.jpg?quality=90&webp=true&fit=724,362	3.99	32.00	oz	dairy alternative	Almond Milk	50
0e32c2b3-d6f4-4ab1-9a03-a9063a60ff74	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	raw honey	https://draxe.com/wp-content/uploads/2018/08/Raw-Honey_FB.jpg	4.29	12.00	oz	sweetner	Raw Honey	100
f0df5714-0ee8-4756-9659-c5ff548e7a21	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	brown sugar	https://www.allrecipes.com/thmb/DDBIQrQeoVvBiTCdmDu0eqhZbLA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/230511_LightorDarkBrownSugar_ddmfs_4x3_2404-8bd53810c76d4ac1b2db0cd83e7fb88a.jpg	3.39	32.00	oz	sweetner	Brown Sugar	100
fc42791d-c05f-4164-9a1f-7143ef151a50	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	honey comb	https://www.grandturkishbazaar.com/wp-content/uploads/2019/01/turkish-honeycomb.jpg	3.39	32.00	oz	sweetner	Honey Comb	10
18ff0258-5313-11ee-be56-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	mushroom	https://images.unsplash.com/photo-1628237117116-3afb22d021f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2828&q=80	4.99	10.00	oz	Vegetables	Mushroom	35
91dd51c2-5316-11ee-be56-0242ac120002	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	tomatoes	https://images.unsplash.com/photo-1592924357228-91a4daadcfea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2804&q=80	5.29	2.00	lb	Vegetables	Juicy Vine Tomatoes	80
9c874086-5318-11ee-be56-0242ac120002	bf83f4e0-530d-11ee-be56-0242ac120002	cucumbers	https://images.unsplash.com/photo-1611048661702-7b55eed346b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80	2.59	1.35	lb	Vegetables	Cucumbers	40
bedc3e88-5319-11ee-be56-0242ac120002	bf83f4e0-530d-11ee-be56-0242ac120002	zucchini	https://images.unsplash.com/photo-1563252722-6434563a985d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8enVjY2hpbml8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60	0.93	1.48	lb	Vegetables	Zucchini	40
99e2dea6-531a-11ee-be56-0242ac120002	bf83f4e0-530d-11ee-be56-0242ac120002	scallion	https://images.unsplash.com/photo-1602769515559-e15133a7e992?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2NhbGxpb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60	1.29	5.50	oz	Vegetables	Bundle of Scallions	38
9c85246a-531b-11ee-be56-0242ac120002	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	corn	https://images.unsplash.com/photo-1551754655-cd27e38d2076?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y29ybnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60	0.89	18.00	oz	Vegetables	Corn On The Cob	100
941a5c0e-531c-11ee-be56-0242ac120002	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	pumpkin	https://images.unsplash.com/photo-1506917728037-b6af01a7d403?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHVtcGtpbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60	2.68	2.80	lb	Vegetables	Orange pumpkin	30
04f70baa-d46f-4d03-b12b-4144abdce394	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	aloe vera	https://i.ebayimg.com/images/g/V2UAAOSwyk9kEbsV/s-l1600.jpg	2.28	2.00	lb	Vegetables	Aloe Vera Leaves	10
a2b3d497-8993-487f-a202-44281fa996cd	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	beetroot	https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/AN172-Beets-1296x728-Header.jpg?w=1155&h=1528	4.89	1.00	lb	Vegetables	Fresh Grown Beetroots	32
17b440c2-c709-40a2-8e30-be2660b69c21	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	cabbage	https://www.tastingtable.com/img/gallery/what-to-look-for-when-youre-buying-cabbage/l-intro-1667316454.jpg	2.98	1.00	lbs	Vegetables	Fresh Green Cabbage	20
14624213-685c-4f0e-8f5c-4a601c84a160	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	spinach	https://i5.walmartimages.com/asr/d089d4cd-03d1-48c4-9763-820cc2301405.031ad12a37b73958e036c00eb5ee09ff.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF	5.29	0.33	oz	Vegetables	Bundle Of Fresh Spinach	100
03b94bd8-80bc-4e58-8f19-30b6b5279b67	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	kale	https://www.freshdirect.com/media/images/product/veg_3/veg_grns_kale_or_j.jpg?lastModify=2021-03-26&publishId=3244	2.29	67.00	oz	Vegetables	Bundle Of Fresh Kale	30
208793f1-236a-4b70-8d1c-f57e1b7cfc3b	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	radish	https://www.instacart.com/image-server/466x466/filters:fill(FFF,true):format(webp)/www.instacart.com/assets/domains/product-image/file/large_bdca7ec2-6b4c-4a42-aefb-7f3338ab6edb.jpg	1.49	1.00	oz	Vegetables	Red Radish	12
522f2357-63d9-43fd-99b0-0b918961014b	055038a8-59a3-11ee-8c99-0242ac120002	cabbage	https://m.media-amazon.com/images/I/61tWRKfKz2L._AC_SX522_.jpg	2.98	1.00	lb	Vegetables	Fresh Red Cabbage	20
0f3b50af-5706-4891-b134-545f9a1310af	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	turnips	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Turnip_2622027.jpg/800px-Turnip_2622027.jpg	4.25	1.00	oz	Vegetables	Freshly Grown Turnips	20
01c6fb97-ac91-4cf3-9229-22b47b02c116	bf83f4e0-530d-11ee-be56-0242ac120002	carrots	https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80	0.98	1.00	lb	Vegetables	Bunch of Carrots With Stems	30
3ec4616e-db0a-4087-b81f-d3b91858f818	bf83f4e0-530d-11ee-be56-0242ac120002	green bell peppers	https://images.unsplash.com/photo-1622376242797-538aa64a9d38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2919&q=80	1.50	4.00	oz	Vegetables	Green Bell Peppers	50
50b9f14e-1baa-43f2-9e85-b336ea03a6fe	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	White Onion	https://omindianmarket.com/cdn/shop/products/white_onion.jpg?v=1598010241	1.41	1.00	lb	Vegetables	Onion	10
316ccbc2-8aa7-4855-8059-b43a7281bbd3	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	Yellow Onion	https://www.kroger.com/product/images/large/front/0000000004093	1.51	1.00	lb	Vegetables	Onion	30
6a0c1639-87b3-49f7-ac37-a614b59510f2	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	Celery	https://nearlynakedveg.co.uk/cdn/shop/products/Depositphotos_12279854_S.jpg?v=1681376705	1.27	1.00	lb	Vegetables	Celery	20
7d811031-ac9c-473a-b415-623b3ac6e3f9	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	Garlic	https://www.groworganic.com/cdn/shop/products/conventionally-grown-garlic-elephant-lb.jpg?v=1685674203	3.81	1.00	lb	Vegetables	Garlic	10
1e0d2360-6c56-4dbf-b697-06c75ea1ac20	055038a8-59a3-11ee-8c99-0242ac120002	Cilantro	https://asian-veggies.com/cdn/shop/products/cilantro_1200x1200.jpg?v=1626104591	1.48	1.00	bunch	Vegetables	Cilantro,coriander	10
952d3d84-fc9d-4081-9342-46eadc4c3a25	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	Thyme	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Thyme-Bundle.jpg/640px-Thyme-Bundle.jpg	1.50	1.00	lb	Vegetable,herb	thyme	30
b6088704-3c4e-4d5d-99d4-45b80b37b1bb	bf83f4e0-530d-11ee-be56-0242ac120002	red bell peppers	https://bonnieplants.com/cdn/shop/products/060721_T110854_202044_202178_Bonnie_PepperRedBell_ALT_02.jpg?v=1653586938&width=2048	1.50	4.00	oz	Vegetables	Red Bell Peppers	50
e1fb5b41-ba64-44d4-923d-308b462151aa	055038a8-59a3-11ee-8c99-0242ac120002	Djon Djon Mushroom	https://tchakayiti.com/home/wp-content/uploads/2014/03/djondjon-haiti-wild-mushroom-tchakayiti.jpg	14.99	1.50	ounce	Vegetables	Hatian Mushroom	5
f84127d8-f308-49b6-ab9c-f7ce99727136	bf83f4e0-530d-11ee-be56-0242ac120002	yellow Bell peppers	https://bonnieplants.com/cdn/shop/products/061422_T118630_202037_Bonnie_YeloBellPepper_ALT_02.jpg?v=1656010170&width=2048	1.50	4.00	oz	Vegetables	Yellow Bell Peppers	50
5b747b3d-f5ad-4af9-b787-050e8fa16dbe	bf83f4e0-530d-11ee-be56-0242ac120002	orange Bell peppers	https://mattspatch.com/cdn/shop/products/OrangeBell_4e7ca251-e718-4b5c-9e87-f8a202922af2_300x300.jpg?v=1677986614	1.50	4.00	oz	Vegetables	Orange Bell Peppers	50
ee41e122-9932-4f9a-bd02-60512f0d6302	bf83f4e0-530d-11ee-be56-0242ac120002	chicken breasts	https://images.unsplash.com/photo-1633096013004-e2cb4023b560?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80	9.99	4.00	lb	meat	Boneless Chicken Breasts	50
6ffe66f7-3a09-469a-a160-947893411b0d	bf83f4e0-530d-11ee-be56-0242ac120002	cheese	https://trello.com/1/cards/64ecea067f38ea4ef40407d1/attachments/6500a484ea3127410b6a1a75/previews/6500a485ea3127410b6a1b10/download/Fresh_Cheese.jpg	15.00	1.50	lb	dairy	Homemade Cheese	20
a80b6598-1172-49f4-b7cc-b6bf1e0245e7	bf83f4e0-530d-11ee-be56-0242ac120002	beef jerky	https://www.allrecipes.com/thmb/agthAVtVq7TaAMe8PAAmWYb1KGE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/241555-homemade-beef-jerky-DDMFS-4x3-51153db155f940b69ae1db4aec7b20e9.jpg	10.00	1.00	lb	meat	Beef Jerky Pouches	100
3545e69b-2744-40f7-bd4b-a2a931b325a0	bf83f4e0-530d-11ee-be56-0242ac120002	short ribs	https://bakingmischief.com/wp-content/uploads/2019/07/short-ribs-image-raw-ribs.jpg	6.00	3.00	lb	meat	Beef Short Ribs	60
9317ce27-f660-452f-b144-ee7d9187dada	bf83f4e0-530d-11ee-be56-0242ac120002	turkey bacon	https://i0.wp.com/bensabaconlovers.com/wp-content/uploads/2022/08/Turkey-bacon-featured.jpg	15.00	16.00	oz	meat	Turkey Bacon Packages	30
515b29c7-5647-48bf-9102-030e8fec7f2c	bf83f4e0-530d-11ee-be56-0242ac120002	turkey	https://www.realsimple.com/thmb/8Vfov7k1dfir5JJ3tQVS-SOijWw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/when-to-buy-a-thanksgiving-turkey-realsimple-GettyImages-1042438108-067155736c7c4015bb25c3e2fc949a61.jpg	30.00	20.00	lb	meat	Fresh Whole Turkey	20
e5d234ac-d1ef-45e4-ab0b-660f5f2fe397	bf83f4e0-530d-11ee-be56-0242ac120002	duck	https://img.freepik.com/premium-photo/raw-duck-with-herb-spices-ready-cook-fresh-duck-meat-wooden-tray-food-whole-duck_73523-5261.jpg?w=2000	20.00	12.00	lb	meat	Fresh Whole Duck	10
ebf667da-ed97-4ee3-9410-901a36c9d481	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	cornish hen	https://cdn7.bigcommerce.com/s-kloz71qit7/images/stencil/1280x1280/products/701/588/Cornish_Hen_0584fc-1600x1200__98575.1505783330.jpg?c=2&imbypass=on&imbypass=on	8.00	2.00	lb	meat	Fresh Whole Cornish Hen	12
21b26024-59a4-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	romaine lettuce	https://bonnieplants.com/cdn/shop/products/060721_T110854_201997_202120_Bonnie_RomaineLettuce_ALT_01.jpg?v=1653420386	2.19	1.50	lb	Vegetables	Crispy Crunchy Green Romaine Lettuce	100
efdc2fe4-5ca5-11ee-8c99-0242ac120002	08b42780-59a2-11ee-8c99-0242ac120002	Homestyle Sweet Potato Pie	https://www.parkersbbq.com/cdn/shop/products/Parker_sBarbecueSweetPotatoPie_1024x.png?v=1622137247	8.95	22.00	oz	desserts	A family Recipe, Made From Tasty Sweet Potatoes	9
0f98dd45-8b48-49a3-91af-c20f5beaef46	08b42780-59a2-11ee-8c99-0242ac120002	Homestyle Apple Pie	https://cdn11.bigcommerce.com/s-7ktwhbi/images/stencil/1024x1024/products/76/292/1038_MamaJos_0034__80002.1414084442.jpg?c=2	10.00	34.00	oz	desserts	Our Own Apple Pie Filling Using The Most Flavorful Apples	12
a99e42d2-5ca6-11ee-8c99-0242ac120002	08b42780-59a2-11ee-8c99-0242ac120002	peach cobbler	https://www.allrecipes.com/thmb/_g_SFdKUwSniBWbzaQWEiGQw6SY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/51535-fresh-southern-peach-cobbler-ddmfs-0652-3x4-cb8d3d5a1e8548728fa1fc3d21fec1f0.jpg	10.00	34.00	oz	desserts	Made With Succulent Peaches That You Can Enjoy All Year Round	10
09ecc45e-0424-4531-bdf1-be0eb3e00d3c	08b42780-59a2-11ee-8c99-0242ac120002	cheesecake	https://bromabakery.com/wp-content/uploads/2021/05/How-to-Make-The-Perfect-Cheesecake-14-1067x1600.webp	13.00	2.50	lb	desserts	Homemade Cheesecake	10
22a03262-5cac-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	mackerel	https://harborfish.com/wp-content/uploads/2021/07/Mackerel2-scaled.jpeg	4.99	1.00	lb	seafood	Fresh Whole Mackerel	20
a0e56984-5cad-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	porgies	https://www.citarella.com/media/catalog/product/cache/6bd6bc90948058f1c179c773d53c57be/image/1134f13/porgies-whole.jpg	4.99	1.00	lb	seafood	Fresh Whole Porgy	10
eb003c76-5cb5-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	tuna	https://5.imimg.com/data5/SELLER/Default/2023/5/307448579/LP/LE/RU/189552148/new-product-250x250.jpeg	20.00	1.00	lb	seafood	Fresh Whole Tuna	10
6132b5e8-5cb8-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	lobster	https://s7d5.scene7.com/is/image/CentralMarket/001489520-1?hei=233&wid=233&$large$	7.99	1.25	lb	seafood	Fresh Live Lobster	25
7c205202-5cb8-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	littleneck clam	https://images.albertsons-media.com/is/image/ABS/960444280?$ng-ecom-pdp-desktop$&defaultImage=Not_Available	13.99	1.75	lb	seafood	Fresh Dozen Little Neck Clams	24
4aee0c4a-5cba-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	blackfish	https://www.citarella.com/media/catalog/product/cache/6bd6bc90948058f1c179c773d53c57be/image/467cd/blackfish-whole.jpg	5.00	1.00	lb	seafood	Freshly Caught BlackFish	20
9ceca7f8-5cbb-11ee-8c99-0242ac120002	08b42780-59a2-11ee-8c99-0242ac120002	roses	https://cdn.financebuzz.com/images/2023/01/20/roses.jpg	10.00	1.00	lb	flowers	A Dozen Of Beautiful Red Roses	12
6d839702-887d-4c45-ae7f-b01c1636044c	08b42780-59a2-11ee-8c99-0242ac120002	sunflower	https://www.instacart.com/image-server/932x932/filters:fill(FFF,true):format(webp)/www.instacart.com/assets/domains/product-image/file/large_34eeffdd-8eda-4f72-921e-3ced9e6eb30c.jpg	9.89	1.00	lb	flowers	Lovely bright yellow Sunflowers	100
1f28933b-af8f-4fd7-8c96-a54ab89dc6c2	08b42780-59a2-11ee-8c99-0242ac120002	bouquet	https://fyf.tac-cdn.net/images/products/large/FYF-893.jpg?auto=webp&quality=80&width=690	20.00	1.00	lb	flowers	Assorted Flowers That Make Up a Bouquet	20
8e51d654-bfd6-423f-ae56-aaa09bccad55	08b42780-59a2-11ee-8c99-0242ac120002	pink roses	https://www.flowerchimp.com.ph/cdn/shop/products/PH_001_600x.jpg?v=1635836591	12.99	1.00	lb	flowers	A Dozen Pretty Pink Roses	20
69d85b56-5cbf-11ee-8c99-0242ac120002	9e6ef4fb-5574-4968-912a-ea28257d708e	biscuit	https://www.seriouseats.com/thmb/irRrCdS7c5Fehzr9oCD5nTs84Dc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20210510-The-Food-Labs-Buttermilk-Biscuits-liz-voltz-seriouseats-16-8a0c924e4c9440088e073c67ed77d3c1.jpg	1.99	9.20	oz	bakery	4 Counts of Freshly Homemade Buttermilk Biscuits	40
c6b445b5-dd04-436e-a8bf-fb93de87e80e	08b42780-59a2-11ee-8c99-0242ac120002	peanutbutter cookie	https://i.etsystatic.com/15925842/r/il/b25112/4107010459/il_1588xN.4107010459_3uaa.jpg	3.00	16.00	g	bakery	Fresh Peanut Butter Cookies	50
60f22ffc-5cc0-11ee-8c99-0242ac120002	08b42780-59a2-11ee-8c99-0242ac120002	loaf of bread	https://www.theflavorbender.com/wp-content/uploads/2019/02/Homemade-Bread-7873-700x1049.jpg	1.47	14.00	oz	bakery	Freshly Made Loaf Of Bread	15
f5a5bc8a-1135-4873-95c4-a48108b8f961	535c2d7e-c78b-47f3-b2c3-ab109f908dc5	chocolate cookies	https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg	2.00	16.00	g	bakery	Freshly Baked Chocolate Chip Cookies	50
d10011c4-5cc5-11ee-8c99-0242ac120002	055038a8-59a3-11ee-8c99-0242ac120002	almond	https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcTVxbGqYv3Qgdgil-AMPRapbu1Hakls7i4PlJyHa90X-DwXZGkCKP8fAqrYyAjiyjc84qhTPFyYNG1AQ90	4.99	16.00	oz	vegan	Pouch Of Almonds	50
b0bb6139-5663-48fb-8dc6-821eb11b603c	055038a8-59a3-11ee-8c99-0242ac120002	chickpea	https://wholefully.com/wp-content/uploads/2011/03/img_8150-720x540.jpg	1.38	1.00	lb	vegan	Dried Chickpeas	50
1874a008-e479-47a7-a57f-54e109a357ac	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	tofu	https://sarahsvegankitchen.b-cdn.net/wp-content/uploads/2022/12/homemade-tofu-2-scaled.jpg	2.00	14.00	oz	vegan	Fresh Tofu	20
0fa1fb8a-842c-4156-866d-01b4428f778f	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	vegan potato chips	https://simple-veganista.com/wp-content/uploads/2012/07/best-homemade-baked-potato-chip-recipe-1.jpg	2.99	500.00	g	vegan	Healthy Homemade Vegan Potato Chips	30
53a5a82a-950d-40df-b974-e60b8b20bc21	391adfb9-d5fa-4c4b-85ac-43b1a92d838b	tempeh	https://www.liveeatlearn.com/wp-content/uploads/2019/01/tempeh-photo-vert.jpg	4.94	6.00	oz	vegan	Fresh Homemade Tempeh	30
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, user_id, product_id, rating) FROM stdin;
b81f55ae-b570-4f02-8e91-1726f94147b9	7d395d9c-76e1-4c5a-b7f5-0b708785836b	74bcb6f2-7f2b-4787-b6cc-cc0446e939d5	5
0c88d0a8-30b7-4eec-984d-d8d5adcff9be	7d395d9c-76e1-4c5a-b7f5-0b708785836b	50b9f14e-1baa-43f2-9e85-b336ea03a6fe	5
\.


--
-- Data for Name: shopping_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_session (id, user_id, total, created_at) FROM stdin;
1	9e6ef4fb-5574-4968-912a-ea28257d708e	0.00	today
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, phone, address_1, address_2, city, zipcode, image, type) FROM stdin;
7d395d9c-76e1-4c5a-b7f5-0b708785836b	Emily	Jones	ejones787@email.com	9145567776	602 14th street		New York	10206		buyer
9e6ef4fb-5574-4968-912a-ea28257d708e	Robert	Canned	robcan@email.com	1438536754	11 St Corner	apt 5b	Turkey	90909	https://cdn.create.vista.com/api/media/small/427413244/stock-photo-harvesting-curly-cabbage-in-green-field	seller
7710079e-a564-44f2-b6b6-1b2b3882a6ef	Billy	Andrews	billydrews@hotmail.com	8759037238	5 Country Place		Kansas City	64121		buyer
535c2d7e-c78b-47f3-b2c3-ab109f908dc5	Morgan	Stanley	morganstanman@gmail.com	9174561234	434 Houston St		New York	10002	https://media.istockphoto.com/id/934919462/photo/proud-african-american-gardener-posing-for-portrait.webp?b=1&s=170667a&w=0&k=20&c=DfZSI9hUgPH9tok7112p8HaWBKIYhKA0-8tj7WUrIB0=	seller
391adfb9-d5fa-4c4b-85ac-43b1a92d838b	Ricardo	Jimenez	rickyjim@gmail.com	6468784245	312 168th Street		New York	10032	https://media.istockphoto.com/id/1294834650/photo/portrait-of-senior-farm-worker.jpg?s=612x612&w=0&k=20&c=zDXkcEeWq_CWzG9yEIIEBSP1hm1VGYdIdJZDeKi2vWg=	seller
022378ae-b1c0-4750-9320-29ed9c653a4d	Christopher	Smith	chrissmith447@gmail.com	9176543444	610 139th Street		New York	10032		buyer
bf83f4e0-530d-11ee-be56-0242ac120002	Ronnie	Fields	ronfields@gmail.com	4964868944	417 Greene St		New York	11216	https://st4.depositphotos.com/1170412/20659/i/450/depositphotos_206599026-stock-photo-beatiful-asian-woman-smile-rubber.jpg	seller
7142ef7c-5310-11ee-be56-0242ac120002	Crystal	Hayden	crystalHayden@hotmail.com	5098486372	82 Mechanic Ave		New York	14580		buyer
08b42780-59a2-11ee-8c99-0242ac120002	Mya	Eckert	myeker@gmail.com	3488871231	775 N. Amerige Street		New York	14127	https://www.cam.ac.uk/sites/www.cam.ac.uk/files/styles/content-885x432/public/news/research/features/251017indian-farmer-in-biharm.defreesecimmyt.jpg?itok=l61sULc4	seller
055038a8-59a3-11ee-8c99-0242ac120002	Bob	Da Builder	bobdabuil@aol.com	4247973491	8924 La Sierra Rd		New York	22601	https://burmancoffee.com/wp-content/uploads/2018/01/cafe-kreyol-organic-coffee-farmers-Dominican-Republic-Ramirez-Estate-01.jpg	seller
\.


--
-- Name: cart_products_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_products_cart_id_seq', 1, true);


--
-- Name: shopping_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_session_id_seq', 1, false);


--
-- Name: cart_products cart_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_pkey PRIMARY KEY (cart_id);


--
-- Name: cart_products cart_products_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_product_id_key UNIQUE (product_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_products orders_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: shopping_session shopping_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_session
    ADD CONSTRAINT shopping_session_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cart_products cart_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: cart_products cart_products_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.shopping_session(id);


--
-- Name: comments comments_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders_products orders_products_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders_products orders_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products products_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.users(id);


--
-- Name: ratings ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: shopping_session shopping_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_session
    ADD CONSTRAINT shopping_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

