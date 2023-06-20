CREATE TABLE article (
    id        SERIAL CONSTRAINT articlekey PRIMARY KEY,
    title       varchar(255) NOT NULL,
    text         text NOT NULL
);

CREATE TABLE comment (
    id        SERIAL CONSTRAINT commentkey PRIMARY KEY,
    article_id integer NOT NULL,
    text         text NOT NULL
);

INSERT INTO article (title, text) VALUES ('Phasellus gravida eu ante et imperdiet', 'Mauris rutrum augue risus, sodales maximus neque vulputate a. Curabitur porttitor, risus eu fermentum hendrerit, urna est dictum est, quis condimentum lectus nisi eget diam.');
INSERT INTO article (title, text) VALUES ('Maecenas egestas fermentum rutrum', 'Vivamus varius nibh et iaculis mollis. Phasellus eu massa a libero eleifend scelerisque. Nulla molestie justo libero, ac aliquet mi iaculis eget.');
INSERT INTO article (title, text) VALUES ('Nam vestibulum dignissim volutpat', 'Praesent neque lectus, porttitor et nunc vitae, congue semper felis. Pellentesque convallis facilisis odio id fringilla. Vivamus quis nibh felis.');
INSERT INTO article (title, text) VALUES ('Phasellus augue ipsum, rutrum a imperdiet', 'Praesent in turpis ac nisl pellentesque volutpat. Maecenas vitae viverra ipsum. Proin accumsan diam vitae nulla tincidunt, a mollis diam luctus.');
INSERT INTO article (title, text) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Integer eget urna porttitor, dictum quam quis, cursus tellus. Pellentesque dictum accumsan mauris a pulvinar.');

INSERT INTO comment (article_id, text) VALUES (1, 'Nunc ac arcu non lectus bibendum mattis. Suspendisse suscipit, enim sit amet ultrices laoreet, dolor dui rhoncus quam');
INSERT INTO comment (article_id, text) VALUES (1, 'Aenean cursus a sapien ac malesuada');
INSERT INTO comment (article_id, text) VALUES (1, 'Fusce sit amet lacus dignissim, tempus massa sed, ultricies dolor');
INSERT INTO comment (article_id, text) VALUES (4, 'Phasellus non urna commodo, finibus lectus ac, gravida lectus');
INSERT INTO comment (article_id, text) VALUES (4, 'Suspendisse pretium porttitor iaculis. Nulla in tortor vel est lobortis fermentum');
INSERT INTO comment (article_id, text) VALUES (4, 'Etiam gravida vehicula massa non condimentum');
INSERT INTO comment (article_id, text) VALUES (4, 'Etiam rutrum purus a ipsum viverra laoreet. Nunc aliquet ex vitae tincidunt luctus');
INSERT INTO comment (article_id, text) VALUES (4, 'Sed facilisis fermentum lacus, non semper est sodales sed.');
INSERT INTO comment (article_id, text) VALUES (5, 'Integer vitae ipsum auctor, interdum leo eu, facilisis dui. Suspendisse ut feugiat dolor, in ultrices leo');

CREATE UNIQUE INDEX uix_id_article on article(id);
CREATE UNIQUE INDEX uix_id_comment on comment(id);
CREATE INDEX ix_article_id_comment on comment(article_id);

-- LEFT OUTER JOIN
SELECT a.id
FROM article a
    LEFT JOIN comment c
        ON a.id = c.article_id
WHERE c.id IS NULL
ORDER BY a.id;

