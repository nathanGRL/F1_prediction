-- Table: constructor_results
CREATE TABLE constructor_results (
    constructorResultsId INT PRIMARY KEY,
    raceId INT,
    constructorId INT,
    points FLOAT,
    status TEXT
);

-- Table: constructor_standings
CREATE TABLE constructor_standings (
    constructorStandingsId INT PRIMARY KEY,
    raceId INT,
    constructorId INT,
    points FLOAT,
    position INT,
    positionText TEXT,
    wins INT
);

-- Table: constructors
CREATE TABLE constructors (
    constructorId INT PRIMARY KEY,
    constructorRef TEXT,
    name TEXT,
    nationality TEXT,
    url TEXT
);

-- Table: driver_standings
CREATE TABLE driver_standings (
    driverStandingsId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    points FLOAT,
    position INT,
    positionText TEXT,
    wins INT
);

-- Table: drivers
CREATE TABLE drivers (
    driverId INT PRIMARY KEY,
    driverRef TEXT,
    number TEXT,
    code TEXT,
    forename TEXT,
    surname TEXT,
    dob DATE,
    nationality TEXT,
    url TEXT
);

-- Table: lap_times
CREATE TABLE lap_times (
    raceId INT,
    driverId INT,
    lap INT,
    position INT,
    time TEXT,
    milliseconds INT
);

-- Table: pit_stops
CREATE TABLE pit_stops (
    raceId INT,
    driverId INT,
    stop INT,
    lap INT,
    time TEXT,
    duration TEXT,
    milliseconds INT
);

-- Table: qualifying
CREATE TABLE qualifying (
    qualifyId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    position INT,
    q1 TEXT,
    q2 TEXT,
    q3 TEXT
);

-- Table: races
CREATE TABLE races (
    raceId INT PRIMARY KEY,
    year INT,
    round INT,
    circuitId INT,
    name TEXT,
    date DATE,
    time TEXT,
    url TEXT,
    fp1_date TEXT,
    fp1_time TEXT,
    fp2_date TEXT,
    fp2_time TEXT,
    fp3_date TEXT,
    fp3_time TEXT,
    quali_date TEXT,
    quali_time TEXT,
    sprint_date TEXT,
    sprint_time TEXT
);

-- Table: results
CREATE TABLE results (
    resultId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    grid INT,
    position INT,
    positionText TEXT,
    positionOrder INT,
    points FLOAT,
    laps INT,
    time TEXT,
    milliseconds INT,
    fastestLap INT,
    rank INT,
    fastestLapTime TEXT,
    fastestLapSpeed FLOAT,
    statusId INT
);

-- Table: seasons
CREATE TABLE seasons (
    year INT PRIMARY KEY,
    url TEXT
);

-- Table: sprint_results
CREATE TABLE sprint_results (
    resultId INT PRIMARY KEY,
    raceId INT,
    driverId INT,
    constructorId INT,
    number INT,
    grid INT,
    position INT,
    positionText TEXT,
    positionOrder INT,
    points FLOAT,
    laps INT,
    time TEXT,
    milliseconds INT,
    fastestLap INT,
    fastestLapTime TEXT,
    statusId INT
);

-- Table: status
CREATE TABLE status (
    statusId INT PRIMARY KEY,
    status TEXT
);

-- Table: circuits
CREATE TABLE circuits (
    circuitId INT PRIMARY KEY,
    circuitRef TEXT,
    name TEXT,
    location TEXT,
    country TEXT,
    lat FLOAT,
    lng FLOAT,
    alt INT,
    url TEXT
);
