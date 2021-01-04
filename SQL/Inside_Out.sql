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
    constraint product_category_id_fk foreign key (category_id) references category(id)
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
    constraint first_name_ck check ( regexp_like(first_name, '^[a-zA-ZÀ-ÿ]+-?[a-zA-ZÀ-ÿ]*$') ),
    constraint last_name_ck check ( regexp_like(last_name, '^[a-zA-ZÀ-ÿ]+((?!$)-?\s?[a-zA-ZÀ-ÿ]*)+$') ),
    constraint email_ck check ( regexp_like(email_address, '^[a-zA-ZÀ-ÿ0-9]+.?-?[a-zA-ZÀ-ÿ0-9]+@[a-zA-ZÀ-ÿ]+.[a-zA-ZÀ-ÿ]+$' ))
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
    constraint order_line_product_id_fk foreign key (product_id) references product(id)
) engine = InnoDB;

insert into inside_out_metal.band(name, history) values ('Avenged Sevenfold', 'Avenged Sevenfold (A7X) est un groupe de heavy metal américain, originaire de Huntington Beach, en Californie. Ayant longtemps été un pilier de la scène underground californienne, le groupe connaît un franc succès avec l''album City of Evil et l''album homonyme Avenged Sevenfold. Fondé par M. Shadows, Zacky Vengeance, The Rev et Matt Wendt à la fin des années 1990, la composition actuelle du groupe est : M. Shadows au chant, Synyster Gates à la guitare solo, Zacky Vengeance à la guitare rythmique, Johnny Christ à la basse et Brooks Wackerman à la batterie. Le groupe émerge dans un son metalcore, puis évolue vers un son plus hard rock et heavy metal. En date, Avenged Sevenfold recense neuf albums studio, un album live, une compilation, un DVD, et dix-neuf singles, et plus de huit millions d''albums vendus à travers le monde.');
insert into inside_out_metal.band(name, history) values ('Five Finger Death Punch', 'Five Finger Death Punch, abrévié FFDP ou 5FDP, est un groupe de heavy metal américain fondé en 2005 à Las Vegas, au Nevada. Le groupe tient son nom d’une prise de Kung Fu du film d’action Kill Bill. Originellement constitué du chanteur Ivan Moody, des guitaristes Zoltan Bathory et Caleb Andrew Bingham ainsi que du bassiste Matt Snell et du batteur Jeremy Spencer, le groupe est désormais composé de : Ivan Moody, Zoltan Bathory, Andy James (guitare principale), Chris Kael (basse) et Charlie Engen. En 2019, 5FDP est nommé « Best International Artist » par le Bandit Rock Awards, et en 2020, le groupe est nominé pour le « Rock Artist of the Year » par iHeartRadio Music Awards.');
insert into inside_out_metal.band(name, history) values ('Ghost', 'La Suède compte quelques groupes de metal vraiment bons. Mais ce qui a vu le jour en 2008 à Linköping est vraiment unique ° un groupe de six musiciens désirant devenir célèbres sans en révéler trop sur leurs vies privées. C’est même devenu sa marque de fabrique. Les six musiciens ont décidé de nommer leur groupe Ghost et ont choisis de ne pas révéler leurs identités . À ce jour, on connaît uniquement le chanteur du groupe, Papa Emeritus, dont le visage est peint comme une tête de mort et qui est vêtu d’une longue robe papale. En tout cas, c’était ainsi jusqu’en 2018, lorsque Papa Emeritus fut remplacé par Cardinal Copia pour le quatrième album de Ghost, « Prequelle ». Évidemment seul le nom a changé. C’est toujours le même chanteur – Tobias Forge – qui se cache derrière le pseudonyme. Les autres musiciens du groupe sont connus comme des « nameless ghouls ». Ils dissimulent leurs identités derrière des capes noires et brunes, qui donnent au groupe une allure particulière.');
insert into inside_out_metal.band(name, history) values ('Powerwolf', 'Powerwolf est un groupe de power metal allemand, originaire de Sarrebruck. Le groupe, formé en 2003 par Charles et Matthew Greywolf, officie d''abord sous le label Metal Blade Records, puis sous le label Napalm Records à partir de 2012 avec l''album Preachers of the Night. Utilisant abondamment chœurs et orgues, les membres s''inspirent également, pour de nombreuses chansons, de chants religieux comportant parfois des parties en latin. Le groupe est aujourd’hui constitué de : Attila Dorn au chant, Falk Maria Schlegel aux claviers, Roel van Helden à la batterie ainsi que les frères Charles et Matthew Greywolf. La musique du groupe est facilement reconnaissable grâce à certains aspects tels que l’orgue joué par Falk Maria Schlegel.');
insert into inside_out_metal.band(name, history) values ('Trivium', 'Trivium est un groupe de heavy metal américain, originaire d''Orlando, Floride. Formé en 2000, le groupe est passé du metalcore avec ses deux premiers albums (Ember to Inferno, Ascendancy), au thrash metal (The Crusade), jusqu''au compromis entre les deux (Shogun) ; cependant, l''appartenance au style metalcore est niée et désapprouvée par le groupe. En 2013, le groupe compte plus de 6 millions d''albums vendus à travers le monde. En 2020, le groupe compte au total neuf albums studio.');

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender, vat_number,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('aurelie', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'bodartaurelie2008@hotmail.com', '0495505955', 'Aurélie', 'Bodart', '1996-05-10', 'f', '123456789',
'rue des Bolettes', '3', 'Belgique', 'Naninne', '5100', 'ROLE_ADMIN', 1, 1, 1, 1);

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender, vat_number,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('DrakeXorn', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'christophe.bernard@henallux.be', '0471124035', 'Christophe', 'Bernard', '2000-01-10', 'm', '987654321',
'Val des Rois', '12', 'Belgique', 'Wépion', '5100', 'ROLE_ADMIN', 1, 1, 1, 1);

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('nyssa', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'nyssa@croquette.cat', '0465879645', 'Nyssa', 'Chat', '2016-03-24', 'f',
'rue des Bolettes', '3', 'Belgique', 'Naninne', '5100', 'ROLE_USER', 1, 1, 1, 1);

