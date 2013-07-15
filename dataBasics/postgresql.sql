/* Day 1: Relations, CRUD, and Joins */

	-- 1. Select all tables we created (and only those) from pg_class.
	SELECT * FROM pg_catalog.pg_tables WHERE tableowner = 'admios';

	-- 2. Whrite a query that finds the country name of the “LARP Club” event.
	SELECT country_name FROM events e
	JOIN venues v ON e.venue_id = v.venue_id 
	JOIN cities c ON v.postal_code=c.postal_code AND v.country_code=c.country_code 
	JOIN countries co ON c.country_code = co.country_code
	WHERE e.title= 'LARP Club';

	-- 3. Alter the venues table to contain a boolean column called “active”, with the default value of TRUE
	ALTER TABLE venues ADD COLUMN active boolean;
	ALTER TABLE venues ALTER COLUMN active SET DEFAULT TRUE;

/* Day 2: Advanced Queries, Code, and Rules */

	-- 1. Create a rule that captures DELETEs on venues, and instead sets the active flag (created in Day 1 homework) to FALSE.
	CREATE RULE delete_venues AS ON DELETE TO venues DO INSTEAD UPDATE venues SET active = FALSE WHERE venue_id = OLD.venue_id;

	-- 2. A temporary table was not the best way to implement our event calendar
    --    pivot table. The generate_series(a, b) function returns a set of records,
	--    from a to b. Replace the month_count table select with this.
	SELECT * FROM crosstab(
	'SELECT extract(year from starts) as year,extract(month from starts) as month, count(*) FROM events GROUP BY year, month',
	'SELECT * FROM generate_series(1,12)') AS (year int,jan int, feb int, mar int, apr int, may int, jun int,
	jul int, aug int, sep int, oct int, nov int, dec int) ORDER BY YEAR;



	-- 3. Build a pivot table that displays every day in a single month, where each
	--    week of the month is a row, and each day name forms a column across
	--    the top (seven days, starting with Sunday and ending with Saturday) like a
	--    standard month calendar. Each day should contain a count of the number
	--    of events that date, or remain blank if no event occurs.
	SELECT * FROM crosstab(
	'SELECT extract(week from generate_series::date) as week, NULL as dow, NULL as count FROM generate_series(''2012-01-01'', ''2012-01-31'', interval ''1 week'')
	UNION
	SELECT extract(day from starts) as day, 
    div(extract (day from starts)::int, 7) as dayPosition, count(*) FROM events GROUP BY day, dayPosition;',
	'SELECT * FROM generate_series(0, 6)') AS (day int, sunday int, monday int, tuesday int, wednesday int, thursday int, friday int, saturday int) ORDER BY DAY;


/* Day 3: Fulltext and Multidimensions */
