drop database if exists inside_out_metal;
create database inside_out_metal;

create table inside_out_metal.band (
    id integer primary key auto_increment,
    name varchar(40) not null,
    history varchar(2000) not null
) engine = InnoDB;

create table inside_out_metal.language (
    region_code varchar(8) primary key,
    name varchar(40) not null
) engine = InnoDB;

create table inside_out_metal.promotion (
    id integer primary key auto_increment,
    percentage_granted double not null,
    constraint percentage_check check (percentage_granted > 0 and percentage_granted <= 1)
) engine = InnoDB;

create table inside_out_metal.category (
    id integer primary key
) engine = InnoDB;


create table inside_out_metal.advantage (
    promotion_id integer,
    category_id integer,
    constraint advantage_pk primary key (promotion_id, category_id),
    constraint advantage_promotion_id_fk foreign key (promotion_id) references promotion(id),
    constraint advantage_category_id_fk foreign key (category_id) references category(id)
) engine = InnoDB;

create table inside_out_metal.translation (
    category_id integer,
    language_region_code varchar(8),
    label varchar(255) not null,
    constraint translation_pk primary key (category_id, language_region_code),
    constraint translation_category_id_fk foreign key (category_id) references category(id),
    constraint translation_language_region_code_fk foreign key (language_region_code) references language(region_code)
) engine = InnoDB;

create table inside_out_metal.product (
    id integer primary key auto_increment,
    name varchar(200) not null,
    price double not null,
    targeted_gender varchar(1),
    size varchar(7) not null,
    color varchar(15) not null,
    description varchar(5000),
    image varchar(50) not null,
    band_id integer not null,
    category_id integer not null,
    constraint product_band_id_fk foreign key (band_id) references band(id),
    constraint product_category_id_fk foreign key (category_id) references category(id),
    constraint product_price_ck check ( price > 0 )
) engine = InnoDB;

create table inside_out_metal.customer (
    id integer primary key auto_increment,
    username varchar(20) unique not null,
    password varchar(60) not null,
    email_address varchar(50) unique not null,
    phone_number varchar(20) unique not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    birthdate date not null,
    gender varchar(1) not null,
    vat_number varchar(30),
    street varchar(255) not null,
    number varchar(5) not null,
    country varchar(42) not null,
    city varchar(30) not null,
    postal_code varchar(10) not null,
    authorities varchar(500) not null,
    non_expired tinyint(1) not null,
    non_locked tinyint(1) not null,
    credentials_non_expired tinyint(1) not null,
    enabled tinyint(1) not null,
    constraint first_name_ck check ( regexp_like(first_name, '^[a-zA-Z??-??]+-?[a-zA-Z??-??]*$') ),
    constraint last_name_ck check ( regexp_like(last_name, '^[a-zA-Z??-??]+((?!$)-?\s?[a-zA-Z??-??]*)+$') ),
    constraint email_ck check ( regexp_like(email_address, '^[a-zA-Z??-??0-9]+.?-?[a-zA-Z??-??0-9]+@[a-zA-Z??-??]+.[a-zA-Z??-??]+$' ))
) engine = InnoDB;

create table inside_out_metal.order (
    id integer primary key auto_increment,
    `date` timestamp not null,
    customer_id integer,
    constraint order_customer_id_fk foreign key (customer_id) references customer(id)
) engine = InnoDB;

create table inside_out_metal.order_line (
    id integer primary key auto_increment,
    order_id integer not null,
    product_id integer not null,
    price_shown double not null,
    quantity integer not null,
    constraint order_line_order_id_fk foreign key (order_id) references `order`(id),
    constraint order_line_product_id_fk foreign key (product_id) references product(id),
    constraint order_line_quantity_ck check ( quantity > 0 ),
    constraint order_line_price_shown_ck check ( price_shown > 0 )
) engine = InnoDB;

