import sys
import psycopg2

# Map table numbers to their checks and names
TABLE_CHECKS = {
    1: {
        "name": "constructor_results",
        "queries": [
            ("missing primary key", "SELECT * FROM constructor_results WHERE constructorResultsId IS NULL;"),
            ("raceId not in races", "SELECT * FROM constructor_results WHERE raceId NOT IN (SELECT raceId FROM races);"),
            ("negative or NULL points", "SELECT * FROM constructor_results WHERE points IS NULL OR points < 0;"),
            ("duplicate constructorResultsId", "SELECT constructorResultsId, COUNT(*) FROM constructor_results GROUP BY constructorResultsId HAVING COUNT(*) > 1;"),
            ("invalid or empty status", "SELECT * FROM constructor_results WHERE status IS NULL OR status = '';"),
        ]
    },
    2: {
        "name": "constructor_standings",
        "queries": [
            ("missing primary key", "SELECT * FROM constructor_standings WHERE constructorStandingsId IS NULL;"),
            ("constructorId not in constructors", "SELECT * FROM constructor_standings WHERE constructorId NOT IN (SELECT constructorId FROM constructors);"),
            ("negative or NULL points", "SELECT * FROM constructor_standings WHERE points IS NULL OR points < 0;"),
            ("duplicate constructorStandingsId", "SELECT constructorStandingsId, COUNT(*) FROM constructor_standings GROUP BY constructorStandingsId HAVING COUNT(*) > 1;"),
            ("invalid or empty positionText", "SELECT * FROM constructor_standings WHERE positionText IS NULL OR positionText = '';"),
        ]
    },
    3: {
        "name": "constructors",
        "queries": [
            ("missing primary key", "SELECT * FROM constructors WHERE constructorId IS NULL;"),
            ("duplicate constructorId", "SELECT constructorId, COUNT(*) FROM constructors GROUP BY constructorId HAVING COUNT(*) > 1;"),
            ("empty or NULL name", "SELECT * FROM constructors WHERE name IS NULL OR name = '';"),
            ("url is NULL, empty, or not http", "SELECT * FROM constructors WHERE url IS NULL OR url = '' OR url NOT LIKE 'http%';"),
            ("empty or NULL nationality", "SELECT * FROM constructors WHERE nationality IS NULL OR nationality = '';"),
        ]
    },
    4: {
        "name": "driver_standings",
        "queries": [
            ("missing primary key", "SELECT * FROM driver_standings WHERE driverStandingsId IS NULL;"),
            ("driverId not in drivers", "SELECT * FROM driver_standings WHERE driverId NOT IN (SELECT driverId FROM drivers);"),
            ("negative or NULL points", "SELECT * FROM driver_standings WHERE points IS NULL OR points < 0;"),
            ("duplicate driverStandingsId", "SELECT driverStandingsId, COUNT(*) FROM driver_standings GROUP BY driverStandingsId HAVING COUNT(*) > 1;"),
            ("invalid or empty positionText", "SELECT * FROM driver_standings WHERE positionText IS NULL OR positionText = '';"),
        ]
    },
    5: {
        "name": "drivers",
        "queries": [
            ("missing primary key", "SELECT * FROM drivers WHERE driverId IS NULL;"),
            ("duplicate driverId", "SELECT driverId, COUNT(*) FROM drivers GROUP BY driverId HAVING COUNT(*) > 1;"),
            ("empty or NULL surname", "SELECT * FROM drivers WHERE surname IS NULL OR surname = '';"),
            ("dob is NULL or in the future", "SELECT * FROM drivers WHERE dob IS NULL OR dob > CURRENT_DATE;"),
            ("empty or NULL nationality", "SELECT * FROM drivers WHERE nationality IS NULL OR nationality = '';"),
        ]
    },
    # Add more tables as needed...
}

def run_checks(table_number, conn):
    if table_number not in TABLE_CHECKS:
        print(f"Table number {table_number} is not defined in the script.")
        return
    table_info = TABLE_CHECKS[table_number]
    print(f"Running checks for table: {table_info['name']}\n")
    with conn.cursor() as cur:
        for desc, query in table_info["queries"]:
            print(f"--- {desc} ---")
            cur.execute(query)
            rows = cur.fetchall()
            if rows:
                for row in rows:
                    print(row)
            else:
                print("No issues found.")
            print()

def main():
    if len(sys.argv) < 2:
        print("Usage: python run_table_check.py <table_number>")
        sys.exit(1)
    table_number = int(sys.argv[1])

    # Update these connection parameters as needed
    conn_params = {
        "dbname": "f1db",
        "user": "postgres",
        "password": "test",
        "host": "localhost"
    }

    try:
        conn = psycopg2.connect(**conn_params)
        run_checks(table_number, conn)
    except Exception as e:
        print("Error:", e)
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    main()
