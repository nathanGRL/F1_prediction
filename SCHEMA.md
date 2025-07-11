## Table: circuits
| Column name | Data type | Description                          |
|-------------|-----------|--------------------------------------|
| circuitId   | INT       | Unique identifier                    |
| circuitRef  | TEXT      | Textual reference for the circuit    |
| name        | TEXT      | Name of the circuit                  |
| location    | TEXT      | City location of the circuit         |
| country     | TEXT      | Country where the circuit is located |
| lat         | FLOAT     | Latitude in degrees                  |
| lng         | FLOAT     | Longitude in degrees                 |
| alt         | INT       | Altitude of the circuit in meters    |
| url         | TEXT      | URL link to wikipedia                |

## Table: constructor_results
| Column name          | Data type | Description                             |
|----------------------|-----------|-----------------------------------------|
| constructorResultsId | INT       | Unique identifier for each result entry |
| raceId               | INT       | Identifier for the race                 |
| constructorId        | INT       | Identifier for the constructor (team)   |
| points               | INT       | Points awarded to the constructor       |
| status               | TEXT      | Status of the constructor in the race   |

## Table: constructor_standings
| Column name            | Data type | Description                                        |
|------------------------|-----------|----------------------------------------------------|
| constructorStandingsId | INT       | Unique identifier for each constructor standing    |
| raceId                 | INT       | Identifier for the race                            |
| constructorId          | INT       | Identifier for the constructor (team)              |
| points                 | INT       | Points awarded to the constructor after the race   |
| position               | INT       | Position in the standings after the race           |
| positionText           | TEXT      | Textual representation of the position (e.g., "1") |
| wins                   | INT       | Number of wins by the constructor up to this race  |

## Table: constructors
| Column name    | Data type | Description                       |
|----------------|-----------|-----------------------------------|
| constructorId  | INT       | Unique identifier for constructor |
| constructorRef | TEXT      | Textual reference for constructor |
| name           | TEXT      | Name of the constructor (team)    |
| nationality    | TEXT      | Nationality of the constructor    |
| url            | TEXT      | URL link to Wikipedia page        |

## Table: drivers_standings
| Column name       | Data type | Description                                             |
|-------------------|-----------|---------------------------------------------------------|
| driverStandingsId | INT       | Unique identifier for each driver standing              |
| raceId            | INT       | Identifier for the race                                 |
| driverId          | INT       | Identifier for the driver                               |
| points            | INT       | Points awarded to the driver after the race             |
| position          | INT       | Position in the standings after the race                |
| positionText      | TEXT      | Textual representation of the position (e.g., "1", "R") |
| wins              | INT       | Number of wins by the driver up to this race            |

## Table: drivers
| Column name    | Data type | Description                                                   | 
|----------------|-----------|---------------------------------------------------------------|
| driverId       | INT       | Unique identifier for each driver                             |
| driverRef      | TEXT      | Short reference name for the driver                           |
| number         | TEXT      | Racing number assigned to the driver (may be null or missing) |
| code           | TEXT      | Three-letter code for the driver                              |
| forename       | TEXT      | Driver's first name                                           |
| surname        | TEXT      | Driver's last name                                            |
| dob            | DATE      | Date of birth (format: YYYY-MM-DD)                            |
| nationality    | TEXT      | Nationality of the driver                                     |
| url            | TEXT      | URL to the driver's Wikipedia page or profile                 |

## Table: lap_times
| Column name  | Data type | Description                                  |
|--------------|-----------|----------------------------------------------|
| raceId       | INT       | Unique identifier for each race              |
| driverId     | INT       | Unique identifier for each driver            |            
| lap          | INT       | Lap number                                   |
| position     | INT       | Position of the driver at the end of the lap |
| time         | TEXT      | Lap time in the format "M:SS.sss"            |
| milliseconds | INT       | Lap time in milliseconds                     |

## Table: pit_stops
| Column name    | Data type | Description                                          |
|----------------|-----------|------------------------------------------------------|
| raceId         | INT       | Unique identifier for each race                      |
| driverId       | INT       | Unique identifier for each driver                    |
| stop           | INT       | Pit stop sequence number for the driver in the race  |
| lap            | INT       | Lap number when the stop occurred                    |
| time           | TEXT      | Timestamp of the pit stop (format: HH:MM:SS)         |
| duration       | TEXT      | Duration of the pit stop (seconds with milliseconds) |
| milliseconds   | INT       | Duration of the pit stop in milliseconds             |

## Table: qualifying
| Column name   | Data type | Description                                                  |
|---------------|-----------|--------------------------------------------------------------|
| qualifyId     | INT       | Unique identifier for each qualifying result                 |
| raceId        | INT       | Unique identifier for each race                              |
| driverId      | INT       | Unique identifier for each driver                            |
| constructorId | INT       | Unique identifier for each constructor (team)                |
| number        | INT       | Racing number assigned to the driver                         |
| position      | INT       | Qualifying position achieved by the driver                   |
| q1            | TEXT      | Lap time in Q1 session (format: M:SS.sss or null if not set) |
| q2            | TEXT      | Lap time in Q2 session (format: M:SS.sss or null if not set) |
| q3            | TEXT      | Lap time in Q3 session (format: M:SS.sss or null if not set) |

