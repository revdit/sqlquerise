1.stock=# insert into stock(name,qty,price,fk_int_supplier)values('Keyboard',5,450,3),('Modem',10,1200,2),('memory',100,1500,5),('Headphone',50,750,4),('memory',2,3500,4);
INSERT 0 5
stock=# select * from stock;
 id |   name    | qty | price | fk_int_supplier
----+-----------+-----+-------+-----------------
  1 | Mouse     |  10 |   500 |               1
  2 | Keyboard  |   5 |   450 |               3
  3 | Modem     |  10 |  1200 |               2
  4 | memory    | 100 |  1500 |               5
  5 | Headphone |  50 |   750 |               4
  6 | memory    |   2 |  3500 |               4
(6 rows)

2.stock=# update stock set price=(price+1.50);
UPDATE 6
stock=# select * from stock;
 id |   name    | qty | price  | fk_int_supplier
----+-----------+-----+--------+-----------------
  1 | Mouse     |  10 |  501.5 |               1
  2 | Keyboard  |   5 |  451.5 |               3
  3 | Modem     |  10 | 1201.5 |               2
  4 | memory    | 100 | 1501.5 |               5
  5 | Headphone |  50 |  751.5 |               4
  6 | memory    |   2 | 3501.5 |               4
(6 rows)

3.stock=# select * from stock where price>1000;
 id |  name  | qty | price  | fk_int_supplier
----+--------+-----+--------+-----------------
  3 | Modem  |  10 | 1201.5 |               2
  4 | memory | 100 | 1501.5 |               5
  6 | memory |   2 | 3501.5 |               4
(3 rows)


4.stock=# select * from stock order by name asc;
 id |   name    | qty | price  | fk_int_supplier
----+-----------+-----+--------+-----------------
  5 | Headphone |  50 |  751.5 |               4
  2 | Keyboard  |   5 |  451.5 |               3
  4 | memory    | 100 | 1501.5 |               5
  6 | memory    |   2 | 3501.5 |               4
  3 | Modem     |  10 | 1201.5 |               2
  1 | Mouse     |  10 |  501.5 |               1
(6 rows)


5.stock=# select * from stock order by name asc limit 3;
 id |   name    | qty | price  | fk_int_supplier
----+-----------+-----+--------+-----------------
  5 | Headphone |  50 |  751.5 |               4
  2 | Keyboard  |   5 |  451.5 |               3
  4 | memory    | 100 | 1501.5 |               5
(3 rows)


6.stock=# select * from stock order by name desc limit 3;
 id |  name  | qty | price  | fk_int_supplier
----+--------+-----+--------+-----------------
  1 | Mouse  |  10 |  501.5 |               1
  3 | Modem  |  10 | 1201.5 |               2
  4 | memory | 100 | 1501.5 |               5
(3 rows)


7.stock=# select * (qty*price)  as qtyprice from stock;
ERROR:  syntax error at or near "("
LINE 1: select * (qty*price)  as qtyprice from stock;
                 ^
stock=# select name,qty,price,(qty*price)  as qtyprice from stock;
   name    | qty | price  | qtyprice
-----------+-----+--------+----------
 Mouse     |  10 |  501.5 |     5015
 Keyboard  |   5 |  451.5 |   2257.5
 Modem     |  10 | 1201.5 |    12015
 memory    | 100 | 1501.5 |   150150
 Headphone |  50 |  751.5 |    37575
 memory    |   2 | 3501.5 |     7003
(6 rows)

8.stock=# delete from stock where fk_int_supplier=5;
DELETE 1
stock=# select * from stock;
 id |   name    | qty | price  | fk_int_supplier
----+-----------+-----+--------+-----------------
  1 | Mouse     |  10 |  501.5 |               1
  2 | Keyboard  |   5 |  451.5 |               3
  3 | Modem     |  10 | 1201.5 |               2
  5 | Headphone |  50 |  751.5 |               4
  6 | memory    |   2 | 3501.5 |               4
(5 rows)


9.stock=# insert into tbl_dept(dept_name,vchr_dept_description)values('Computerscience','CS'),('Electronics','EC'),('Commerce','CC'),('Arts','AR');
INSERT 0 4
stock=# select * from tbl_dept;
 dept_id |    dept_name    | vchr_dept_description
---------+-----------------+-----------------------
       1 | Computerscience | CS
       2 | Electronics     | EC
       3 | Commerce        | CC
       4 | Arts            | AR
(4 rows)