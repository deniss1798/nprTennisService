-- Создаем таблицу с видом теннисного состязания. походу будет только одна запись
CREATE TABLE GAMES (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(300) NOT NULL,
    DESCRIPTION VARCHAR(4000),
    BEGIN_DATE DATE,
    END_DATE DATE,
    MATCH_ID INT NOT NULL
);

-- Создаем таблицу с матчами
CREATE TABLE MATCH (
    ID SERIAL PRIMARY KEY,
    WINNER_ID INT,
    LOSSER_ID INT,
    MATCH_DATE DATE DEFAULT CURRENT_TIMESTAMP
);

-- Создаем таблицу с игроками
CREATE TABLE PLAYERS (
    ID SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    SECOND_NAME VARCHAR(50),
    NICKNAME VARCHAR(60) UNIQUE,
    SCORE INT DEFAULT 50
);

ALTER TABLE GAMES
ADD CONSTRAINT FK_GAMES_DEP FOREIGN KEY (MATCH_ID) REFERENCES MATCH (ID) ON DELETE SET NULL;

ALTER TABLE MATCH
ADD CONSTRAINT FK_WINNER_DEP FOREIGN KEY (WINNER_ID) REFERENCES PLAYERS (ID) ON DELETE SET NULL;

ALTER TABLE MATCH
ADD CONSTRAINT FK_LOSSER_DEP FOREIGN KEY (LOSSER_ID) REFERENCES PLAYERS (ID) ON DELETE SET NULL;