CREATE KEYSPACE my_ks WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE my_ks;

CREATE TABLE users_posts
(
    user_id    int,
    username   text,
    email      text,
    post_id    int,
    topic_id   int,
    content    text,
    created_at timestamp,
    PRIMARY KEY (user_id, created_at)
) WITH CLUSTERING ORDER BY (created_at DESC);

INSERT INTO users_posts (user_id, username, email, post_id, topic_id, content, created_at) VALUES (1, 'user', 'user@user.com', 1, 1, 'text', '2011-02-03 04:05+0000');
INSERT INTO users_posts (user_id, username, email, post_id, topic_id, content, created_at) VALUES (1, 'user', 'user@user.com', 2, 1, 'texttext', '2012-02-03 04:05+0000');
INSERT INTO users_posts (user_id, username, email, post_id, topic_id, content, created_at) VALUES (1, 'user', 'user@user.com', 3, 1, 'texttexttext', '2013-02-03 04:05+0000');
INSERT INTO users_posts (user_id, username, email, post_id, topic_id, content, created_at) VALUES (2, 'user2', 'user2@user.com', 4, 1, 'text2', '2012-02-03 04:05+0000');

-- 1
SELECT post_id, content, created_at FROM users_posts WHERE user_id = 1;

-- 2
SELECT post_id, content, created_at, username FROM users_posts WHERE user_id = 1 LIMIT 1;

-- 3
SELECT post_id, content, created_at FROM users_posts WHERE user_id = 1 AND created_at > '2012-02-02 04:05+0000';

-- 4
CREATE TABLE users_topics
(
    user_id       int,
    username      text,
    email         text,
    post_id       int,
    topic_id      int,
    content       text,
    created_date  date,
    created_time  time,
    PRIMARY KEY (topic_id, created_date, created_time)
) WITH CLUSTERING ORDER BY (created_date DESC, created_time DESC);

INSERT INTO users_topics (user_id, username, email, post_id, topic_id, content, created_date, created_time) VALUES (1, 'user', 'user@user.com', 3, 1, 'texttexttext', '2013-02-03', '04:05:00');
INSERT INTO users_topics (user_id, username, email, post_id, topic_id, content, created_date, created_time) VALUES (2, 'user2', 'user2@user.com', 2, 1, 'text2', '2012-02-03', '04:05:00');
INSERT INTO users_topics (user_id, username, email, post_id, topic_id, content, created_date, created_time) VALUES (2, 'user2', 'user2@user.com', 1, 1, 'text2', '2013-02-03', '05:05:00');

SELECT username FROM users_topics WHERE created_date = '2013-02-03' AND topic_id = 1;
