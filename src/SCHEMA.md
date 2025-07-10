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