insert into inside_out_metal.band(name, history) values ('Avenged Sevenfold', 'Avenged Sevenfold (A7X) est un groupe de heavy metal am??ricain, originaire de Huntington Beach, en Californie. Ayant longtemps ??t?? un pilier de la sc??ne underground californienne, le groupe conna??t un franc succ??s avec l''album City of Evil et l''album homonyme Avenged Sevenfold. Fond?? par M. Shadows, Zacky Vengeance, The Rev et Matt Wendt ?? la fin des ann??es 1990, la composition actuelle du groupe est : M. Shadows au chant, Synyster Gates ?? la guitare solo, Zacky Vengeance ?? la guitare rythmique, Johnny Christ ?? la basse et Brooks Wackerman ?? la batterie. Le groupe ??merge dans un son metalcore, puis ??volue vers un son plus hard rock et heavy metal. En date, Avenged Sevenfold recense neuf albums studio, un album live, une compilation, un DVD, et dix-neuf singles, et plus de huit millions d''albums vendus ?? travers le monde.');
insert into inside_out_metal.band(name, history) values ('Five Finger Death Punch', 'Five Finger Death Punch, abr??vi?? FFDP ou 5FDP, est un groupe de heavy metal am??ricain fond?? en 2005 ?? Las Vegas, au Nevada. Le groupe tient son nom d???une prise de Kung Fu du film d???action Kill Bill. Originellement constitu?? du chanteur Ivan Moody, des guitaristes Zoltan Bathory et Caleb Andrew Bingham ainsi que du bassiste Matt Snell et du batteur Jeremy Spencer, le groupe est d??sormais compos?? de : Ivan Moody, Zoltan Bathory, Andy James (guitare principale), Chris Kael (basse) et Charlie Engen. En 2019, 5FDP est nomm?? ?? Best International Artist ?? par le Bandit Rock Awards, et en 2020, le groupe est nomin?? pour le ?? Rock Artist of the Year ?? par iHeartRadio Music Awards.');
insert into inside_out_metal.band(name, history) values ('Ghost', 'La Su??de compte quelques groupes de metal vraiment bons. Mais ce qui a vu le jour en 2008 ?? Link??ping est vraiment unique ?? un groupe de six musiciens d??sirant devenir c??l??bres sans en r??v??ler trop sur leurs vies priv??es. C???est m??me devenu sa marque de fabrique. Les six musiciens ont d??cid?? de nommer leur groupe Ghost et ont choisis de ne pas r??v??ler leurs identit??s . ?? ce jour, on conna??t uniquement le chanteur du groupe, Papa Emeritus, dont le visage est peint comme une t??te de mort et qui est v??tu d???une longue robe papale. En tout cas, c?????tait ainsi jusqu???en 2018, lorsque Papa Emeritus fut remplac?? par Cardinal Copia pour le quatri??me album de Ghost, ?? Prequelle ??. ??videmment seul le nom a chang??. C???est toujours le m??me chanteur ??? Tobias Forge ??? qui se cache derri??re le pseudonyme. Les autres musiciens du groupe sont connus comme des ?? nameless ghouls ??. Ils dissimulent leurs identit??s derri??re des capes noires et brunes, qui donnent au groupe une allure particuli??re.');
insert into inside_out_metal.band(name, history) values ('Powerwolf', 'Powerwolf est un groupe de power metal allemand, originaire de Sarrebruck. Le groupe, form?? en 2003 par Charles et Matthew Greywolf, officie d''abord sous le label Metal Blade Records, puis sous le label Napalm Records ?? partir de 2012 avec l''album Preachers of the Night. Utilisant abondamment ch??urs et orgues, les membres s''inspirent ??galement, pour de nombreuses chansons, de chants religieux comportant parfois des parties en latin. Le groupe est aujourd???hui constitu?? de : Attila Dorn au chant, Falk Maria Schlegel aux claviers, Roel van Helden ?? la batterie ainsi que les fr??res Charles et Matthew Greywolf. La musique du groupe est facilement reconnaissable gr??ce ?? certains aspects tels que l???orgue jou?? par Falk Maria Schlegel.');
insert into inside_out_metal.band(name, history) values ('Trivium', 'Trivium est un groupe de heavy metal am??ricain, originaire d''Orlando, Floride. Form?? en 2000, le groupe est pass?? du metalcore avec ses deux premiers albums (Ember to Inferno, Ascendancy), au thrash metal (The Crusade), jusqu''au compromis entre les deux (Shogun) ; cependant, l''appartenance au style metalcore est ni??e et d??sapprouv??e par le groupe. En 2013, le groupe compte plus de 6 millions d''albums vendus ?? travers le monde. En 2020, le groupe compte au total neuf albums studio.');

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender, vat_number,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('aurelie', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'bodartaurelie2008@hotmail.com', '0495505955', 'Aur??lie', 'Bodart', '1996-05-10', 'f', '123456789',
'rue des Bolettes', '3', 'Belgique', 'Naninne', '5100', 'ROLE_ADMIN', 1, 1, 1, 1);

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender, vat_number,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('DrakeXorn', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'christophe.bernard@henallux.be', '0471124035', 'Christophe', 'Bernard', '2000-01-10', 'm', '987654321',
'Val des Rois', '12', 'Belgique', 'W??pion', '5100', 'ROLE_ADMIN', 1, 1, 1, 1);

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('nyssa', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'nyssa@croquette.cat', '0465879645', 'Nyssa', 'Chat', '2016-03-24', 'f',
'rue des Bolettes', '3', 'Belgique', 'Naninne', '5100', 'ROLE_USER', 1, 1, 1, 1);

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('biscotte', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'biscotte@croquette.cat', '0498369542', 'Biscotte', 'Chat', '2013-06-26', 'f',
'Val des rois', '12', 'Belgique', 'W??pion', '5100', 'ROLE_USER', 1, 1, 1, 1);

