# 时间维表创建
CREATE TABLE datetime_table (
  datetime_column DATETIME
);


INSERT INTO datetime_table (datetime_column)
SELECT DATE_ADD('2020-01-01 00:00:00', INTERVAL seq.seq HOUR) AS datetime_value
FROM (
  SELECT ones.n + 10*tens.n + 100*hundreds.n + 1000*thousands.n AS seq
  FROM (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) ones,
       (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) tens,
       (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) hundreds,
       (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) thousands
) seq
WHERE seq.seq <= TIMESTAMPDIFF(HOUR, '2020-01-01 00:00:00', '2020-03-15 23:00:00');