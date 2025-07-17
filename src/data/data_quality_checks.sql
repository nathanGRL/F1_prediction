-- Data Quality Checks for F1 Database

-- 1. constructor_results
SELECT 'constructor_results: missing primary key' AS test, * FROM constructor_results WHERE constructorResultsId IS NULL;
SELECT 'constructor_results: raceId not in races', * FROM constructor_results WHERE raceId NOT IN (SELECT raceId FROM races);
SELECT 'constructor_results: negative or NULL points', * FROM constructor_results WHERE points IS NULL OR points < 0;
SELECT 'constructor_results: duplicate constructorResultsId', constructorResultsId, COUNT(*) FROM constructor_results GROUP BY constructorResultsId HAVING COUNT(*) > 1;
SELECT 'constructor_results: invalid or empty status', * FROM constructor_results WHERE status IS NULL OR status = '';

-- 2. constructor_standings
SELECT 'constructor_standings: missing primary key', * FROM constructor_standings WHERE constructorStandingsId IS NULL;
SELECT 'constructor_standings: constructorId not in constructors', * FROM constructor_standings WHERE constructorId NOT IN (SELECT constructorId FROM constructors);
SELECT 'constructor_standings: negative or NULL points', * FROM constructor_standings WHERE points IS NULL OR points < 0;
SELECT 'constructor_standings: duplicate constructorStandingsId', constructorStandingsId, COUNT(*) FROM constructor_standings GROUP BY constructorStandingsId HAVING COUNT(*) > 1;
SELECT 'constructor_standings: invalid or empty positionText', * FROM constructor_standings WHERE positionText IS NULL OR positionText = '';

-- 3. constructors
SELECT 'constructors: missing primary key', * FROM constructors WHERE constructorId IS NULL;
SELECT 'constructors: duplicate constructorId', constructorId, COUNT(*) FROM constructors GROUP BY constructorId HAVING COUNT(*) > 1;
SELECT 'constructors: empty or NULL name', * FROM constructors WHERE name IS NULL OR name = '';
SELECT 'constructors: url is NULL, empty, or not http', * FROM constructors WHERE url IS NULL OR url = '' OR url NOT LIKE 'http%';
SELECT 'constructors: empty or NULL nationality', * FROM constructors WHERE nationality IS NULL OR nationality = '';

-- 4. driver_standings
SELECT 'driver_standings: missing primary key', * FROM driver_standings WHERE driverStandingsId IS NULL;
SELECT 'driver_standings: driverId not in drivers', * FROM driver_standings WHERE driverId NOT IN (SELECT driverId FROM drivers);
SELECT 'driver_standings: negative or NULL points', * FROM driver_standings WHERE points IS NULL OR points < 0;
SELECT 'driver_standings: duplicate driverStandingsId', driverStandingsId, COUNT(*) FROM driver_standings GROUP BY driverStandingsId HAVING COUNT(*) > 1;
SELECT 'driver_standings: invalid or empty positionText', * FROM driver_standings WHERE positionText IS NULL OR positionText = '';

-- 5. drivers
SELECT 'drivers: missing primary key', * FROM drivers WHERE driverId IS NULL;
SELECT 'drivers: duplicate driverId', driverId, COUNT(*) FROM drivers GROUP BY driverId HAVING COUNT(*) > 1;
SELECT 'drivers: empty or NULL surname', * FROM drivers WHERE surname IS NULL OR surname = '';
SELECT 'drivers: dob is NULL or in the future', * FROM drivers WHERE dob IS NULL OR dob > CURRENT_DATE;
SELECT 'drivers: empty or NULL nationality', * FROM drivers WHERE nationality IS NULL OR nationality = '';

-- 6. lap_times
SELECT 'lap_times: missing raceId' AS test, * FROM lap_times WHERE raceId IS NULL;
SELECT 'lap_times: missing driverId', * FROM lap_times WHERE driverId IS NULL;
SELECT 'lap_times: negative or NULL milliseconds', * FROM lap_times WHERE milliseconds IS NULL OR milliseconds < 0;
SELECT 'lap_times: negative or zero lap number', * FROM lap_times WHERE lap IS NULL OR lap <= 0;
SELECT 'lap_times: duplicate lap for same driver and race', raceId, driverId, lap, COUNT(*) FROM lap_times GROUP BY raceId, driverId, lap HAVING COUNT(*) > 1;

