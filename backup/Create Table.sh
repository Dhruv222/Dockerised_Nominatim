#!/bin/bash

cd /home/dhruv/osmaxx-postgis-conversion/results

sqlite3 osmaxx_excerpt_2015-10-14_121844.sqlite 'Create TABLE temp_table(osm_id bigint, table_name varchar);'

table_array=$(sqlite3 osmaxx_excerpt_2015-10-14_121844.sqlite '.tables')

for var in $table_array
do
    if [ $var != 'spatial_ref_sys' ] && [ $var != 'geometry_columns' ] && [ $var != 'temp_table' ]
	then
        sqlite3 osmaxx_excerpt_2015-10-14_121844.sqlite "insert into temp_table(osm_id, table_name) select osm_id, '"$var"' from $var;"
        echo "sqlite3 osmaxx_excerpt_2015-10-14_121844.sqlite 'insert into temp_table(osm_id, table_name) select osm_id, '"$var"' from $var;'"
    fi
done
