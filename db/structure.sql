--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: base_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE base_attributes (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rule_set_id integer
);


--
-- Name: base_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE base_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE base_attributes_id_seq OWNED BY base_attributes.id;


--
-- Name: character_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE character_attributes (
    id integer NOT NULL,
    ability_score integer,
    ability_modifier integer,
    character_id integer,
    base_attribute_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: character_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE character_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: character_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE character_attributes_id_seq OWNED BY character_attributes.id;


--
-- Name: characters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE characters (
    id integer NOT NULL,
    name text,
    bio text,
    level integer,
    hit_points integer,
    game_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE characters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE characters_id_seq OWNED BY characters.id;


--
-- Name: encounters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE encounters (
    id integer NOT NULL,
    name text NOT NULL,
    experience_points integer,
    description text,
    game_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: encounters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE encounters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: encounters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE encounters_id_seq OWNED BY encounters.id;


--
-- Name: feats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE feats (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    rule_set_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: feats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE feats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE feats_id_seq OWNED BY feats.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE games (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rule_set_id integer
);


--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE games_id_seq OWNED BY games.id;


--
-- Name: identities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE identities (
    id integer NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    password_digest text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_constraint_email CHECK ((length(email) <= 256)),
    CONSTRAINT check_constraint_name CHECK ((length(name) <= 64)),
    CONSTRAINT check_constraint_password_digest CHECK ((length(password_digest) <= 128))
);


--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE identities_id_seq OWNED BY identities.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE items (
    id integer NOT NULL,
    name text NOT NULL,
    price integer,
    description text,
    rule_set_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: rule_sets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rule_sets (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


--
-- Name: rule_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rule_sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rule_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rule_sets_id_seq OWNED BY rule_sets.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: spells; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE spells (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    rule_set_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: spells_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE spells_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: spells_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE spells_id_seq OWNED BY spells.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    provider text NOT NULL,
    uid text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT check_constraint_name CHECK ((length(name) <= 64)),
    CONSTRAINT check_constraint_provider CHECK ((length(provider) <= 64)),
    CONSTRAINT check_constraint_uid CHECK ((length(uid) <= 512))
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: base_attributes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY base_attributes ALTER COLUMN id SET DEFAULT nextval('base_attributes_id_seq'::regclass);


--
-- Name: character_attributes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY character_attributes ALTER COLUMN id SET DEFAULT nextval('character_attributes_id_seq'::regclass);


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY characters ALTER COLUMN id SET DEFAULT nextval('characters_id_seq'::regclass);


--
-- Name: encounters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY encounters ALTER COLUMN id SET DEFAULT nextval('encounters_id_seq'::regclass);


--
-- Name: feats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY feats ALTER COLUMN id SET DEFAULT nextval('feats_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY games ALTER COLUMN id SET DEFAULT nextval('games_id_seq'::regclass);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY identities ALTER COLUMN id SET DEFAULT nextval('identities_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: rule_sets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule_sets ALTER COLUMN id SET DEFAULT nextval('rule_sets_id_seq'::regclass);


--
-- Name: spells id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY spells ALTER COLUMN id SET DEFAULT nextval('spells_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: base_attributes base_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY base_attributes
    ADD CONSTRAINT base_attributes_pkey PRIMARY KEY (id);


--
-- Name: character_attributes character_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY character_attributes
    ADD CONSTRAINT character_attributes_pkey PRIMARY KEY (id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: encounters encounters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY encounters
    ADD CONSTRAINT encounters_pkey PRIMARY KEY (id);


--
-- Name: feats feats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY feats
    ADD CONSTRAINT feats_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: rule_sets rule_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule_sets
    ADD CONSTRAINT rule_sets_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: spells spells_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY spells
    ADD CONSTRAINT spells_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_base_attributes_on_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_attributes_on_rule_set_id ON base_attributes USING btree (rule_set_id);


--
-- Name: index_character_attributes_on_base_attribute_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_character_attributes_on_base_attribute_id ON character_attributes USING btree (base_attribute_id);


--
-- Name: index_character_attributes_on_character_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_character_attributes_on_character_id ON character_attributes USING btree (character_id);


--
-- Name: index_characters_on_game_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_characters_on_game_id ON characters USING btree (game_id);


--
-- Name: index_encounters_on_game_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_encounters_on_game_id ON encounters USING btree (game_id);


--
-- Name: index_feats_on_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feats_on_rule_set_id ON feats USING btree (rule_set_id);


--
-- Name: index_games_on_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_games_on_rule_set_id ON games USING btree (rule_set_id);


--
-- Name: index_identities_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_identities_on_email ON identities USING btree (email);


--
-- Name: index_items_on_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_rule_set_id ON items USING btree (rule_set_id);


--
-- Name: index_rule_sets_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rule_sets_on_user_id ON rule_sets USING btree (user_id);


--
-- Name: index_spells_on_rule_set_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_spells_on_rule_set_id ON spells USING btree (rule_set_id);


--
-- Name: index_users_on_provider_and_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_provider_and_uid ON users USING btree (provider, uid);


--
-- Name: spells fk_rails_5104854a2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY spells
    ADD CONSTRAINT fk_rails_5104854a2b FOREIGN KEY (rule_set_id) REFERENCES rule_sets(id);


--
-- Name: base_attributes fk_rails_58efff06ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY base_attributes
    ADD CONSTRAINT fk_rails_58efff06ac FOREIGN KEY (rule_set_id) REFERENCES rule_sets(id);


--
-- Name: games fk_rails_5d893fac18; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY games
    ADD CONSTRAINT fk_rails_5d893fac18 FOREIGN KEY (rule_set_id) REFERENCES rule_sets(id);


--
-- Name: character_attributes fk_rails_753d0ec414; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY character_attributes
    ADD CONSTRAINT fk_rails_753d0ec414 FOREIGN KEY (base_attribute_id) REFERENCES base_attributes(id);


--
-- Name: encounters fk_rails_7ab1a49024; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY encounters
    ADD CONSTRAINT fk_rails_7ab1a49024 FOREIGN KEY (game_id) REFERENCES games(id);


--
-- Name: feats fk_rails_7c5784029b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY feats
    ADD CONSTRAINT fk_rails_7c5784029b FOREIGN KEY (rule_set_id) REFERENCES rule_sets(id);


--
-- Name: character_attributes fk_rails_8937f39d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY character_attributes
    ADD CONSTRAINT fk_rails_8937f39d59 FOREIGN KEY (character_id) REFERENCES characters(id);


--
-- Name: characters fk_rails_d6c1172f1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY characters
    ADD CONSTRAINT fk_rails_d6c1172f1f FOREIGN KEY (game_id) REFERENCES games(id);


--
-- Name: items fk_rails_f516303bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_f516303bc0 FOREIGN KEY (rule_set_id) REFERENCES rule_sets(id);


--
-- Name: rule_sets fk_rails_f9b148baa2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule_sets
    ADD CONSTRAINT fk_rails_f9b148baa2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170407174943'),
('20170414180451'),
('20170414180919'),
('20170414185559'),
('20170414204008'),
('20170416224609'),
('20170416232402'),
('20170417002052'),
('20170421083226'),
('20170421090009'),
('20170421114943'),
('20170424172055'),
('20170424172700'),
('20170424173548'),
('20170424175127'),
('20170430190147'),
('20170430190155'),
('20170430193934'),
('20170430235728'),
('20170430235923'),
('20170501003925'),
('20170501004014'),
('20170501013933'),
('20170501015054'),
('20170501022454'),
('20170501025015'),
('20170501030316'),
('20170501032454'),
('20170501034353'),
('20170501034906'),
('20170501040239'),
('20170501042105'),
('20170501193433'),
('20170501234558'),
('20170501234903');