## Table: races
| Column name | Data type | Description                                                            |
|-------------|-----------|------------------------------------------------------------------------|
| raceId      | INT       | Unique identifier for each race                                        |
| year        | INT       | Year in which the race took place                                      |
| round       | INT       | Round number in the championship season                                |
| circuitId   | INT       | Unique identifier for the circuit                                      |
| name        | TEXT      | Name of the Grand Prix                                                 |
| date        | DATE      | Date of the race (format: YYYY-MM-DD)                                  |
| time        | TEXT      | Start time of the race (format: HH:MM:SS or HH:MM)                     |
| url         | TEXT      | URL to the Wikipedia page for the Grand Prix                           |
| fp1_date    | TEXT      | Date of Free Practice 1 session (nullable; format: YYYY-MM-DD or NULL) |
| fp1_time    | TEXT      | Time of Free Practice 1 session (nullable; format: HH:MM or NULL)      |
| fp2_date    | TEXT      | Date of Free Practice 2 session (nullable; format: YYYY-MM-DD or NULL) |
| fp2_time    | TEXT      | Time of Free Practice 2 session (nullable; format: HH:MM or NULL)      |
| fp3_date    | TEXT      | Date of Free Practice 3 session (nullable; format: YYYY-MM-DD or NULL) |
| fp3_time    | TEXT      | Time of Free Practice 3 session (nullable; format: HH:MM or NULL)      |
| quali_date  | TEXT      | Date of Qualifying session (nullable; format: YYYY-MM-DD or NULL)      |
| quali_time  | TEXT      | Time of Qualifying session (nullable; format: HH:MM or NULL)           |
| sprint_date | TEXT      | Date of Sprint session (nullable; format: YYYY-MM-DD or NULL)          |
| sprint_time | TEXT      | Time of Sprint session (nullable; format: HH:MM or NULL)               |

## Table: results
| Column name     | Data type | Description                                                                |
|-----------------|-----------|----------------------------------------------------------------------------|
| resultId        | INT       | Unique identifier for each race result record                              |
| raceId          | INT       | Unique identifier for each race                                            |
| driverId        | INT       | Unique identifier for each driver                                          |
| constructorId   | INT       | Unique identifier for each constructor (team)                              |
| number          | INT       | Racing number assigned to the driver                                       |
| grid            | INT       | Starting grid position                                                     |
| position        | INT       | Finishing position (nullable, may be null for DNFs)                        |
| positionText    | TEXT      | Textual representation of position (e.g., "R" for retired, "W" for winner) |
| positionOrder   | INT       | Order of finishing position (numeric, always present)                      |
| points          | INT       | Points scored in the race                                                  |
| laps            | INT       | Number of laps completed                                                   |
| time            | TEXT      | Race time or gap to winner (format: "H:MM:SS.sss" or "+X.XXX")             |
| milliseconds    | INT       | Race time in milliseconds (nullable)                                       |
| fastestLap      | INT       | Lap number on which the fastest lap was set (nullable)                     |
| rank            | INT       | Rank of the fastest lap (nullable)                                         |
| fastestLapTime  | TEXT      | Fastest lap time (format: "M:SS.sss", nullable)                            |
| fastestLapSpeed | FLOAT     | Speed of the fastest lap (nullable)                                        |
| statusId        | INT       | Status code for race finish (e.g., finished, retired, etc.)                |

## Table: seasons
| Column name | Data type | Description                                  |
|-------------|-----------|----------------------------------------------|
| year        | INT	      | Year of the Formula 1 season                 |
| url         | TEXT      | URL to the Wikipedia page for that F1 season |

## Table: sprint_results
| Column name    | Data type | Description                                                      |
|----------------|-----------|------------------------------------------------------------------|
| resultId       | INT       | Unique identifier for each sprint result record                  |
| raceId         | INT       | Unique identifier for each race                                  |
| driverId       | INT       | Unique identifier for each driver                                |
| constructorId  | INT       | Unique identifier for each constructor (team)                    |
| number         | INT       | Racing number assigned to the driver                             |
| grid           | INT       | Starting grid position                                           |
| position       | INT       | Finishing position (nullable, may be null for DNFs)              |
| positionText   | TEXT      | Textual representation of position (e.g., "R" for retired, etc.) |
| positionOrder  | INT       | Order of finishing position (numeric, always present)            |
| points         | INT       | Points scored in the sprint race                                 |
| laps           | INT       | Number of laps completed                                         |
| time           | TEXT      | Sprint time or gap to winner (format: "H:MM:SS.sss" or "+X.XXX") |
| milliseconds   | INT       | Sprint time in milliseconds (nullable)                           | 
| fastestLap     | INT       | Lap number on which the fastest lap was set (nullable)           |
| fastestLapTime | TEXT      | Fastest lap time (format: "M:SS.sss", nullable)                  |
| statusId       | INT       | Status code for sprint finish (e.g., finished, retired, etc.)    |

## Table: status
| Column name | Data type | Description                                                                |
|-------------|-----------|----------------------------------------------------------------------------|
| statusId    | INT	      | Unique identifier for each race status                                     |
| status      | TEXT      | Description of the race status (eg, Finished, Retired, Disqualified, etc.) |