--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: validator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.validator (
    id integer NOT NULL,
    data jsonb
);


ALTER TABLE public.validator OWNER TO postgres;

--
-- Name: validator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.validator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validator_id_seq OWNER TO postgres;

--
-- Name: validator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.validator_id_seq OWNED BY public.validator.id;


--
-- Name: validator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validator ALTER COLUMN id SET DEFAULT nextval('public.validator_id_seq'::regclass);


--
-- Data for Name: validator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.validator (id, data) FROM stdin;
1	{"address": "00B587BAA478C3FCD0A1AE34658764BCE01A2A41", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "H/T2zkDfFx7ZKgDCXP+WvxscARiptSNEBxPQkXRXIIM="}, "voting_power": "4180308150000000", "proposer_priority": "41378266209084499"}
2	{"address": "0DAB679E5C4DB1F407F3B79FDBD1D5DE4AD054D9", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "OtQ6fErTMHtOZA40G2jMa8mTQmwmOrV0J5IR7CoUKiw="}, "voting_power": "1815430500000000", "proposer_priority": "-28471297322249822"}
3	{"address": "105851A834330118A7EAF1E778DDFDFDB3BB800C", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "+D4SzWqrgBE0WdRqTFfwjNg0v7mypHMqllCV/zgjRdA="}, "voting_power": "11223090262000000", "proposer_priority": "58568320637726881"}
4	{"address": "150F80F0FECADF51D2E918F9B1F25310FCD88964", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "Hk+IriGyfwKvbU/aQE+yMYkPikrj9J3DJ3610ZEV/Pg="}, "voting_power": "10107693124000000", "proposer_priority": "-115711759959673620"}
5	{"address": "1927E984661B0A2CD7CC28CD417EA61EAFC6CAC8", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "242mfOi6DvLa9VezpedySG7lOCA6he2CzNukCbM9NVo="}, "voting_power": "68181613016010000", "proposer_priority": "-81774956142428975"}
6	{"address": "532A54C7DDA38C9165F7C409F591AB45F241BEDA", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "RBQJsaRi+a405tSgTeNCg4UG428BfOHSWMJCY1JIo7w="}, "voting_power": "8377748510000000", "proposer_priority": "37886382944009244"}
7	{"address": "56869316D6DFD8550BE373B3B052CCD434F368D3", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "cmOQUErn9JWnL1PS7NHbPvQOoxBOhQE44NzNKu2ZqQ8="}, "voting_power": "13663927310000000", "proposer_priority": "-38020945746724716"}
8	{"address": "89372244633C983CAE0013F08564BCC035414438", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "0SiG28GKnzTH4B/gQMpSVr/r7BfobB+sKzmP+X50g0o="}, "voting_power": "10049919062000408", "proposer_priority": "-115833103087435028"}
9	{"address": "C17518D0C299DCDFE966196B17E171237809FDB0", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "HnV3NSK2+ywytglQLhso8VdBCkGdFdhVqJ8ggT9VF8k="}, "voting_power": "20200528220000000", "proposer_priority": "33210839920604972"}
10	{"address": "C4BB2DA41B404044099DFBCD1F2537925D069EDC", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "fSUZhwy4iYKi4MTnlqIvqRcjiYI+sQrbTcVnUMSnM9E="}, "voting_power": "20130005100000000", "proposer_priority": "25940439839448884"}
11	{"address": "C74E5470D137C4152B48521472955127DEB0E414", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "7e9iIJRppRs2u9RWZchLFbVvh/UXSus8sez1923gdyU="}, "voting_power": "20055063000030000", "proposer_priority": "-15532702588224257"}
12	{"address": "CFB2CC97E7F61C229C68588177E079F8A7331F23", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "bw8QhR6UXDfdAftgk9s6CjHWcukaCaOkYbNCl2/lGVA="}, "voting_power": "9220765453000000", "proposer_priority": "7392596187993652"}
13	{"address": "F0074F79974E42CCA0679B469E41629352A14BA5", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "O06jAgqNmFmM8iSy0oBmo2HBEigv9jRjVgMnBbGykPQ="}, "voting_power": "7228069140000000", "proposer_priority": "51082374536555732"}
14	{"address": "F825EEB10F9CF76012FB155751B3A0437FC31442", "pub_key": {"type": "tendermint/PubKeyEd25519", "value": "tjiLc0c2cbcDFjz/aW1j+r39sNsDwMLP1aO6UQhXvuk="}, "voting_power": "20093353140000000", "proposer_priority": "-84641969415727852"}
\.


--
-- Name: validator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.validator_id_seq', 14, true);


--
-- Name: validator validator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.validator
    ADD CONSTRAINT validator_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

