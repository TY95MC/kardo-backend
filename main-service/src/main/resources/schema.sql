DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE IF NOT EXISTS users (
    user_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email varchar(50) unique NOT NULL,
    password varchar(200) unique NOT NULL
);

DROP TABLE IF EXISTS authorities CASCADE;
CREATE TABLE IF NOT EXISTS authorities (
    user_id BIGINT REFERENCES users(user_id) ON DELETE CASCADE,
    authority varchar(20)
);

DROP TABLE IF EXISTS avatars CASCADE;
CREATE TABLE IF NOT EXISTS avatars (
    avatar_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    title varchar(250) NOT NULL,
    type varchar(50) NOT NULL,
    link varchar(1000) NOT NULL
);


DROP TABLE IF EXISTS profile CASCADE;
CREATE TABLE IF NOT EXISTS profile (
    name varchar(200),
    last_name varchar(200),
    sur_name varchar(200),
    phone varchar(200) unique,
    birthday DATE,
    gender varchar(20),
    country varchar(200),
    region varchar(200),
    city varchar(200),
    citizenship varchar(200),
    user_id BIGINT REFERENCES users(user_id) ON DELETE CASCADE NOT NULL,
    avatar_id BIGINT REFERENCES avatars(avatar_id) ON DELETE CASCADE unique,
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS subscribers CASCADE;
CREATE TABLE IF NOT EXISTS subscribers (
    user_id BIGINT REFERENCES profile(user_id) ON DELETE CASCADE,
    subscriber_id BIGINT REFERENCES profile(user_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS social_network_links CASCADE;
CREATE TABLE IF NOT EXISTS social_network_links (
    user_id BIGINT REFERENCES profile(user_id) ON DELETE CASCADE,
    link varchar(1000)
);

DROP TABLE IF EXISTS publications CASCADE;
CREATE TABLE IF NOT EXISTS publications (
    publication_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_id BIGINT REFERENCES profile(user_id) ON DELETE CASCADE,
    title varchar(250) NOT NULL,
    type varchar(50) NOT NULL,
    link varchar(1000) NOT NULL,
    description varchar(5000)
);

DROP TABLE IF EXISTS events CASCADE;
CREATE TABLE IF NOT EXISTS events (
    event_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    description varchar(1000),
    event_type varchar(200),
    title varchar(200),
    location varchar(200),
    is_grand_final_event boolean
);

DROP TABLE IF EXISTS event_directions CASCADE;
CREATE TABLE IF NOT EXISTS event_directions (
    event_id BIGINT REFERENCES events(event_id) ON DELETE CASCADE,
    direction varchar(100)
);

DROP TABLE IF EXISTS user_requests CASCADE;
CREATE TABLE IF NOT EXISTS user_requests (
    request_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name varchar(200),
    last_name varchar(200),
    sur_name varchar(200),
    phone varchar(200),
    birthday DATE,
    gender varchar(20),
    email varchar(200),
    created TIMESTAMP,
    type_of_selection varchar(200),
    status varchar(200),
    user_id BIGINT REFERENCES profile(user_id) ON DELETE CASCADE NOT NULL,
    event_id BIGINT REFERENCES events(event_id) ON DELETE CASCADE NOT NULL
);

DROP TABLE IF EXISTS request_preview CASCADE;
CREATE TABLE IF NOT EXISTS request_preview (
    request_preview_id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    request_id BIGINT REFERENCES user_requests(request_id) ON DELETE CASCADE unique,
    title varchar(250) NOT NULL,
    type varchar(50) NOT NULL,
    link varchar(1000) NOT NULL
);

DROP TABLE IF EXISTS user_request_directions CASCADE;
CREATE TABLE IF NOT EXISTS user_request_directions (
   request_id BIGINT REFERENCES user_requests(request_id) ON DELETE CASCADE,
   direction varchar(100)
);

DROP TABLE IF EXISTS request_social_network_links CASCADE;
CREATE TABLE IF NOT EXISTS request_social_network_links (
    request_id BIGINT REFERENCES user_requests(request_id) ON DELETE CASCADE,
    link varchar(1000)
);
