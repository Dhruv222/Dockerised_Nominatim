#!/bin/bash

cd /home/dhruv/osmaxx-postgis-conversion/results

table_array=$(sqlite3 osmaxx_excerpt_2015-10-14_121844.sqlite '.tables')
add=0;

for var in $table_array
do 
	if [ $var != 'spatial_ref_sys' ] && [ $var != 'geometry_columns' ] && [ $var != 'temp_table' ]
	then
		add=$(($add+$(sqlite3 osmaxx_excerpt_2015-10-14_121844.sqlite "select count(*) from $var;")))
	fi
done

echo $add