insert into inside_out_metal.language (region_code, name) values ('fr', 'fran??ais');
insert into inside_out_metal.language (region_code, name) values ('en', 'english');

insert into inside_out_metal.category (id) values (1);
insert into inside_out_metal.category (id) values (2);
insert into inside_out_metal.category (id) values (3);
insert into inside_out_metal.category (id) values (4);
insert into inside_out_metal.category (id) values (5);

insert into inside_out_metal.translation (category_id, language_region_code, label) values (1, 'fr', 'Accessories');
insert into inside_out_metal.translation (category_id, language_region_code, label) values (1, 'en', 'Accessories');

insert into inside_out_metal.translation (category_id, language_region_code, label) values (2, 'fr', 'Chaussures');
insert into inside_out_metal.translation (category_id, language_region_code, label) values (2, 'en', 'Shoes');

insert into inside_out_metal.translation (category_id, language_region_code, label) values (3, 'fr', 'Pulls');
insert into inside_out_metal.translation (category_id, language_region_code, label) values (3, 'en', 'Sweaters');

insert into inside_out_metal.translation (category_id, language_region_code, label) values (4, 'fr', 'Albums');
insert into inside_out_metal.translation (category_id, language_region_code, label) values (4, 'en', 'Media');

insert into inside_out_metal.translation (category_id, language_region_code, label) values (5, 'fr', 'T-shirts');
insert into inside_out_metal.translation (category_id, language_region_code, label) values (5, 'en', 'T-shirts');

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('T-shirt manches courtes', 24.99, 'm', 'L', 'Noir',
'Shogun est le quatri??me album studio de Trivium. Pour tous les fans de heavy metal, ce t-shirt ?? Shogun ?? est parfait pour regrouper vos souvenirs de cet album dans un v??tement de votre garde-robe, et il peut ??tre command?? chez EMP. L''avant de ce haut noir affiche une reproduction fid??le de la couverture de l''album.',
'T-Shirts/Trivium_1.jpg', 5, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Rose Laurel, T-shirt manches courtes', 19.99, 'f', 'M', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant',
'T-Shirts/Trivium_2.jpg', 5, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Kiss Of The Cobra King, T-shirt manches courtes', 21.99, 'm', 'M', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant et dans le dos',
'T-Shirts/Powerwolf_1.jpg', 4, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Your blood, T-shirt manches courtes', 21.99, 'm', 'L', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant et dans le dos',
'T-Shirts/Powerwolf_2.jpg', 4, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Dance Macabre, T-shirt manches courtes', 29.99, 'f', 'M', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant',
'T-Shirts/Ghost_Dance_Macabre.jpg', 3, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Master Puppetier, T-shirt manches courtes', 25.99, 'm', 'M', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant',
'T-Shirts/Ghost_Master_Puppetier.jpg', 3, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Nightmare, T-shirt manches courtes', 21.99, 'm', 'L', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant',
'T-Shirts/A7X_1.jpg', 1, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Currency, T-shirt manches courtes', 19.99, 'm', 'M', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant',
'T-Shirts/A7X_2.jpg', 3, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('IDGAF, T-shirt manches courtes - Edition limit??e', 19.99, 'm', 'L', 'Noir',
'Dites ?? 2020 comment vous vous sentez avec le T-Shirt IDGAF (I Don''t Give A F***) de 5FDP !
Dot?? d''un logo IDGAF avec un majeur entre le 2020 sur la poitrine, ce t-shirt en coton doux en ??dition limit??e a une version plus grande au dos.

Prenez ce tee-shirt avant qu''il ne disparaisse pour toujours!',
'T-Shirts/5FDP_IDGAF.jpg', 2, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('F8 Infinity, T-shirt manches courtes', 21.99, 'm', 'L', 'Noir',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant et dans le dos',
'T-Shirts/5FDP_F8_Infinity.jpg', 2, 5);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Diamonds in the rough LP - ??dition limit??e, A7X', 25.99, 'Unique', 'transparent',
'Format : 2-LP
Genre : Metalcore
Titres :
    LP1 :
        1. Demons
        2. Girl I know
        3. Crossroads
        4. Flash of the blade
        5. Until the end
        6. Tension
        7. Walk
        8. The fight
    LP2 :
        1. Dancing dead
        2. Almost easy (CLA Mix)
        3. Afterlife (Alternate Version)
        4. St. James
        5. Set me free
        6. 4:00 AM
        7. Lost it all
        8. Paranoid',
'Albums/A7X_Diamonds_in_the_rough.jpg', 1, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('The Stage, A7X', 16.99, 'Unique', 'Bo??tier cristal',
'Format : CD
Genre : Metalcore
Titres :
    CD1 :
        1. The Stage
        2. Paradigm
        3. Sunny Disposition
        4. God Damn
        5. Creating God
        6. Angels
        7. Simulation
        8. Higher
        9. Roman Sky
        10. Fermi Paradox
        11. Exist',
'Albums/A7X_The_Stage.jpg', 1, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('F8, 5FDP', 16.99, 'Unique', 'Bo??tier cristal',
'Format : CD
Genre : Nu Metal
Titres :
    CD1 :
        1. F8
        2. Inside Out
        3. Full Circle
        4. Living the Dream
        5. A Little Bit Off
        6. Bottom of the Top
        7. To Be Alone
        8. Mother May I (Tic Toc)
        9. Darkness Settles In
        10. This Is War
        11. Leave It All Behind
        12. Scar Tissue
        13. Brighter Side of Grey
        14. Making Monsters
        15. Death Punch Therapy
        16. Inside Out (Radio Edit)',
'Albums/5FDP_F8.jpg', 2, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Blessed & Possessed, Powerwolf', 19.99, 'Unique', 'Bo??tier cristal',
'Format : CD
Genre : Power Metal
Titres :
    CD1 :
        1. Blessed & Possessed
        2. Dead Until Dark
        3. Army Of The Night
        4. Armata Strigoi
        5. We Are The Wild
        6. Higher Than Heaven
        7. Christ &amp; Combat
        8. Sanctus Dominus
        9. Sacramental Sister
        10. All You Can Bleed
        11. Let There Be Night',
'Albums/Powerwolf_Blessed_And_Possessed.jpg', 4, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('The sacrament of sin, Powerwolf', 16.99, 'Unique', 'Noir',
'
Avec The Metal Mass Live, les fr??res Greywolf et leur bande ont fait fort !
L?????nergie est palpable et cela donne vraiment envie d???assister ?? leur prochain concert !

Format : CD
Genre : Power Metal
Titres :
    CD1 :
        1. Fire & Forgive
        2. Demons Are A Girl???s Best Friend
        3. Killers With The Cross
        4. Incense And Iron
        5. Where The Wild Wolves Have Gone
        6. Stossgebet
        7. Nightside Of Siberia
        8. The Sacrament Of Sin
        9. Venom Of Venus
        10. Nighttime Rebel
        11. Fist By Fist (Sacralize Or Strike)',
'Albums/Powerwolf_1.jpg', 4, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Prequelle LP, Ghost', 19.99, 'Unique', 'Noir',
'Format : LP
Genre : Doom
Titres :
    LP1 :
        1. Ashes
        2. Rats
        3. Faith
        4. See The Light
        5. Miasma
        6. Dance Macabre
        7. Pro Memoria
        8. Witch Image
        9. Helvetesfonster
        10. Life Eternal',
'Albums/Ghost_Prequelle.jpg', 3, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Meliora & Popestar, Ghost', 21.99, 'Unique', 'Noir',
'Cette ??dition Deluxe contient l''album de 2015, ?? Meliora ??, ainsi que le nouvel EP, ?? Popestar ??.

Ghost nous propose un nouvel EP. Comme c''??tait le cas pour le EP pr??c??dent, ?? Popestar ?? contient des reprises ??tonnantes de Echo and the Bunnymen, Simiam Mobile Disco, Eurythmics et Imperiet ainsi que le nouveau single de Ghost intitul?? ''Square Hammer''. Apr??s l''??vidente influence tr??s 90''s du pr??c??dent EP, c''est la Wave des ann??es 80 qui se fait une place sur ce nouvel EP. Cette ann??e, Papa Emeritus et ses Nameless Ghouls ont remport?? le award ?? Best Metal Performance ??.

Format : CD & EP-CD
Genre : Doom
Titres :
    CD1 :
        1. Spirit
        2. From The Pinnacle To The Pit
        3. Cirice
        4. Sp??ksonat
        5. He Is
        6. Mummy Dust
        7. Majesty
        8. Devil Church
        9. Absolution
        10. Deus In Absentia
    CD2 :
        1. Square Hammer
        2. Nocturnal Me
        3. I Believe
        4. Missionary Man
        5. Bible',
'Albums/Ghost_Meliora_Popestar.jpg', 3, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('What the dead men say, Trivium', 18.99, 'Unique', 'Noir',
'Procurez-vous le nouvel album de Trivium ?? What The Dead Men Say ?? au format CD.
Trivium est de retour avec un nouvel album.
Le LP s''appelle ?? What the Dead Men Say ?? et est le successeur du r??ussi ?? The Sin and the Sentence ?? sorti en 2017.

Format : CD
Genre : Heavy metal
Titres :
    CD1 :
        1. IX
        2. What The Dead Men Say
        3. Catastrophist
        4. Amongst The Shadows And The Stones
        5. Bleed Into Me
        6. The Defiant
        7. Sickness Unto You
        8. Scattering The Ashes
        9. Bending The Arc To Fear
        10. The Ones We Leave Behind',
'Albums/Trivium_1.jpg', 5, 4);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Ember to inferno, Trivium', 16.99, 'Unique', 'Orange',
'Le premier album du groupe est enfin de nouveau disponible.
Et ?? Ember To Inferno ??, sign?? par le groupe men?? par Matt Heafy, marque sur tous les terrains.
Ils ont enregistr?? l''album avec l''aide de Jason Suecof au Audio Hammer Studio et l''ont mix?? au m??me endroit ainsi qu''au l??gendaire
Morrisound Studio de Tampa en Floride. Cet album est nettement influenc?? par la vague Metalcore et poss??de un travail guitaristique vari??
ainsi qu''une v??ritable passion pour le Thrash Metal.

Format : CD
Genre : Heavy metal
Titres :
    CD1 :
        1. Inception the bleeding skies
        2. Pillars of serpents
        3. If I could collapse the masses
        4. Fugue (A revelation)
        5. Requiem
        6. Ember to inferno
        7. Ashes
        8. To burn the eye
        9. Falling to grey
        10. My hatred
        11. When all light dies
        12. A view of burning empires',
'Albums/Trivium_2.jpg', 5, 4);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Logo, T-shirt manches longues', 26.99, 'h', 'M', 'Noir/blanc',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant
?? Manche imprim??e',
'Sweaters/Avenged_Sevenfold_1.jpg', 1, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Avenged Sevenfold, T-shirt manches longues', 29.99, 'f', 'M', 'Blanc',
'?? Longueur standard
?? Coupe standard
?? Col rond
?? Imprim?? ?? l''avant et dans le dos
?? Manches imprim??es
', 'Sweaters/Avenged_Sevenfold_2.jpg', 1, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('4 Life', 59.99, 'f', 'S', 'Noir/rouge',
'?? Longueur standard
?? Coupe standard
?? Imprim?? ?? l''avant et dans le dos
?? Manches imprim??es
', 'Sweaters/5FDP_4_Life.jpg', 2, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Wash It All Away', 49.99, 'f', 'S', 'Noir/rouge',
'?? Hood with drawstring
?? Kangaroo pocket
?? Ribbed cuffs and hem
?? Front and back print
', 'Sweaters/5FDP_1.jpg', 2, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Ring Photo, Sweat-shirt zipp?? ?? capuche', 49.99, 'h', 'S', 'Noir/rouge',
'?? Col rond
?? Coupe standard
?? Poignets c??tel??s
?? Imprim?? ?? l''avant et dans le dos',
'Sweaters/Ghost_1.jpg', 3, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Throne, T-shirt manche longues', 32.99, 'h', 'M', 'Noir/rouge',
'?? Col rond
?? Coupe standard
?? Poignets c??tel??s
?? Imprim?? ?? l''avant et dans le dos',
'Sweaters/Ghost_2.jpg', 3, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Armata Strigoi, Sweat-shirt ?? capuche', 49.99, 'h', 'L', 'Noir',
'?? Col rond
?? Coupe standard
?? Poignets c??tel??s
?? Imprim?? ?? l''avant et dans le dos',
'Sweaters/Powerwolf_1.jpg', 4, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Pull Powerwolf de No??l 2020', 59.99, 'h', 'M', 'Multicolore',
'?? Tricot
?? Col rond
?? Coupe standard
?? Poignets c??tel??s
?? Motif int??gral', 'Sweaters/Powerwolf_sweater.jpg', 4, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Witch Hunt Hoodie, Sweat-shirt zipp?? ?? capuche', 46.99, 'h', 'M', 'Noir',
'?? Capuche avec cordon
?? Poche kangourou divis??e
?? Fermeture ??clair cach??e
?? Bords et poignets c??tel??s
?? Imprim?? ?? l''avant et dans le dos',
'Sweaters/Trivium_1.jpg', 5, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Snake Arch, Sweat-shirt ?? capuche', 46.99, 'f', 'S', 'Noir/vert',
'?? Capuche avec cordon
?? Bords et poignets c??tel??s
?? Poche kangourou
?? Int??rieur textur??
?? Imprim?? ?? l''avant et ?? l''arri??re',
'Sweaters/Trivium_2.jpg', 5, 3);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Mug Logo Five Finger Death Punch', 12.99, 'Unique', 'Noir',
'?? Capacit?? : 0,4 L
?? Non adapt?? au lave-vaisselle et au micro-ondes',
'Accessories/5FDP_Logo_Mug.jpg', 2, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Casquette Five Finger Death Punch', 24.99, 'Unique', 'Noir/rouge',
'?? Ajustable de 50 ?? 59 cm
?? Patch avec logo 3D sur le devant et ?? l''arri??re
?? Longueur de la visi??re : 7 cm

Le groupe Am??ricain, Five Finger Death Punch ravit ses fans depuis 2005.
Cette casquette avec logo est parfaite pour afficher votre adoration envers le groupe Am??ricain.
Cette casquette ajustable avec bouton-pression et visi??re poss??de le logo rouge du groupe ainsi que le lettrage ''5FDP ??.
Le num??ro 5 ?? l''arri??re vient compl??ter l''ensemble !',
'Accessories/5FDP_1.jpg', 2, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Calice Papa Emeritus III', 19.99, 'Unique', 'Multicolore',
'?? Chope ?? bi??re avec motif Ghost peint ?? la main
?? Tasse amovible en acier inoxydable
?? Dimensions : env. 10,5 x 8 cm
?? Capacit?? : env. 0,2 litres
?? La tasse en acier inoxydable doit ??tre uniquement lav??e ?? la main',
'Accessories/Ghost_Calice.jpg', 3, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Screaming Skull, Patch, Trivium', 4.99, 'Unique', 'Noir/blanch',
'?? 8,5 x 10 cm',
'Accessories/Trivium_patch.jpg', 5, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Metal X-MAS', 8.99, 'Unique', 'Multicolore', 'Calendrier de l''avent Powerwolf !', 'Accessories/Powerwolf_Metal_X_mas_2020.jpg', 4, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('We Drink Your Blood', 29.99, 'Unique', 'Transparent', 'De magnifiques verres ?? shot estampill??s "We Drink Your Blood" par Powerwolf.', 'Accessories/Powerwolf_We_drink_your_Blood.jpg', 4, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Deathbat Logo', 34.99, 42, 'Noir/rouge', 'A7X se met en partenariat avec Vans pour nous proposer ces superbes chaussures marqu??es de l''emb??matique Deathbat, logo du groupe. Disponible en exclusivit?? chez Inside Out !', 'Shoes/A7X_Deathbat.jpg', 1, 2);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Knuckles', 34.99, 42, 'Noir/rouge', 'Imposez votre style avec ces chaussures Knuckles de Five Finger Death Punch ! Reprenant le lettrage du groupe, les couleurs rouges et noir ainsi que logo sp??cifique 5FDP, ces baskets prouvent que vous ??tes un fan incontournable du groupe de heavy metal am??ricain.', 'Shoes/5FDP_Knuckles.jpg', 1, 2);

