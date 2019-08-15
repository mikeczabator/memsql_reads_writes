# memsql_reads_writes
Displays the `Rows_affected_by_writes` / `Rows_returned_by_reads` value deltas at set intervals.  

The data is collected on each aggregator, thus you will only see reads / writes on the agg in which this is running.  


use `call memsql_reads_writes(interval in seconds in which to run procedure);` 


```
memsql> call memsql_reads_writes(10);
+-------------------------------------------+
| msg                                       |
+-------------------------------------------+
| waiting 10 seconds for first iteration... |
+-------------------------------------------+
1 row in set (0.00 sec)

+--------+-------+------------------+
| writes | reads | rate             |
+--------+-------+------------------+
| 0      | 1     | per 10 second(s) |
+--------+-------+------------------+
1 row in set (10.01 sec)

+-----------+-------+------------------+
| writes    | reads | rate             |
+-----------+-------+------------------+
| 8,192,000 | 244   | per 10 second(s) |
+-----------+-------+------------------+
1 row in set (20.01 sec)

+--------+-------+------------------+
| writes | reads | rate             |
+--------+-------+------------------+
| 0      | 278   | per 10 second(s) |
+--------+-------+------------------+
1 row in set (30.02 sec)

+--------+-------+------------------+
| writes | reads | rate             |
+--------+-------+------------------+
| 0      | 244   | per 10 second(s) |
+--------+-------+------------------+
1 row in set (40.02 sec)

+-----------+-------+------------------+
| writes    | reads | rate             |
+-----------+-------+------------------+
| 8,192,000 | 278   | per 10 second(s) |
+-----------+-------+------------------+
1 row in set (50.03 sec)
```
