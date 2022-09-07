BEGIN;


CREATE TABLE IF NOT EXISTS public.beers
(
    beer_id integer NOT NULL,
    beer_name character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_name bit varying NOT NULL,
    style bit varying NOT NULL,
    description bit varying NOT NULL,
    abv real NOT NULL,
    brewery_id integer NOT NULL,
    CONSTRAINT beers_pkey PRIMARY KEY (beer_id),
    CONSTRAINT brewery_id FOREIGN KEY (brewery_id)
        REFERENCES public.breweries (brewery_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.breweries
(
    brewery_id integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    website character varying COLLATE pg_catalog."default" NOT NULL,
    state character varying COLLATE pg_catalog."default" NOT NULL,
    city character varying COLLATE pg_catalog."default" NOT NULL,
    owner_id integer NOT NULL,
    CONSTRAINT breweries_pkey PRIMARY KEY (brewery_id),
    CONSTRAINT owner_id FOREIGN KEY (owner_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.favorites
(
    user_id integer NOT NULL,
    beer_name character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_name character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_id integer NOT NULL,
    beer_id integer NOT NULL,
    CONSTRAINT beer_id FOREIGN KEY (beer_id)
        REFERENCES public.beers (beer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT brewery_id FOREIGN KEY (brewery_id)
        REFERENCES public.breweries (brewery_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID

CREATE TABLE IF NOT EXISTS public.news_and_events
(
    new_id integer NOT NULL,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_name character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    date timestamp with time zone NOT NULL,
    brewery_id integer NOT NULL,
    CONSTRAINT news_and_events_pkey PRIMARY KEY (new_id),
    CONSTRAINT brewery_id FOREIGN KEY (brewery_id)
        REFERENCES public.breweries (brewery_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.reviews
(
    review_id integer NOT NULL,
    brewery_name character varying COLLATE pg_catalog."default" NOT NULL,
    beer_name character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    rating integer NOT NULL,
    user_id integer NOT NULL,
    brewery_id integer NOT NULL,
    beer_id integer NOT NULL,
    CONSTRAINT reviews_pkey PRIMARY KEY (review_id),
    CONSTRAINT beer_id FOREIGN KEY (beer_id)
        REFERENCES public.beers (beer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT brewery_id FOREIGN KEY (brewery_id)
        REFERENCES public.breweries (brewery_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS public.users
(
    user_id integer NOT NULL DEFAULT nextval('seq_user_id'::regclass),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password_hash character varying(200) COLLATE pg_catalog."default" NOT NULL,
    role character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (user_id)
);

INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES (01, )
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES
INSERT INTO breweries (brewery_id, brewery_name, website, state, city) VALUES

INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES
INSERT INTO beers (beer_id, beer_name, brewery_name, description, abv, type) VALUES


INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES
INSERT INTO news_and_events (new_id, title, brewery_name, description, date) VALUES

INSERT INTO favorites (user_id, beer_name, brewery_name) VALUES

INSERT INTO reviews (review_id, brewery_name, beer_name, description, rating, user_id) VALUES

INSERT INTO users (user_id, username, password_has, role) VALUES




-- ALTER TABLE IF EXISTS public.beers
--     ADD FOREIGN KEY (beer_name)
--     REFERENCES public.favorites (beer_name) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.beers
--     ADD FOREIGN KEY (beer_name)
--     REFERENCES public.reviews (beer_name) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.breweries
--     ADD FOREIGN KEY (brewery_name)
--     REFERENCES public.beers (beer_name) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.breweries
--     ADD FOREIGN KEY (brewery_name)
--     REFERENCES public.favorites (brewery_name) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.breweries
--     ADD FOREIGN KEY (brewery_name)
--     REFERENCES public.news_and_events (brewery_name) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.breweries
--     ADD FOREIGN KEY (brewery_name)
--     REFERENCES public.reviews (brewery_name) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.users
--     ADD FOREIGN KEY (user_id)
--     REFERENCES public.breweries (owner_id) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.users
--     ADD FOREIGN KEY (user_id)
--     REFERENCES public.favorites (user_id) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;


-- ALTER TABLE IF EXISTS public.users
--     ADD FOREIGN KEY (user_id)
--     REFERENCES public.reviews (user_id) MATCH SIMPLE
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

END;