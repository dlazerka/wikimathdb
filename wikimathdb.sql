--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: arg; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE arg (
    node_id bigint NOT NULL,
    arg_num smallint NOT NULL,
    arg_node_id bigint NOT NULL,
    CONSTRAINT arg_check CHECK ((node_id > arg_node_id))
);


--
-- Name: node; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE node (
    id bigint NOT NULL,
    consistent boolean
);


--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE node_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE node_id_seq OWNED BY node.id;


--
-- Name: node_name; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE node_name (
    node_id bigint NOT NULL,
    name character varying(40) NOT NULL,
    view_mode smallint DEFAULT 1 NOT NULL
);


--
-- Name: TABLE node_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE node_name IS 'Intermediate, just for example, will be replaced.';


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE node ALTER COLUMN id SET DEFAULT nextval('node_id_seq'::regclass);


--
-- Name: node_arg_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY arg
    ADD CONSTRAINT node_arg_pkey PRIMARY KEY (node_id, arg_num);


--
-- Name: node_name_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY node_name
    ADD CONSTRAINT node_name_pkey PRIMARY KEY (node_id, view_mode);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: node_arg_arg_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arg
    ADD CONSTRAINT node_arg_arg_node_id_fkey FOREIGN KEY (arg_node_id) REFERENCES node(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: node_arg_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arg
    ADD CONSTRAINT node_arg_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: node_name_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY node_name
    ADD CONSTRAINT node_name_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

