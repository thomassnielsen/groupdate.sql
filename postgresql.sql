BEGIN;

-- version

CREATE OR REPLACE FUNCTION gd_version()
  RETURNS text AS
$$
  SELECT '1.0.0'::text;
$$
  LANGUAGE SQL;

-- second

CREATE OR REPLACE FUNCTION gd_second(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('second', $1)::timestamptz;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_second(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_second($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- minute

CREATE OR REPLACE FUNCTION gd_minute(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('minute', $1)::timestamptz;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_minute(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_minute($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- hour

CREATE OR REPLACE FUNCTION gd_hour(timestamptz)
  RETURNS timestamptz AS
$$
  SELECT DATE_TRUNC('hour', $1)::timestamptz;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_hour(timestamp)
  RETURNS timestamptz AS
$$
  SELECT gd_hour($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- day

DROP FUNCTION IF EXISTS gd_day(timestamptz);
CREATE OR REPLACE FUNCTION gd_day(timestamptz)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('day', $1)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_day(timestamp);
CREATE OR REPLACE FUNCTION gd_day(timestamp)
  RETURNS date AS
$$
  SELECT gd_day($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- day w/ time zone

DROP FUNCTION IF EXISTS gd_day(timestamptz, text);
CREATE OR REPLACE FUNCTION gd_day(timestamptz, text)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('day', $1 AT TIME ZONE $2) AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_day(timestamp, text);
CREATE OR REPLACE FUNCTION gd_day(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_day($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


-- week

DROP FUNCTION IF EXISTS gd_week(timestamptz);
CREATE OR REPLACE FUNCTION gd_week(timestamptz)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('week', ($1 + INTERVAL '1 day')) - INTERVAL '1 day')::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_week(timestamp);
CREATE OR REPLACE FUNCTION gd_week(timestamp)
  RETURNS date AS
$$
  SELECT gd_week($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- week w/ time zone

DROP FUNCTION IF EXISTS gd_week(timestamptz, text);
CREATE OR REPLACE FUNCTION gd_week(timestamptz, text)
  RETURNS date AS
$$
  SELECT ((DATE_TRUNC('week', ($1 + INTERVAL '1 day') AT TIME ZONE $2) - INTERVAL '1 day') AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_week(timestamp, text);
CREATE OR REPLACE FUNCTION gd_week(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_week($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


-- week starting monday

DROP FUNCTION IF EXISTS gd_week_mon(timestamptz);
CREATE OR REPLACE FUNCTION gd_week_mon(timestamptz)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('week', $1)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_week_mon(timestamp);
CREATE OR REPLACE FUNCTION gd_week_mon(timestamp)
  RETURNS date AS
$$
  SELECT gd_week_mon($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- week w/ time zone starting monday

DROP FUNCTION IF EXISTS gd_week_mon(timestamptz, text);
CREATE OR REPLACE FUNCTION gd_week_mon(timestamptz, text)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('week', $1 AT TIME ZONE $2) AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_week_mon(timestamp, text);
CREATE OR REPLACE FUNCTION gd_week_mon(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_week_mon($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


-- month

DROP FUNCTION IF EXISTS gd_month(timestamptz);
CREATE OR REPLACE FUNCTION gd_month(timestamptz)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('month', $1)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_month(timestamp);
CREATE OR REPLACE FUNCTION gd_month(timestamp)
  RETURNS date AS
$$
  SELECT gd_month($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- month w/ time zone

DROP FUNCTION IF EXISTS gd_month(timestamptz, text);
CREATE OR REPLACE FUNCTION gd_month(timestamptz, text)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('month', $1 AT TIME ZONE $2) AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_month(timestamp, text);
CREATE OR REPLACE FUNCTION gd_month(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_month($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


-- year

DROP FUNCTION IF EXISTS gd_year(timestamptz);
CREATE OR REPLACE FUNCTION gd_year(timestamptz)
  RETURNS date AS
$$
  SELECT DATE_TRUNC('year', $1)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_year(timestamp);
CREATE OR REPLACE FUNCTION gd_year(timestamp)
  RETURNS date AS
$$
  SELECT gd_year($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- year w/ time zone

DROP FUNCTION IF EXISTS gd_year(timestamptz, text);
CREATE OR REPLACE FUNCTION gd_year(timestamptz, text)
  RETURNS date AS
$$
  SELECT (DATE_TRUNC('year', $1 AT TIME ZONE $2) AT TIME ZONE $2)::date;
$$
  LANGUAGE SQL STABLE;


DROP FUNCTION IF EXISTS gd_year(timestamp, text);
CREATE OR REPLACE FUNCTION gd_year(timestamp, text)
  RETURNS date AS
$$
  SELECT gd_year($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


-- hour of day

CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamptz)
  RETURNS integer AS
$$
  SELECT EXTRACT(HOUR FROM $1)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamp)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- hour of day w/ time zone

CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(HOUR FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_hour_of_day(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_hour_of_day($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;


-- day of week

CREATE OR REPLACE FUNCTION gd_day_of_week(timestamptz)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOW FROM $1)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamp)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1::timestamptz);
$$
  LANGUAGE SQL STABLE;


-- day of week w/ time zone

CREATE OR REPLACE FUNCTION gd_day_of_week(timestamptz, text)
  RETURNS integer AS
$$
  SELECT EXTRACT(DOW FROM $1 AT TIME ZONE $2)::integer;
$$
  LANGUAGE SQL STABLE;


CREATE OR REPLACE FUNCTION gd_day_of_week(timestamp, text)
  RETURNS integer AS
$$
  SELECT gd_day_of_week($1::timestamptz, $2);
$$
  LANGUAGE SQL STABLE;

COMMIT;
