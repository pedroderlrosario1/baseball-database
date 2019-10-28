CREATE DATABASE Baseball;
USE Baseball;
CREATE TABLE teams
(
    id INT
    AUTO_INCREMENT,
    location VARCHAR
    (255),
    teamMascot VARCHAR
    (255),
    abbreviation VARCHAR
    (3),
    league ENUM
    ('AL', 'NL'),
    division ENUM
    ('East', 'West', 'Central'),
    createAt DATETIME DEFAULT NOW
    (),
    updateAT DATETIME DEFAULT NOW
    () ON
    UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY
    (id)
);

    CREATE TABLE Games
    (
        id INT
        AUTO_INCREMENT,
    startTime DATETIME,
    homeTeamId INT,
    awayTeamId INT,
    homeScore INT,
    awayScore INT,
    createAt DATETIME DEFAULT NOW
        (),
    updateAT DATETIME DEFAULT NOW
        () ON
        UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY
        (id),
    FOREIGN KEY
        (homeTeamId) REFERENCES teams
        (id), 
    FOREIGN KEY
        (awayTeamId) REFERENCES teams
        (id)  
);

        CREATE TABLE PLAYERS
        (
            id INT
            AUTO_INCREMENT,
    firsttname VARCHAR
            (255),
    lastname VARCHAR
            (255),
    position VARCHAR
            (2),
    Hits ENUM
            ('R', 'L', 'B'),
    throws ENUM
            ('R', 'L', 'B'),
    currentTeamId INT,
    createAt DATETIME DEFAULT NOW
            (),
    updateAT DATETIME DEFAULT NOW
            () ON
            UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY
            (id),
    FOREIGN KEY
            (currentTeamId) REFERENCES teams
            (id)
);

            CREATE TABLE hittingStats
            (
                playerId INT,
                gameId INT,
                teamId INT,
                atBats INT,
                runss INT,
                hits INT,
                doubles INT,
                triples INT,
                homeRuns INT,
                runsBattedIn INT,
                walks INT,
                strikeouts INT,
                steals INT,
                createAt DATETIME DEFAULT NOW (),
                updateAT DATETIME DEFAULT NOW ()
                ON
                UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY
                (playerId, gameId, teamId),
    FOREIGN key
                (playerId) REFERENCES players
                (id),
    FOREIGN key
                (gameId) REFERENCES games
                (id),
    FOREIGN key
                (teamId) REFERENCES teams
                (id)
);

                CREATE TABLE pitchingStats
                (
                    playerId INT,
                    gameId INT,
                    teamId INT,
                    wins TINYINT,
                    inningsPitched DECIMAL (3, 1)
                    hits INT,
    runs int,
    earnedRuns INT,            
    walks INT,
    strikeOuts INT,
    createAt DATETIME DEFAULT NOW
                    (),
    updateAT DATETIME DEFAULT NOW
                    () ON
                    UPDATE NOW(),
    deletedAt DATETIME,
    PRIMARY KEY
                    (playerId, gameId, teamId),
    FOREIGN key
                    (playerId) REFERENCES players
                    (id),
    FOREIGN key
                    (gameId) REFERENCES games
                    (id),
    FOREIGN key
                    (teamId) REFERENCES teams
                    (id)  

);