-- 7. pit_stops
SELECT 'pit_stops: missing raceId', * FROM pit_stops WHERE raceId IS NULL;
SELECT 'pit_stops: missing driverId', * FROM pit_stops WHERE driverId IS NULL;
SELECT 'pit_stops: negative or zero lap', * FROM pit_stops WHERE lap IS NULL OR lap <= 0;
SELECT 'pit_stops: negative or NULL milliseconds', * FROM pit_stops WHERE milliseconds IS NULL OR milliseconds < 0;
SELECT 'pit_stops: duplicate stop for same driver and race', raceId, driverId, stop, COUNT(*) FROM pit_stops GROUP BY raceId, driverId, stop HAVING COUNT(*) > 1;
SELECT 'pit_stops: missing raceId', * FROM pit_stops WHERE raceId IS NULL;
SELECT 'pit_stops: missing driverId', * FROM pit_stops WHERE driverId IS NULL;
SELECT 'pit_stops: negative or zero lap', * FROM pit_stops WHERE lap IS NULL OR lap <= 0;
SELECT 'pit_stops: negative or NULL milliseconds', * FROM pit_stops WHERE milliseconds IS NULL OR milliseconds < 0;
SELECT 'pit_stops: duplicate stop for same driver and race', raceId, driverId, stop, COUNT(*) FROM pit_stops GROUP BY raceId, driverId, stop HAVING COUNT(*) > 1;

-- 8. qualifying
SELECT 'qualifying: missing primary key', * FROM qualifying WHERE qualifyId IS NULL;
SELECT 'qualifying: missing driverId', * FROM qualifying WHERE driverId IS NULL;
SELECT 'qualifying: missing raceId', * FROM qualifying WHERE raceId IS NULL;
SELECT 'qualifying: negative or zero position', * FROM qualifying WHERE position IS NULL OR position <= 0;
SELECT 'qualifying: duplicate qualifyId', qualifyId, COUNT(*) FROM qualifying GROUP BY qualifyId HAVING COUNT(*) > 1;

-- 9. races
SELECT 'races: missing primary key', * FROM races WHERE raceId IS NULL;
SELECT 'races: year out of plausible range', * FROM races WHERE year < 1950 OR year > 2100;
SELECT 'races: round is NULL or <= 0', * FROM races WHERE round IS NULL OR round <= 0;
SELECT 'races: empty or NULL name', * FROM races WHERE name IS NULL OR name = '';
SELECT 'races: duplicate raceId', raceId, COUNT(*) FROM races GROUP BY raceId HAVING COUNT(*) > 1;

-- 10. results
SELECT 'results: missing primary key', * FROM results WHERE resultId IS NULL;
SELECT 'results: missing driverId', * FROM results WHERE driverId IS NULL;
SELECT 'results: missing raceId', * FROM results WHERE raceId IS NULL;
SELECT 'results: negative or NULL points', * FROM results WHERE points IS NULL OR points < 0;
SELECT 'results: duplicate resultId', resultId, COUNT(*) FROM results GROUP BY resultId HAVING COUNT(*) > 1;

-- 11. seasons
SELECT 'seasons: missing primary key' AS test, * FROM seasons WHERE year IS NULL;
SELECT 'seasons: duplicate year', year, COUNT(*) FROM seasons GROUP BY year HAVING COUNT(*) > 1;
SELECT 'seasons: year out of plausible range', * FROM seasons WHERE year < 1950 OR year > 2100;
SELECT 'seasons: empty or NULL url', * FROM seasons WHERE url IS NULL OR url = '';
SELECT 'seasons: url does not start with http', * FROM seasons WHERE url IS NOT NULL AND url NOT LIKE 'http%';

-- 12. sprint_results
SELECT 'sprint_results: missing primary key', * FROM sprint_results WHERE resultId IS NULL;
SELECT 'sprint_results: missing driverId', * FROM sprint_results WHERE driverId IS NULL;
SELECT 'sprint_results: missing raceId', * FROM sprint_results WHERE raceId IS NULL;
SELECT 'sprint_results: negative or NULL points', * FROM sprint_results WHERE points IS NULL OR points < 0;
SELECT 'sprint_results: duplicate resultId', resultId, COUNT(*) FROM sprint_results GROUP BY resultId HAVING COUNT(*) > 1;

-- 13. status
SELECT 'status: missing primary key', * FROM status WHERE statusId IS NULL;
SELECT 'status: duplicate statusId', statusId, COUNT(*) FROM status GROUP BY statusId HAVING COUNT(*) > 1;
SELECT 'status: empty or NULL status', * FROM status WHERE status IS NULL OR status = '';
SELECT 'status: status too short', * FROM status WHERE LENGTH(status) < 3;
SELECT 'status: status too long', * FROM status WHERE LENGTH(status) > 100;

-- 14. circuits
SELECT 'circuits: missing primary key', * FROM circuits WHERE circuitId IS NULL;
SELECT 'circuits: duplicate circuitId', circuitId, COUNT(*) FROM circuits GROUP BY circuitId HAVING COUNT(*) > 1;
SELECT 'circuits: empty or NULL name', * FROM circuits WHERE name IS NULL OR name = '';
SELECT 'circuits: lat or lng is NULL', * FROM circuits WHERE lat IS NULL OR lng IS NULL;
SELECT 'circuits: url does not start with http', * FROM circuits WHERE url IS NOT NULL AND url NOT LIKE 'http%';
