add jar ../build/contrib/hive_contrib.jar;

CREATE TEMPORARY FUNCTION explode2 AS 'org.apache.hadoop.hive.contrib.udtf.example.GenericUDTFExplode2';

SELECT col1, col2 FROM src LATERAL VIEW explode2(array(1,2,3)) myTable AS col1, col2 LIMIT 3;

DROP TEMPORARY FUNCTION explode2;