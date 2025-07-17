-- Ignore warnings. This is a psql only file

-- Truncate all tables before importing new data

TRUNCATE TABLE circuits CASCADE;
\copy circuits FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/circuits.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE constructor_results CASCADE;
\copy constructor_results FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/constructor_results.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE constructor_standings CASCADE;
\copy constructor_standings FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/constructor_standings.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE constructors CASCADE;
\copy constructors FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/constructors.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE driver_standings CASCADE;
\copy driver_standings FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/driver_standings.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE drivers CASCADE;
\copy drivers FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/drivers.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE lap_times CASCADE;
\copy lap_times FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/lap_times.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE pit_stops CASCADE;
\copy pit_stops FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/pit_stops.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE qualifying CASCADE;
\copy qualifying FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/qualifying.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE races CASCADE;
\copy races FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/races.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE results CASCADE;
\copy results FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/results.csv' DELIMITER ',' CSV HEADER NULL '\N';

TRUNCATE TABLE seasons CASCADE;
\copy seasons FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/seasons.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE sprint_results CASCADE;
\copy sprint_results FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/sprint_results.csv' DELIMITER ',' CSV HEADER NULL '\N';

TRUNCATE TABLE status CASCADE;
\copy status FROM '/home/raccoonlord/F1_predictions/data/kaggle_archive/status.csv' DELIMITER ',' CSV HEADER;
