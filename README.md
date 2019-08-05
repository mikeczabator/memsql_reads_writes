# memsql_reads_writes
Displays the `Rows_affected_by_writes` / `Rows_returned_by_reads` value deltas at set intervals.  

The data is collected on each aggregator, thus you will only see reads / writes on the agg in which this is running.  

NOTE: the first value returned will always be the entire universe of total writes / reads.  Ignore the first value.

use `call memsql_reads_writes(interval in seconds in which to run procedure);` 


```
memsql> call memsql_reads_writes(1);
+------------+--------+-----------------+
| writes     | reads  | rate            |
+------------+--------+-----------------+
| 5146118482 | 497510 | per 1 second(s) |
+------------+--------+-----------------+
1 row in set (1.02 sec)

+--------+-------+-----------------+
| writes | reads | rate            |
+--------+-------+-----------------+
| 113676 |     1 | per 1 second(s) |
+--------+-------+-----------------+
1 row in set (2.03 sec)

+--------+-------+-----------------+
| writes | reads | rate            |
+--------+-------+-----------------+
| 110426 |     1 | per 1 second(s) |
+--------+-------+-----------------+
1 row in set (3.03 sec)

+--------+-------+-----------------+
| writes | reads | rate            |
+--------+-------+-----------------+
| 103926 |     1 | per 1 second(s) |
+--------+-------+-----------------+
1 row in set (4.03 sec)

+--------+-------+-----------------+
| writes | reads | rate            |
+--------+-------+-----------------+
| 113678 |     1 | per 1 second(s) |
+--------+-------+-----------------+
1 row in set (5.04 sec)
```
