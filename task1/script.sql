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

