BEGIN;


CREATE TABLE IF NOT EXISTS public.beers
(
    beer_id integer NOT NULL,
    beer_name character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_name character varying NOT NULL,
    style character varying NOT NULL,
    description character varying NOT NULL,
    abv real NOT NULL,
    brewery_id integer NOT NULL,
    img_url character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT beers_pkey PRIMARY KEY (beer_id)
);

CREATE TABLE IF NOT EXISTS public.breweries
(
    brewery_id integer NOT NULL,
    brewery_name character varying COLLATE pg_catalog."default" NOT NULL,
    website character varying COLLATE pg_catalog."default" NOT NULL,
    state character varying COLLATE pg_catalog."default" NOT NULL,
    city character varying COLLATE pg_catalog."default" NOT NULL,
    owner_id integer NOT NULL,
    address character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT breweries_pkey PRIMARY KEY (brewery_id)
);

CREATE TABLE IF NOT EXISTS public.favorites
(
    user_id integer NOT NULL,
    beer_name character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_name character varying COLLATE pg_catalog."default" NOT NULL,
    brewery_id integer,
    beer_id integer 
);

CREATE TABLE IF NOT EXISTS public.reviews
(
    review_id integer NOT NULL,
    brewery_name character varying COLLATE pg_catalog."default" NOT NULL,
    beer_name character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    rating integer NOT NULL,
    user_id integer NOT NULL,
    brewery_id integer,
    beer_id integer,
    CONSTRAINT reviews_pkey PRIMARY KEY (review_id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    user_id integer NOT NULL DEFAULT nextval('seq_user_id'::regclass),
    username character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password_hash character varying(200) COLLATE pg_catalog."default" NOT NULL,
    role character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (user_id)
);

INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (01, 01, 'New Belgium Brewing Company', 'https://www.newbelgium.com/', 'Colorado', 'Fort Collins', '500 Linden St, Fort Collins, CO 80524');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (02, 01, 'Founders Brewing Co.', 'https://foundersbrewing.com/', 'Michigan', 'Grand Rapids', '235 Cesar E. Chavez Ave SW, Grand Rapids, MI 49503');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (03, 01, 'Odell Brewing Company', 'https://www.odellbrewing.com/', 'Colorado', 'Fort Collins', '800 E Lincoln Ave, Fort Collins, CO 80524');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (04, 01, 'Bell''s Brewery', 'https://bellsbeer.com/', 'Michigan', 'Kalamazoo', '355 E Kalamazoo Ave, Kalamazoo, MI 49007');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (05, 01, 'New Holland Brewing Company', 'https://www.newhollandbrew.com/', 'Michigan', 'Holland', '66 E 8th St, Holland, MI 49423');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (06, 01, 'Wolf''s Ridge Brewing', 'https://www.wolfsridgebrewing.com/', 'Ohio', 'Columbus', '215 N 4th St, Columbus, OH 43215');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (07, 01, 'Saugatuck Brewing Company', 'https://www.saugatuckbrewing.com/', 'Michigan', 'Saugatuck', '2948 Blue Star Hwy, Douglas, MI 49406');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (08, 01, 'Hoof Hearted', 'https://www.hoofheartedkitchen.com/', 'Ohio', 'Columbus', '850 N 4th St, Columbus, OH 43215');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (09, 01, 'Rhinegeist Brewery', 'https://rhinegeist.com/', 'Ohio', 'Cincinnati', '1910 Elm St, Cincinnati, OH 45202');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (10, 01, 'Land-Grant Brewing Company', 'https://landgrantbrewing.com/', 'Ohio', 'Columbus', '424 W Town St, Columbus, OH 43215');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (11, 01, 'Jackie O''s', 'https://jackieos.com/', 'Ohio', 'Athens', '25 Campbell St, Athens, OH 45701');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (12, 01, 'The Brew Kettle', 'https://thebrewkettle.com/', 'Ohio', 'Strongsville', '8377 Pearl Rd, Strongsville, OH 44136');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (13, 01, 'Great Lakes Brewing Company', 'https://www.greatlakesbrewing.com/', 'Ohio', 'Cleveland', '2516 Market Ave, Cleveland, OH 44113');
INSERT INTO breweries (brewery_id, owner_id, brewery_name, website, state, city, address) VALUES (14, 01, 'Brew Dog', 'https://www.brewdog.com/usa', 'Ohio', 'Canal Winchester', '96 Gender Rd, Canal Winchester, OH 43110');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (01, 'Voodoo Ranger Atomic Pumpkin', 'New Belgium Brewing Company', 'Pumpkin Ale', '6.4', 'Ale brewed with pumpkin juice, Saigon cinnamon, habanero, aji and del arbol peppers', 01, 'https://www.newbelgium.com/siteassets/beer/voodoo-ranger-atomic-pumpkin/vrap_2021_webbeer--glass-digital-render_1440w-height-is-variable.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (02, 'La Folie', 'New Belgium Brewing Company', 'Sour Ale', '7', 'Flemish Sour Brown Ale fermented in stainless then transferred to barrels for 1-4 years of aging then blended to taste.', 01, 'https://www.newbelgium.com/siteassets/beer/la-folie/cellar-lafolie-2022_1440w.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (03, 'Fat Tire', 'New Belgium Brewing Company', 'Amber Ale', '5.2', 'Fat Tire Amber is the easy-drinking Amber Ale born in Colorado from New Belgium Brewing Company, a certified B-Corp. ', 01, 'https://www.newbelgium.com/siteassets/beer/fat-tire/beer-fat-tire-amber-ale-desktop.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (04, 'Voodoo Ranger IPA', 'New Belgium Brewing Company', 'IPA', '7', 'Bursting with tropical aromas and juicy fruit flavors from Mosaic and Amarillo hops, this golden IPA is perfectly bitter with a refreshing, sublime finish.', 01, 'https://www.newbelgium.com/siteassets/beer/voodoo-ranger-ipa/vripa_2021_globe_can_1080-right.png');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (05, 'Breakfast Stout', 'Founders Brewing Co.', 'Oatmeal Stout', '8.3', 'The coffee lover’s consummate beer. Brewed with an abundance of flaked oats, bitter and imported chocolates, and Sumatra and Kona coffee, this stout has an intense fresh-roasted java nose topped with a frothy, cinnamon-colored head that goes forever.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2018_BreakfastStout_Featured.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (06, 'KBS', 'Founders Brewing Co.', 'Imperial Stout', '12', 'What we’ve got here is an imperial stout brewed with a massive amount of coffee and chocolates, then cave-aged in oak bourbon barrels for an entire year to make sure wonderful bourbon undertones come through in the finish. Makes your taste buds squeal with delight.  KBS stands for "Kentucky Breakfast Stout" ABV varies by batch.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2022_KBS_Featured.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (07, 'Rübæus', 'Founders Brewing Co.', 'Fruit Beer', '5.7', 'This brew achieves its unique raspberry taste by the addition of only fresh raspberries at five seperate stages in the brewing process.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2021_rubaeus_featured.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (08, 'All Day IPA', 'Founders Brewing Co.', 'IPA', '4.7', 'The beer you’ve been waiting for. Keeps your taste satisfied while keeping your senses sharp. An all-day IPA naturally brewed with a complex array of malts, grains and hops. Balanced for optimal aromatics and a clean finish. The perfect reward for an honest day’s work and the ultimate companion to celebrate life’s simple pleasures.', 02, 'https://foundersbrewing.com/wp-content/uploads/2017/08/2020_all_day_ipa_featured.jpg');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (09, 'Isolation Ale', 'Odell Brewing Company', 'Winter Warmer', '6', 'A funny thing happens here around summer’s end—our eyes start searching the skies for those first fall flakes. As we welcome autumn’s first snow, we celebrate the return of Isolation Ale—a sweet-caramel malty ale balanced by a subtle crisp hop finish. Whether you ski, shred, or shoe, it’ll inspire you to make first tracks.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/05/Isolation-Hero.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (10, '90 Shilling Ale', 'Odell Brewing Company', 'Scotch Ale', '5.3', 'We introduced 90 Shilling, our flagship beer, at our opening party in 1989. For a while, we''d been wondering what would happen if we lightened up the traditional Scottish ale? The result is an irresistibly smooth and delicious medium-bodied amber ale.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/04/90-Shilling-ProductCrops-e1588041326994.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (11, 'Myrcenary Double IPA', 'Odell Brewing Company', 'Imperial IPA', '9.3', 'Named for Myrcene, a component of essential oils in the hop flower, Myrcenary Double IPA is our tribute to those who revere the illustrious hop, and their unyielding exploit to craft hop forward beers. Brewed with a blend of hops containing the highest levels of Myrcene, this double IPA prevails with a tropical fruit-like flavor, a pungent floral aroma, and a clean getaway.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/09/NEW-Myrcenary-Hero.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (12, 'Lugene Chocolate Milk Stout', 'Odell Brewing Company', 'Milk Stout', '8.5', 'If you’ve ever been to our brewery, you’ve likely seen the old, beat-up truck that hauls away our spent grain. That truck belongs to Lugene, who’s been feeding his dairy cows the hearty malt for over a decade. Named in his honor, Lugene Chocolate Milk Stout is brewed with milk sugar and milk chocolate. The rich and creamy brew reminds us of a cold glass of chocolate milk and our hometown “Aggie” roots.', 03, 'https://www.odellbrewing.com/wp-content/uploads/2020/10/Lugene-Hero.png');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (13, 'Special Double Cream Stout', 'Bell''s Brewery', 'Milk Sout', '6.1', ' Named for its velvety smooth, creamy texture, this incredibly rich stout is brewed with 10 different specialty roasted malts chosen that impart notes of rich mocha and espresso. Dark and sweet tones intermingle with a soft, roasty finish.', 04, 'https://bellsbeer.com/wp-content/uploads/2022/02/DCS-Render.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (14, 'Two Hearted Ale', 'Bell''s Brewery', 'IPA', '7', 'Perfectly balanced with a malt backbone and combined with the signature fruity aromas of Bell''s house yeast, this beer is remarkably drinkable and well suited for adventures everywhere.', 04, 'https://bellsbeer.com/wp-content/uploads/2021/12/TwoHearted_736px-2.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (15, 'Hopslam Ale', 'Bell''s Brewery', 'Imperial IPA', '10', 'Starting with six different hop varietals added to the brew kettle & culminating with a massive dry-hop addition of Simcoe hops, Bell''s Hopslam Ale possesses the most complex hopping schedule in the Bell''s repertoire.', 04, 'https://bellsbeer.com/wp-content/uploads/2022/02/Hopslam-Render.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (16, 'Oberon', 'Bell''s Brewery', 'Wheat Beer', '5.8', 'Citrusy, easy drinking and refreshing, Oberon Ale is sunshine in a glass. Get into a summer state of mind and #ReachForTheSun.', 04, 'https://bellsbeer.com/wp-content/uploads/2022/02/MicrosoftTeams-image-102.png');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (17, 'Dragon''s Milk', 'New Holland Brewing Company', 'Imperial Stout', '11', 'A barrel aged Imperial Stout with roasty malt character intermingled with deep vanilla tones, all dancing in an oak bath.', 05, 'https://wp.dragonsmilk.com/wp-content/uploads/2021/12/DM-New-Web.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (18, 'Hazy River', 'New Holland Brewing Company', 'IPA', '5.9', 'A true testament to our brewers’ expertise and their passion for innovation, Hazy River is smooth and juicy with a beautiful hazy-golden appearance.', 05, 'https://images.getbento.com/accounts/bbddcd7e12722442009c524ed3c016b9/media/images/48183beer-hazyriver-can-2020.png?w=1000&fit=max&auto=compress,format&h=1000');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (19, 'The Poet', 'New Holland Brewing Company', 'Oatmeal Stout', '5.8', 'Oats bring a creaminess and soft mouth-feel to the roast malt character in our classic oatmeal stout. The Poet is a perfect representation of balance and one of America’s leading oatmeal stouts.', 05, 'https://images.getbento.com/accounts/bbddcd7e12722442009c524ed3c016b9/media/images/88332beer-thepoet-12oz-can-2020.png?w=1000&fit=max&auto=compress,format&h=1000');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (20, 'Ichabod', 'New Holland Brewing Company', 'Pumpkin Ale', '4.5', 'The legend of sleepy hollow lives on with Ichabod pumpkin ale. This flagship seasonal combines malted barley and real pumpkin with cinnamon and nutmeg in a delicious and inviting brew, perfectly paired with all things autumn.', 05, 'https://images.getbento.com/accounts/bbddcd7e12722442009c524ed3c016b9/media/images/87824beer-ichabod-can-2020.png?w=1000&fit=max&auto=compress,format&h=1000');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (21, 'Pack IPA', 'Wolf''s Ridge Brewing', 'IPA', '6.8', 'From our pack to yours - we invite you to share and enjoy this IPA wherever your path leads you. Brimming with Citra, Mosaic and Amarillo hoppy goodness, Pack is the perfect companion for any and all awaiting adventures.', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/12oz__Pack_IPA_01_1024x1024@2x.png?v=1589044310');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (22, 'Oktoberfest', 'Wolf''s Ridge Brewing', 'Marzen', '5.4', 'Steeped in tradition and consumed in celebration, Oktoberfest is the perfect lager to herald the onset of autumn. Toasted bread on the nose leads to a slightly sweet, malty flavor with just a hint of noble hops. Crisp and highly quaffable. Brewed to be drunk by the stein; enjoy this brewer’s favorite seasonal beer!', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/WRB_12oz_Oktoberfest_1024x1024@2x.png?v=1659024205');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (23, 'Daybreak', 'Wolf''s Ridge Brewing', 'Cream Ale', '5', 'Confusing to the senses in the best way possible. Daybreak''s clarity and golden color belie the smooth coffee presence inside. Brewed with local One Line Coffee''s rotating house roast and the finest vanilla beans.', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/12oz_Daybreak_Awards_1024x1024@2x.jpg?v=1637597192');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (24, 'Dire Wolf', 'Wolf''s Ridge Brewing', 'Imperial Stout', '10.8', 'Dire Wolf is fiercely bold, dark, and unrelenting. In bringing together exceptional malts from diverse corners of the world, Dire Wolf impresses the palate with a sophisticated blend of dark chocolates, espresso, caramel, bread, and oats. We offer this beer as a toast to Ohio brewmasters, both past and present, whose unique cultural traditions helped craft a brewing community as substantial as the Dire Wolf herself.', 06, 'https://cdn.shopify.com/s/files/1/0265/6976/9007/products/WRB_12oz_Direwolf_background_1024x1024@2x.png?v=1648054069');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (25, 'Neapolitan Milk Stout', 'Saugatuck Brewing Company', 'Milk Stout', '6', 'A creamy Milk Stout with all the brilliant flavors of Neapolitan Ice Cream in one glass. Taste the rich flavors of chocolate, vanilla and strawberry in this unique beer.', 07, 'https://images.getbento.com/accounts/34290715f5f307dbcf732116ed8bbcd5/media/images/56657Neapolitan_Can_Rendering.png?w=1200&fit=max&auto=compress,format');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (26, 'Blueberry Maple Stout', 'Saugatuck Brewing Company', 'Stout', '6', 'A rich, sweet stout with classic malt characteristics with a bold, unique twist. This beer tastes like you crammed a fat stack of blueberry pancakes into a pint glass and smothered it with maple syrup. Channel your inner lumberjack, because it’s in for a real treat.', 07, 'https://images.getbento.com/accounts/34290715f5f307dbcf732116ed8bbcd5/media/images/92234BMS_Can_Rendering_1.png?w=1200&fit=max&auto=compress,format');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (27, 'Peanut Butter Porter', 'Saugatuck Brewing Company', 'Porter', '5.7', 'A classic Porter rich with the delicious harmony of peanut butter. Open the top on this flavorful beer for a silky smooth drinking experience.', 07, 'https://images.getbento.com/accounts/34290715f5f307dbcf732116ed8bbcd5/media/images/65330Peanut_Butter_Porter_Can.png?w=1200&fit=max&auto=compress,format');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (28, 'Cottonmouth Crusher', 'Saugatuck Brewing Company', 'Sour', '6', 'While you  may know that the Michigan Cottonmouth Snake is a fairly common snake, we can guarantee this beer is anything but common. Cottonmouth Crusher is a tart and funky sour ale with raspberry overtones. Once you’ve been bitten by the delicious pierce of this beer, you’re going to want to suck out all the flavor.', 07, 'https://images.getbento.com/accounts/34290715f5f307dbcf732116ed8bbcd5/media/images/97112CMC_12_oz_Rendering.png?w=1200&fit=max&auto=compress,format');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (29, '1-800-DoubleDouble-XtraXtra-FrootieFrootie-BiggieBiggie-JuicyJuicy', 'Hoof Hearted', 'Imperial IPA', '10', 'Triple Dry-Hopped Triple IPA brewed with Cashmere, Citra, Mosaic & New Zealand Hops', 08, 'http://www.hoofheartedbrewing.com/images/assets/beers/jpg/1-800.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (30, 'It''s Not My First Rodeo, It''s My Second', 'Hoof Hearted', 'Imperial IPA', '10.5', 'This rough rider is a hopped up horn to hoof and back again with American Citra and Mosaic as well as Southern Passion and African Queen from South Africa. 10% ABV but she finishes smoother than the supple leather of a well worn saddle.', 08, 'http://www.hoofheartedbrewing.com/images/assets/beers/jpg/rodeo.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (31, 'Key Bump', 'Hoof Hearted', 'Imperial IPA', '10.5', 'Have you any idea what the street value of this mountain is? Clean off your mirrored glass table and grab a hundo. Key Bump bout to pack your nose full of those oh-so tropical tones. Passionfruit, guava, pineapple(s), calamansi and kumquat barrel down the mountain as quick as Alberto Tomba on an Olympic qualifying run. Hopped with the most dangerous weapon in the game (ElMoMoCoe) + fermented w/ the fruity flyboi Orenthal, Key Bump''s the pick-me-up you can''t put down. To quote the great Clyde Von Damme, "What the hell is Dim Mak?"', 08, 'http://www.hoofheartedbrewing.com/images/assets/beers/jpg/key-bump.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (32, 'Musk Of The Minotaur', 'Hoof Hearted', 'New England IPA', '7.2', 'Follow your nose to the most righteous party of the year. Huge orange and grapefruit aromas alongside a generous helping of some of that unmistakable dank stank. A mouthwateringly crisp and refreshing hop bitterness drives this bad Oscar home.', 08, 'http://www.hoofheartedbrewing.com/images/assets/beers/jpg/motm.jpg');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (33, 'Truth', 'Rhinegeist Brewery', 'IPA', '7.2', 'Rare are moments of truth, when you’ve struck the last match, belting out tunes with your friends, staring deep into the campfire – times when you feel infinite. Our Truth is found in the scintillating brilliance of hops. Brewed with a nod to the Pacific, hops sizzle with tropical fruit aroma, grapefruit and mango notes and a dry finish.', 09, 'https://rhinegeist.com/wp-content/uploads/2018/07/Truth_CanRender-768x1179.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (34, 'Franz', 'Rhinegeist Brewery', 'Oktoberfest', '5.4', 'Franz is our Oktoberfest beer. He’s an autumnal brew, a bit of a dreamer, often hikes in the Alps and comes back with great ideas for delicious malts and is forever hoisting barrels over his head for ’ze exercize’. Franz is our Oktoberfest brau, and our first take on a German brew. Not traditional, but über German. These malts will PUMP you UP, jaaah!', 09, 'https://rhinegeist.com/wp-content/uploads/2018/08/Franz_CanRender-768x1178.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (35, 'Dad', 'Rhinegeist Brewery', 'Amber Ale', '6', 'Hi Thirsty, I’m Dad. This Hoppy Red Ale sports a robust malt bill as ample and snug as a well worn flannel. Throwing on a pair of oversized sneakers that break all known fashion laws, Dad mows acres of dank, piney hops, uphill both ways in the snow. Keep it up—I’ll turn this can around.', 09, 'https://rhinegeist.com/wp-content/uploads/2018/08/Dad_Can_Render_new-768x1179.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (36, 'Saber Tooth Tiger', 'Rhinegeist Brewery', 'Imperial IPA', '8.5', 'Prehistorically hopped Imperial India Pale Ale that attacks the senses with potent notes of Papaya, Mango, and Peach- yet it finishes its prey (your palate) with a crisp clean citrus bitterness.', 09, 'https://rhinegeist.com/wp-content/uploads/2018/08/STT_CanRender-768x1179.png');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (37, 'Lemon Glow', 'Land-Grant Brewing Company', 'Pale Ale', '5.8', 'No flavoring, no lemonade, no zest. Not one single lemon was harmed in the creation of this beer. Lemon Glow’s luminous citrus taste is revealed solely through its hops: Loral, Citra, Lemondrop and Centennial.', 10, 'https://landgrantbrewing.com/wp-content/uploads/2021/01/lemon_glow_can_b-3.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (38, 'Stiff Arm', 'Land-Grant Brewing Company', 'IPA', '6.4', 'Hoppy IPA’s are our first beer love here at Land-Grant, so we are excited to offer this continually hopped American IPA. This beer packs fragrant citrus aromas of citrus and pine, and a sense of balance provided by a nice malt backing.', 10, 'https://landgrantbrewing.com/wp-content/uploads/2022/07/stiffarm_can.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (39, 'Creamsikolsch', 'Land-Grant Brewing Company', 'Kolsch', '6', 'Orange, vanilla bean, and a crisp Kölsch backbone whip up nostalgic summer-friendly harmonies. It''s a pairing so sweet you can almost hear the ice cream truck coming down the street.', 10, 'https://landgrantbrewing.com/wp-content/uploads/2022/06/creamsikolsch_can.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (40, 'Inflatable Flamingo', 'Land-Grant Brewing Company', 'Wheat Ale', '5', 'This light, fruity, Agua Fresca-inspired summer crusher is right at home poolside, oceanside, or lakeside.', 10, 'https://landgrantbrewing.com/wp-content/uploads/2021/05/xinflatable_flamingo_can.png.pagespeed.ic.BbduV2EBX-.webp');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (41, 'Chomolungma', 'Jackie O''s', 'Brown Ale', '6.5', 'This brown ale was brewed to commemorate the 2007 Lungevity Everest Expedition. The people of Tibet call Mt. Everest “Chomolungma,” and this exceptional ale carries on the spirit of the climb. Seven Malts, three hops, and 100 pounds of local wild flower honey give this ale an exceptional character. Baked muffins, dark fruit, bittersweet chocolate, rich honey and earthy subtle hops caress the palate.', 11, 'https://craftpeak-cooler-images.imgix.net/jackie-os-pub-brewery/Chomolungma_Front.jpg?auto=compress%2Cformat&fit=crop&h=600&ixlib=php-3.3.0&w=600&wpsize=tile_strict&s=6336625a166cc221a92528735f4b4ec5');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (42, 'Oil of Aphrodite', 'Jackie O''s', 'Imperial Stout', '10', 'Oil of Aphrodite is an American double stout brewed with locally harvested black walnuts and Belgian candied syrup. English, German, American, and Belgian malts are accompanied by Pacific Northwest hops, creating a sweet and rich springboard for deep nuttiness.', 11, 'https://craftpeak-cooler-images.imgix.net/jackie-os-pub-brewery/Oil.jpg?auto=compress%2Cformat&fit=crop&h=600&ixlib=php-3.3.0&w=600&wpsize=tile_strict&s=5b5f72af5aca5d32f4af8997a0bf35c2');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (43, 'Paw Paw Wheat', 'Jackie O''s', 'Wheat Ale', '9', 'An Ohio native fruit, the Paw Paw is a relative of tropical fruit trees; however, it grows in temperate climates and produces a one of a kind experience with flavors of mango, banana, and a touch of melon. Our Paw Paw Wheat ale is fermented in this fruit to celebrate the annual Ohio Paw Paw Festival.', 11, 'https://craftpeak-cooler-images.imgix.net/jackie-os-pub-brewery/PawPawWheat.jpg?auto=compress%2Cformat&fit=crop&h=600&ixlib=php-3.3.0&w=600&wpsize=tile_strict&s=a56466a3bb80667ffc0492f49249c573');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (44, 'Mystic Mama', 'Jackie O''s', 'IPA', '7', 'Our flagship West-Coast style IPA is brewed with a tremendous amount of hand-selected American hops, delivering extraordinary tropical and citrus notes alongside a firm but satiating bitterness.', 11, 'https://craftpeak-cooler-images.imgix.net/jackie-os-pub-brewery/MysticMama_Front.jpg?auto=compress%2Cformat&fit=crop&h=600&ixlib=php-3.3.0&w=600&wpsize=tile_strict&s=844018c394f423dce8b9161e6a709d71');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (45, 'White Rajah', 'The Brew Kettle', 'IPA', '6.8', 'A West Coast style IPA full of citrus-like and tropical fruit like hop flavor and aroma with an assertive yet smooth bitter finish….malt, take a back seat, please.', 12, 'https://thebrewkettle.com/wp-content/uploads/2019/08/White-Rajah-Label.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (46, 'Black Rajah', 'The Brew Kettle', 'Black IPA', '6.8', 'A Black IPA full of tropical fruit players and assertive bitterness and a hint of roasted malt. Featuring Citra hops.', 12, 'https://thebrewkettle.com/wp-content/uploads/Black-Rajah-web.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (47, 'Kitka', 'The Brew Kettle', 'Milk Stout', '5.7', 'With a deceptively light body for such a dark and decadent beer, we take a traditional milk stout and add a sultry addition of Chocolate, Coconut, and Vanilla. This beer has enough dark flavors to survive the winter cold with waves of coconut make remind us of a tropical paradise. Kitka is always on the prowl, no matter what time of year', 12, 'https://thebrewkettle.com/wp-content/uploads/2019/09/Kitka-Milk-Stout.jpg');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (48, 'Oktofest', 'The Brew Kettle', 'Oktoberfest', '6', 'Amber hued with a rich malty character from a blend of German malts with just a touch of German Tettnang hops for added complexity.', 12, 'https://thebrewkettle.com/wp-content/uploads/2019/08/Oktofest-2019-web.png');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (49, 'Dortmunder Gold', 'Great Lakes Brewing Company', 'Lager', '5.8', 'A classic award-winning balance of sweet malt and dry hop flavors, proudly waving the flag for Cleveland and refreshing beer drinkers everywhere since 1988.', 13, 'https://www.greatlakesbrewing.com/sites/default/files/new-dortmunder.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (50, 'Blackout Stout', 'Great Lakes Brewing Company', 'Imperial Stout', '9.9', 'Bold and dark as a power-less metropolis, our Imperial Stout commemorates the infamous 2003 blackout that briefly left some 55 million people utterly unplugged.', 13, 'https://www.greatlakesbrewing.com/sites/default/files/blackout-stout-bottle-and-glassware.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (51, 'Christmas Ale', 'Great Lakes Brewing Company', 'Winter Warmer', '7.5', 'Do not open ‘til Christmas? Whoever coined that phrase obviously hasn’t tasted Christmas Ale’s fresh honey, cinnamon, and ginger flavors.', 13, 'https://www.greatlakesbrewing.com/sites/default/files/xmas-ale-new.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (52, 'Chillwave', 'Great Lakes Brewing Company', 'Imperial IPA', '9', 'Inspired by the North Coast''s dedicated (and sometimes chilly) surf community, our fully stoked Imperial IPA will melt the ice in your beard and never lose its balance.', 13, 'https://www.greatlakesbrewing.com/sites/default/files/new-chillwave.png');

INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (53, 'Elvis Juice', 'Brew Dog', 'IPA', '6.5', 'An American IPA with a bitter edge that will push your citrus tolerance to the brink and back; Elvis Juice is loaded with tart pithy grapefruit. This IPA has a caramel malt base, supporting a full frontal citrus overload - grapefruit piled on top of intense aroma hops. Waves of crashing pine, orange and grapefruit round out this citrus infused IPA.', 14, 'https://www.brewdog.com/media/catalog/product/cache/eb360c13587b21a8ac6c611a2762b864/e/l/elvisjuice_16oz.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (54, 'Fest Bier', 'Brew Dog', 'Helles Lager', '6', 'Get ready to have your taste buds yelling "prost"! Fest Bier is a golden pale helles overfilled with malty crispness and bavarian cheer that brings the festivities anywhere you drink it. You''ll taste subtle sweetness and a slightly bitter taste, with an aroma of honey, caramel, toffee and biscuit.', 14, 'https://www.brewdog.com/media/catalog/product/cache/1ad74aa7a7537876841fc58ef6f41538/m/i/microsoftteams-image_62_.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (55, 'Jet Black Heart', 'Brew Dog', 'Oatmeal Stout', '7', 'Jet Black Heart is back; back in black. With an amped up 7%abv,  ABV, this Nitro Oatmeal Stout is decadent to the core and loaded with heaps of oatmeal, delivering a red carpet of silky opulence. It’s overflowing with notes of bitter cacao, roasted coffee, and dark berry fruits. It’ll plunge you into the deep, dark, abyss.', 14, 'https://www.brewdog.com/media/catalog/product/cache/eb360c13587b21a8ac6c611a2762b864/j/b/jbh_3can_pyramid.png');
INSERT INTO beers (beer_id, beer_name, brewery_name, style, abv, description, brewery_id, img_url) VALUES (56, 'Cannon Blast', 'Brew Dog', 'Pale Ale', '5', 'The first collaboration beer between BrewDog and Columbus Blue Jackets has hit the ice. A hockey-themed beer that was named by the fans, for the fans. This American Pale Ale delivers a truckload of citrus and pine aromas in a crushable ABV. Our American Pale Ale is crisp in the can, and even crisper off the ice.', 14, 'https://www.brewdog.com/media/catalog/product/cache/1ad74aa7a7537876841fc58ef6f41538/c/a/cannonblast_16oz.png');

INSERT INTO favorites (user_id, beer_name, brewery_name) VALUES (09, 'White Rajah', 'The Brew Kettle');

INSERT INTO reviews (review_id, brewery_name, beer_name, description, rating, user_id) VALUES (09, 'The Brew Kettle', 'White Rajah', 'Really good!!1!', '5', 01);

INSERT INTO users (user_id, username, password_hash, role) VALUES (09, 'Person_McMan', 'Jg45HuwT7PZkfuKTz6IB90CtWY4=', 'user');




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