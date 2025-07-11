-- Ignore warnings. This is a psql only file

\copy circuits FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\circuits.csv' DELIMITER ',' CSV HEADER;
\copy constructor_results FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\constructor_results.csv' DELIMITER ',' CSV HEADER;
\copy constructor_standings FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\constructor_standings.csv' DELIMITER ',' CSV HEADER;
\copy constructors FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\constructors.csv' DELIMITER ',' CSV HEADER;
\copy driver_standings FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\driver_standings.csv' DELIMITER ',' CSV HEADER;
\copy drivers FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\drivers.csv' DELIMITER ',' CSV HEADER;
\copy lap_times FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\lap_times.csv' DELIMITER ',' CSV HEADER;
\copy pit_stops FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\pit_stops.csv' DELIMITER ',' CSV HEADER;
\copy qualifying FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\qualifying.csv' DELIMITER ',' CSV HEADER;
\copy races FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\races.csv' DELIMITER ',' CSV HEADER;
\copy results FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\results.csv' DELIMITER ',' CSV HEADER NULL '\N';
\copy seasons FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\seasons.csv' DELIMITER ',' CSV HEADER;
\copy sprint_results FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\sprint_results.csv' DELIMITER ',' CSV HEADER;
\copy status FROM '\\wsl.localhost\Ubuntu\home\raccoonlord\F1_predictions\data\kaggle_archive\status.csv' DELIMITER ',' CSV HEADER;
