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
    img_url character varying COLLATE pg_catalog."default" NOT NULL,
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
    address character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT breweries_pkey PRIMARY KEY (brewery_id),
    CONSTRAINT user_id FOREIGN KEY (owner_id)
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


INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (01, 'New Belgium Brewing Company', 'https://www.newbelgium.com/', 'Colorado', 'Fort Collins', '500 Linden St, Fort Collins, CO 80524')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (02, 'Founders Brewing Co.', 'https://foundersbrewing.com/', 'Michigan', 'Grand Rapids', '235 Cesar E. Chavez Ave SW, Grand Rapids, MI 49503')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (03, 'Odell Brewing Company', 'https://www.odellbrewing.com/', 'Colorado', 'Fort Collins', '800 E Lincoln Ave, Fort Collins, CO 80524')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (04, 'Bell''s Brewery', 'https://bellsbeer.com/', 'Michigan', 'Kalamazoo', '355 E Kalamazoo Ave, Kalamazoo, MI 49007')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (05, 'New Holland Brewing Company', 'https://www.newhollandbrew.com/', 'Michigan', 'Holland', '66 E 8th St, Holland, MI 49423')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (06, 'Wolf''s Ridge Brewing', 'https://www.wolfsridgebrewing.com/', 'Ohio', 'Columbus', '215 N 4th St, Columbus, OH 43215')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (07, 'Saugatuck Brewing Company', 'https://www.saugatuckbrewing.com/', 'Michigan', 'Saugatuck', '2948 Blue Star Hwy, Douglas, MI 49406')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (08, 'Hoof Hearted', 'https://www.hoofheartedkitchen.com/', 'Ohio', 'Columbus', '850 N 4th St, Columbus, OH 43215')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (09, 'Rhinegeist Brewery', 'https://rhinegeist.com/', 'Ohio', 'Cincinnati', '1910 Elm St, Cincinnati, OH 45202')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (10, 'Urban Artifact', 'https://artifactbeer.com/', 'Ohio', 'Cincinnati', '1660 Blue Rock St, Cincinnati, OH 45223')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (11, 'Land-Grant Brewing Company', 'https://landgrantbrewing.com/', 'Ohio', 'Columbus', '424 W Town St, Columbus, OH 43215')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (12, 'Jackie O''s', 'https://jackieos.com/', 'Ohio', 'Athens', '25 Campbell St, Athens, OH 45701')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (13, 'The Brew Kettle', 'https://thebrewkettle.com/', 'Ohio', 'Strongsville', '8377 Pearl Rd, Strongsville, OH 44136')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (14, 'Great Lakes Brewing Company', 'https://www.greatlakesbrewing.com/', 'Ohio', 'Cleveland', '2516 Market Ave, Cleveland, OH 44113')
INSERT INTO breweries (brewery_id, brewery_name, website, state, city, address) VALUES (15, 'Platform Beer Co.', 'http://platformbeer.co/', 'Ohio', 'Cleveland', '408 N 6th St, Columbus, OH 43215')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (01, 'Voodoo Ranger Atomic Pumpkin', 'New Belgium Brewing Company', 'Pumpkin Ale', 'Ale brewed with pumpkin juice, Saigon cinnamon, habanero, aji and del arbol peppers', '6.4', 01, 'https://www.newbelgium.com/siteassets/beer/voodoo-ranger-atomic-pumpkin/vrap_2021_webbeer--glass-digital-render_1440w-height-is-variable.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (02, 'La Folie', 'New Belgium Brewing Company', 'Sour Ale', 'Flemish Sour Brown Ale fermented in stainless then transferred to barrels for 1-4 years of aging then blended to taste.', '7', 01, 'https://www.newbelgium.com/siteassets/beer/la-folie/cellar-lafolie-2022_1440w.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (03, 'Fat Tire', 'New Belgium Brewing Company', 'Amber Ale', 'Fat Tire Amber is the easy-drinking Amber Ale born in Colorado from New Belgium Brewing Company, a certified B-Corp. ', '5.2', 01, 'https://www.newbelgium.com/siteassets/beer/fat-tire/beer-fat-tire-amber-ale-desktop.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (04, 'Voodoo Ranger IPA', 'New Belgium Brewing Company', 'IPA', 'Bursting with tropical aromas and juicy fruit flavors from Mosaic and Amarillo hops, this golden IPA is perfectly bitter with a refreshing, sublime finish.', '7', 01, 'https://www.newbelgium.com/siteassets/beer/voodoo-ranger-ipa/vripa_2021_globe_can_1080-right.png')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (05, 'Breakfast Stout', 'Founders Brewing Co.', 'Oatmeal Stout', 'The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and Sumatra and Kona coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.', '8.3', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2018_BreakfastStout_Featured.jpg')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (06, 'KBS', 'Founders Brewing Co.', 'Imperial Stout', '12', 'What we’ve got here is an imperial stout brewed with a massive amount of coffee and chocolates, then cave-aged in oak bourbon barrels for an entire year to make sure wonderful bourbon undertones come through in the finish. Makes your taste buds squeal with delight.  KBS stands for "Kentucky Breakfast Stout" ABV varies by batch.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2022_KBS_Featured.jpg')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (07, 'Rübæus', 'Founders Brewing Co.', 'Fruit Beer', '5.7', 'This brew achieves its unique raspberry taste by the addition of only fresh raspberries at five seperate stages in the brewing process.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2021_rubaeus_featured.jpg')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (08, 'All Day IPA', 'Founders Brewing Co.', 'IPA', '4.7', 'The beer you’ve been waiting for. Keeps your taste satisfied while keeping your senses sharp. An all-day IPA naturally brewed with a complex array of malts, grains and hops. Balanced for optimal aromatics and a clean finish. The perfect reward for an honest day’s work and the ultimate companion to celebrate life’s simple pleasures.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2020_all_day_ipa_featured.jpg')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (09, 'Isolation Ale', 'Odell Brewing Company', 'Winter Warmer', '6', 'A funny thing happens here around summer’s end—our eyes start searching the skies for those first fall flakes. As we welcome autumn’s first snow, we celebrate the return of Isolation Ale—a sweet-caramel malty ale balanced by a subtle crisp hop finish. Whether you ski, shred, or shoe, it’ll inspire you to make first tracks.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/05/Isolation-Hero.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (10, '90 Shilling Ale', 'Odell Brewing Company', 'Scotch Ale', '5.3', 'We introduced 90 Shilling, our flagship beer, at our opening party in 1989. For a while, we''d been wondering what would happen if we lightened up the traditional Scottish ale? The result is an irresistibly smooth and delicious medium-bodied amber ale.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/04/90-Shilling-ProductCrops-e1588041326994.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (11, 'Myrcenary Double IPA', 'Odell Brewing Company', 'Imperial IPA', '9.3', 'Named for Myrcene, a component of essential oils in the hop flower, Myrcenary Double IPA is our tribute to those who revere the illustrious hop, and their unyielding exploit to craft hop forward beers. Brewed with a blend of hops containing the highest levels of Myrcene, this double IPA prevails with a tropical fruit-like flavor, a pungent floral aroma, and a clean getaway.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/09/NEW-Myrcenary-Hero.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (12, 'Lugene Chocolate Milk Stout', 'Odell Brewing Company', 'Milk Stout', '8.5', 'If you’ve ever been to our brewery, you’ve likely seen the old, beat-up truck that hauls away our spent grain. That truck belongs to Lugene, who’s been feeding his dairy cows the hearty malt for over a decade. Named in his honor, Lugene Chocolate Milk Stout is brewed with milk sugar and milk chocolate. The rich and creamy brew reminds us of a cold glass of chocolate milk and our hometown “Aggie” roots.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/10/Lugene-Hero.png')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (13, 'Special Double Cream Stout', 'Bell''s Brewery', 'Milk Sout', '6.1', ' Named for its velvety smooth, creamy texture, this incredibly rich stout is brewed with 10 different specialty roasted malts chosen that impart notes of rich mocha and espresso. Dark and sweet tones intermingle with a soft, roasty finish.', 04, 'https://bellsbeer.com/wp-content/uploads/2022/02/DCS-Render.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (14, 'Two Hearted Ale', 'Bell''s Brewery', 'IPA', '7', 'Perfectly balanced with a malt backbone and combined with the signature fruity aromas of Bell''s house yeast, this beer is remarkably drinkable and well suited for adventures everywhere.', 04, 'https://bellsbeer.com/wp-content/uploads/2021/12/TwoHearted_736px-2.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (15, 'Hopslam Ale', 'Bell''s Brewery', 'Imperial IPA', '10', 'Starting with six different hop varietals added to the brew kettle & culminating with a massive dry-hop addition of Simcoe hops, Bell''s Hopslam Ale possesses the most complex hopping schedule in the Bell''s repertoire.', 04, 'https://bellsbeer.com/wp-content/uploads/2022/02/Hopslam-Render.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (16, 'Oberon', 'Bell''s Brewery', 'Wheat Beer', '5.8', 'Citrusy, easy drinking and refreshing, Oberon Ale is sunshine in a glass. Get into a summer state of mind and #ReachForTheSun.', 04, 'https://bellsbeer.com/wp-content/uploads/2022/02/MicrosoftTeams-image-102.png')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (17, 'Dragon''s Milk', 'New Holland Brewing Company', 'Imperial Stout', '11', 'A barrel aged Imperial Stout with roasty malt character intermingled with deep vanilla tones, all dancing in an oak bath.', 05, 'https://wp.dragonsmilk.com/wp-content/uploads/2021/12/DM-New-Web.png')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (18, 'Hazy River', 'New Holland Brewing Company', 'IPA', '5.9', 'A true testament to our brewers’ expertise and their passion for innovation, Hazy River is smooth and juicy with a beautiful hazy-golden appearance.', 05, 'https://images.getbento.com/accounts/bbddcd7e12722442009c524ed3c016b9/media/images/48183beer-hazyriver-can-2020.png?w=1000&fit=max&auto=compress,format&h=1000')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (19, 'The Poet', 'New Holland Brewing Company', 'Oatmeal Stout', '5.8', 'Oats bring a creaminess and soft mouth-feel to the roast malt character in our classic oatmeal stout. The Poet is a perfect representation of balance and one of America’s leading oatmeal stouts.', 05, 'https://images.getbento.com/accounts/bbddcd7e12722442009c524ed3c016b9/media/images/88332beer-thepoet-12oz-can-2020.png?w=1000&fit=max&auto=compress,format&h=1000')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (20, 'Ichabod', 'New Holland Brewing Company', 'Pumpkin Ale', '4.5', 'The legend of sleepy hollow lives on with Ichabod pumpkin ale. This flagship seasonal combines malted barley and real pumpkin with cinnamon and nutmeg in a delicious and inviting brew, perfectly paired with all things autumn.', 05, 'https://images.getbento.com/accounts/bbddcd7e12722442009c524ed3c016b9/media/images/87824beer-ichabod-can-2020.png?w=1000&fit=max&auto=compress,format&h=1000')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (21, 'Pack IPA', 'Wolf''s Ridge Brewing', 'IPA', '6.8', 'From our pack to yours - we invite you to share and enjoy this IPA wherever your path leads you. Brimming with Citra, Mosaic and Amarillo hoppy goodness, Pack is the perfect companion for any and all awaiting adventures.', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/12oz__Pack_IPA_01_1024x1024@2x.png?v=1589044310')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (22, 'Oktoberfest', 'Wolf''s Ridge Brewing', 'Marzen', '5.4', 'Steeped in tradition and consumed in celebration, Oktoberfest is the perfect lager to herald the onset of autumn. Toasted bread on the nose leads to a slightly sweet, malty flavor with just a hint of noble hops. Crisp and highly quaffable. Brewed to be drunk by the stein; enjoy this brewer’s favorite seasonal beer!', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/WRB_12oz_Oktoberfest_1024x1024@2x.png?v=1659024205')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (23, 'Daybreak', 'Wolf''s Ridge Brewing', 'Cream Ale', '5', 'Confusing to the senses in the best way possible. Daybreak''s clarity and golden color belie the smooth coffee presence inside. Brewed with local One Line Coffee''s rotating house roast and the finest vanilla beans.', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/12oz_Daybreak_Awards_1024x1024@2x.jpg?v=1637597192')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (24, 'Dire Wolf', 'Wolf''s Ridge Brewing', 'Imperial Stout', '10.8', 'Dire Wolf is fiercely bold, dark, and unrelenting. In bringing together exceptional malts from diverse corners of the world, Dire Wolf impresses the palate with a sophisticated blend of dark chocolates, espresso, caramel, bread, and oats. We offer this beer as a toast to Ohio brewmasters, both past and present, whose unique cultural traditions helped craft a brewing community as substantial as the Dire Wolf herself.', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/WRB_12oz_Direwolf_background_1024x1024@2x.png?v=1648054069')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (25, '', 'Saugatuck Brewing Company', '', '', '', 07, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (26, '', 'Saugatuck Brewing Company', '', '', '', 07, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (27, '', 'Saugatuck Brewing Company', '', '', '', 07, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (28, '', 'Saugatuck Brewing Company', '', '', '', 07, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (29, '', 'Hoof Hearted', '', '', '', 08, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (30, '', 'Hoof Hearted', '', '', '', 08, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (31, '', 'Hoof Hearted', '', '', '', 08, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (32, '', 'Hoof Hearted', '', '', '', 08, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (33, '', 'Rhinegeist Brewery', '', '', '', 09, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (34, '', 'Rhinegeist Brewery', '', '', '', 09, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (35, '', 'Rhinegeist Brewery', '', '', '', 09, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (36, '', 'Rhinegeist Brewery', '', '', '', 09, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (37, '', 'Urban Artifact', '', '', '', 10, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (38, '', 'Urban Artifact', '', '', '', 10, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (39, '', 'Urban Artifact', '', '', '', 10, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (40, '', 'Urban Artifact', '', '', '', 10, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (41, '', 'Land-Grant Brewing Company', '', '', '', 11, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (42, '', 'Land-Grant Brewing Company', '', '', '', 11, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (43, '', 'Land-Grant Brewing Company', '', '', '', 11, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (44, '', 'Land-Grant Brewing Company', '', '', '', 11, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (45, '', 'Jackie O''s', '', '', '', 12, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (46, '', 'Jackie O''s', '', '', '', 12, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (47, '', 'Jackie O''s', '', '', '', 12, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (48, '', 'Jackie O''s', '', '', '', 12, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (49, '', 'The Brew Kettle', '', '', '', 13, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (50, '', 'The Brew Kettle', '', '', '', 13, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (51, '', 'The Brew Kettle', '', '', '', 13, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (52, '', 'The Brew Kettle', '', '', '', 13, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (53, '', 'Great Lakes Brewing Company', '', '', '', 14, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (54, '', 'Great Lakes Brewing Company', '', '', '', 14, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (55, '', 'Great Lakes Brewing Company', '', '', '', 14, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (56, '', 'Great Lakes Brewing Company', '', '', '', 14, '')

INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (57, '', 'Platform Beer Co.', '', '', '', 15, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (58, '', 'Platform Beer Co.', '', '', '', 15, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (59, '', 'Platform Beer Co.', '', '', '', 15, '')
INSERT INTO beers (beer_id, beer_name, brewery_name, style, description, abv, brewery_id, img_url) VALUES (60, '', 'Platform Beer Co.', '', '', '', 15, '')

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