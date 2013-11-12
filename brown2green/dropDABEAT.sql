psql -t -d team1d -c "SELECT 'DROP TABLE ' || n.nspname || '.' ||
c.relname || ' CASCADE;' FROM pg_catalog.pg_class AS c LEFT JOIN
pg_catalog.pg_namespace AS n ON n.oid = c.relnamespace WHERE relkind =
'r' AND n.nspname NOT IN ('pg_catalog', 'pg_toast') AND
pg_catalog.pg_table_is_visible(c.oid)" >/tmp/droptables

psql -d team1d -f /tmp/droptables