insert into inside_out_metal.customer( username, password, email_address, phone_number, first_name, last_name, birthdate, gender,
street, number,  country, city, postal_code, authorities, non_expired, non_locked, credentials_non_expired, enabled)
values('biscotte', '$2a$10$AlcCSR0VJKw8h6jm8VWrkeVTQuSKmvRndNm0Bq.nzK9w9yrHKY.zW', 'biscotte@croquette.cat', '0498369542', 'Biscotte', 'Chat', '2013-06-26', 'f',
'Val des rois', '12', 'Belgique', 'Wépion', '5100', 'ROLE_USER', 1, 1, 1, 1);

insert into inside_out_metal.language (region_code, name) values ('fr', 'français');
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
'Shogun est le quatrième album studio de Trivium. Pour tous les fans de heavy metal, ce t-shirt « Shogun » est parfait pour regrouper vos souvenirs de cet album dans un vêtement de votre garde-robe, et il peut être commandé chez EMP. L''avant de ce haut noir affiche une reproduction fidèle de la couverture de l''album.',
'T-Shirts/Trivium_1.jpg', 5, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Rose Laurel, T-shirt manches courtes', 19.99, 'f', 'M', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant',
'T-Shirts/Trivium_2.jpg', 5, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Kiss Of The Cobra King, T-shirt manches courtes', 21.99, 'm', 'M', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant et dans le dos',
'T-Shirts/Powerwolf_1.jpg', 4, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Your blood, T-shirt manches courtes', 21.99, 'm', 'L', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant et dans le dos',
'T-Shirts/Powerwolf_2.jpg', 4, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Dance Macabre, T-shirt manches courtes', 29.99, 'f', 'M', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant',
'T-Shirts/Ghost_Dance_Macabre.jpg', 3, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Master Puppetier, T-shirt manches courtes', 25.99, 'm', 'M', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant',
'T-Shirts/Ghost_Master_Puppetier.jpg', 3, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Nightmare, T-shirt manches courtes', 21.99, 'm', 'L', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant',
'T-Shirts/A7X_1.jpg', 1, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Currency, T-shirt manches courtes', 19.99, 'm', 'M', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant',
'T-Shirts/A7X_2.jpg', 3, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('IDGAF, T-shirt manches courtes - Edition limitée', 19.99, 'm', 'L', 'Noir',
'Dites à 2020 comment vous vous sentez avec le T-Shirt IDGAF (I Don''t Give A F***) de 5FDP !
Doté d''un logo IDGAF avec un majeur entre le 2020 sur la poitrine, ce t-shirt en coton doux en édition limitée a une version plus grande au dos.

Prenez ce tee-shirt avant qu''il ne disparaisse pour toujours!',
'T-Shirts/5FDP_IDGAF.jpg', 2, 5);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('F8 Infinity, T-shirt manches courtes', 21.99, 'm', 'L', 'Noir',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant et dans le dos',
'T-Shirts/5FDP_F8_Infinity.jpg', 2, 5);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Diamonds in the rough LP - Édition limitée, A7X', 25.99, 'Unique', 'transparent',
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
values ('The Stage, A7X', 16.99, 'Unique', 'Boîtier cristal',
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
values ('F8, 5FDP', 16.99, 'Unique', 'Boîtier cristal',
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
values ('Blessed & Possessed, Powerwolf', 19.99, 'Unique', 'Boîtier cristal',
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
Avec The Metal Mass Live, les frères Greywolf et leur bande ont fait fort !
L’énergie est palpable et cela donne vraiment envie d’assister à leur prochain concert !

Format : CD
Genre : Power Metal
Titres :
    CD1 :
        1. Fire & Forgive
        2. Demons Are A Girl‘s Best Friend
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
'Cette édition Deluxe contient l''album de 2015, « Meliora », ainsi que le nouvel EP, « Popestar ».

Ghost nous propose un nouvel EP. Comme c''était le cas pour le EP précédent, « Popestar » contient des reprises étonnantes de Echo and the Bunnymen, Simiam Mobile Disco, Eurythmics et Imperiet ainsi que le nouveau single de Ghost intitulé ''Square Hammer''. Après l''évidente influence très 90''s du précédent EP, c''est la Wave des années 80 qui se fait une place sur ce nouvel EP. Cette année, Papa Emeritus et ses Nameless Ghouls ont remporté le award « Best Metal Performance ».

Format : CD & EP-CD
Genre : Doom
Titres :
    CD1 :
        1. Spirit
        2. From The Pinnacle To The Pit
        3. Cirice
        4. Spöksonat
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
'Procurez-vous le nouvel album de Trivium « What The Dead Men Say » au format CD.
Trivium est de retour avec un nouvel album.
Le LP s''appelle « What the Dead Men Say » et est le successeur du réussi « The Sin and the Sentence » sorti en 2017.

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
Et « Ember To Inferno », signé par le groupe mené par Matt Heafy, marque sur tous les terrains.
Ils ont enregistré l''album avec l''aide de Jason Suecof au Audio Hammer Studio et l''ont mixé au même endroit ainsi qu''au légendaire
Morrisound Studio de Tampa en Floride. Cet album est nettement influencé par la vague Metalcore et possède un travail guitaristique varié
ainsi qu''une véritable passion pour le Thrash Metal.

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
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant
° Manche imprimée',
'Sweaters/Avenged_Sevenfold_1.jpg', 1, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Avenged Sevenfold, T-shirt manches longues', 29.99, 'f', 'M', 'Blanc',
'° Longueur standard
° Coupe standard
° Col rond
° Imprimé à l''avant et dans le dos
° Manches imprimées
', 'Sweaters/Avenged_Sevenfold_2.jpg', 1, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('4 Life', 59.99, 'f', 'S', 'Noir/rouge',
'° Longueur standard
° Coupe standard
° Imprimé à l''avant et dans le dos
° Manches imprimées
', 'Sweaters/5FDP_4_Life.jpg', 2, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Wash It All Away', 49.99, 'f', 'S', 'Noir/rouge',
'° Hood with drawstring
° Kangaroo pocket
° Ribbed cuffs and hem
° Front and back print
', 'Sweaters/5FDP_1.jpg', 2, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Ring Photo, Sweat-shirt zippé à capuche', 49.99, 'h', 'S', 'Noir/rouge',
'° Col rond
° Coupe standard
° Poignets côtelés
° Imprimé à l''avant et dans le dos',
'Sweaters/Ghost_1.jpg', 3, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Throne, T-shirt manche longues', 32.99, 'h', 'M', 'Noir/rouge',
'° Col rond
° Coupe standard
° Poignets côtelés
° Imprimé à l''avant et dans le dos',
'Sweaters/Ghost_2.jpg', 3, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Armata Strigoi, Sweat-shirt à capuche', 49.99, 'h', 'L', 'Noir',
'° Col rond
° Coupe standard
° Poignets côtelés
° Imprimé à l''avant et dans le dos',
'Sweaters/Powerwolf_1.jpg', 4, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Pull Powerwolf de Noël 2020', 59.99, 'h', 'M', 'Multicolore',
'° Tricot
° Col rond
° Coupe standard
° Poignets côtelés
° Motif intégral', 'Sweaters/Powerwolf_sweater.jpg', 4, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Witch Hunt Hoodie, Sweat-shirt zippé à capuche', 46.99, 'h', 'M', 'Noir',
'° Capuche avec cordon
° Poche kangourou divisée
° Fermeture éclair cachée
° Bords et poignets côtelés
° Imprimé à l''avant et dans le dos',
'Sweaters/Trivium_1.jpg', 5, 3);

insert into inside_out_metal.product (name, price, targeted_gender, size, color, description, image, band_id, category_id)
values ('Snake Arch, Sweat-shirt à capuche', 46.99, 'f', 'S', 'Noir/vert',
'° Capuche avec cordon
° Bords et poignets côtelés
° Poche kangourou
° Intérieur texturé
° Imprimé à l''avant et à l''arrière',
'Sweaters/Trivium_2.jpg', 5, 3);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Mug Logo Five Finger Death Punch', 12.99, 'Unique', 'Noir',
'° Capacité : 0,4 L
° Non adapté au lave-vaisselle et au micro-ondes',
'Accessories/5FDP_Logo_Mug.jpg', 2, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Casquette Five Finger Death Punch', 24.99, 'Unique', 'Noir/rouge',
'° Ajustable de 50 à 59 cm
° Patch avec logo 3D sur le devant et à l''arrière
° Longueur de la visière : 7 cm

Le groupe Américain, Five Finger Death Punch ravit ses fans depuis 2005.
Cette casquette avec logo est parfaite pour afficher votre adoration envers le groupe Américain.
Cette casquette ajustable avec bouton-pression et visière possède le logo rouge du groupe ainsi que le lettrage ''5FDP ».
Le numéro 5 à l''arrière vient compléter l''ensemble !',
'Accessories/5FDP_1.jpg', 2, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Calice Papa Emeritus III', 19.99, 'Unique', 'Multicolore',
'° Chope à bière avec motif Ghost peint à la main
° Tasse amovible en acier inoxydable
° Dimensions : env. 10,5 x 8 cm
° Capacité : env. 0,2 litres
° La tasse en acier inoxydable doit être uniquement lavée à la main',
'Accessories/Ghost_Calice.jpg', 3, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Screaming Skull, Patch, Trivium', 4.99, 'Unique', 'Noir/blanch',
'° 8,5 x 10 cm',
'Accessories/Trivium_patch.jpg', 5, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Metal X-MAS', 8.99, 'Unique', 'Multicolore', 'Calendrier de l''avent Powerwolf !', 'Accessories/Powerwolf_Metal_X_mas_2020.jpg', 4, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('We Drink Your Blood', 29.99, 'Unique', 'Transparent', 'De magnifiques verres à shot estampillés "We Drink Your Blood" par Powerwolf.', 'Accessories/Powerwolf_We_drink_your_Blood.jpg', 4, 1);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Deathbat Logo', 34.99, 42, 'Noir/rouge', 'A7X se met en partenariat avec Vans pour nous proposer ces superbes chaussures marquées de l''embématique Deathbat, logo du groupe. Disponible en exclusivité chez Inside Out !', 'Shoes/A7X_Deathbat.jpg', 1, 2);

insert into inside_out_metal.product (name, price, size, color, description, image, band_id, category_id)
values ('Knuckles', 34.99, 42, 'Noir/rouge', 'Imposez votre style avec ces chaussures Knuckles de Five Finger Death Punch ! Reprenant le lettrage du groupe, les couleurs rouges et noir ainsi que logo spécifique 5FDP, ces baskets prouvent que vous êtes un fan incontournable du groupe de heavy metal américain.', 'Shoes/5FDP_Knuckles.jpg', 1, 2);

