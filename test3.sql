1.stock=# select *from stock;
 id |   name    | qty | price  | fk_int_supplier
----+-----------+-----+--------+-----------------
  1 | Mouse     |  10 |  501.5 |               1
  2 | Keyboard  |   5 |  451.5 |               3
  3 | Modem     |  10 | 1201.5 |               2
  5 | Headphone |  50 |  751.5 |               4
  6 | memory    |   2 | 3501.5 |               4
  7 | memory    | 100 | 1501.5 |               5
(6 rows)


stock=# select sum(qty*price)as Totalcost from stock;
 totalcost
-----------
  214015.5
(1 row)


2.stock=# select sum(qty)as total_no_product from stock;
 total_no_product
------------------
              177
(1 row)

3.stock=# select upper(name)as name,round(price)as price  from stock;
   name    | price
-----------+-------
 MOUSE     |   502
 KEYBOARD  |   452
 MODEM     |  1202
 HEADPHONE |   752
 MEMORY    |  3502
(5 rows)


4.

stock=# select count(Distinct name)as item from stock;
 item
------
    5
(1 row)

5.stock=# select MAX(price) from stock;
  max
--------
 3501.5
(1 row)


6.stock=# select*from tbl_entrollment;
 pk_int_enrollment_id | int_count | fk_int_class_id
----------------------+-----------+-----------------
                    8 |        40 |               1
                    9 |        15 |               2
                   10 |        10 |               3
                   11 |        12 |               4
                   12 |        60 |               2
                   13 |        14 |               6
                   14 |       200 |               7
(7 rows)


stock=# select sum(int_count) as total_entrollment from tbl_entrollment;
 total_entrollment
-------------------
               351
(1 row)


7.stock=# select count(class_id)as no_of_classes from tbl_classes;
 no_of_classes
---------------
             7
(1 row)

8.stock=# delete from stock where fk_int_supplier='5';
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



9.stock=# select concat(name,price)as product_price from stock;
 product_price
----------------
 Mouse501.5
 Keyboard451.5
 Modem1201.5
 Headphone751.5
 memory3501.5
 memory1501.5
(6 rows)

10.


11.
stock=# select count(rollno) from tbl_grade where grade='B';
 count
-------
     4
(1 row)





