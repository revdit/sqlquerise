1.stock=# create table stock(id serial primary key,name varchar(20),qty int,price int)
stock-# ;
CREATE TABLE
stock=# \d stock;
                                   Table "public.stock"
 Column |         Type          | Collation | Nullable |              Default
--------+-----------------------+-----------+----------+-----------------------------------
 id     | integer               |           | not null | nextval('stock_id_seq'::regclass)
 name   | character varying(20) |           |          |
 qty    | integer               |           |          |
 price  | integer               |           |          |
Indexes:
    "stock_pkey" PRIMARY KEY, btree (id)


2.stock=# alter table stock alter column price type float;
ALTER TABLE
stock=# \d stock;
                                   Table "public.stock"
 Column |         Type          | Collation | Nullable |              Default
--------+-----------------------+-----------+----------+-----------------------------------
 id     | integer               |           | not null | nextval('stock_id_seq'::regclass)
 name   | character varying(20) |           |          |
 qty    | integer               |           |          |
 price  | double precision      |           |          |
Indexes:
    "stock_pkey" PRIMARY KEY, btree (id)


3.stock=# create table supplier(s_id serial primary key,s_name varchar(20))
stock-# ;
CREATE TABLE
stock=# \d supplier;
                                    Table "public.supplier"
 Column |         Type          | Collation | Nullable |                Default
--------+-----------------------+-----------+----------+----------------------------------------
 s_id   | integer               |           | not null | nextval('supplier_s_id_seq'::regclass)
 s_name | character varying(20) |           |          |
Indexes:
    "supplier_pkey" PRIMARY KEY, btree (s_id)


4.stock=# alter table stock ADD fk_int_supplier int;
ALTER TABLE
stock=# \d stock;
                                        Table "public.stock"
     Column      |         Type          | Collation | Nullable |              Default
-----------------+-----------------------+-----------+----------+-----------------------------------
 id              | integer               |           | not null | nextval('stock_id_seq'::regclass)
 name            | character varying(20) |           |          |
 qty             | integer               |           |          |
 price           | double precision      |           |          |
 fk_int_supplier | integer               |           |          |
Indexes:
    "stock_pkey" PRIMARY KEY, btree (id)

5.stock=# alter table stock add constraint fk_supplier foreign key(fk_int_supplier)references supplier(s_id)on delete cascade on update cascade;
ALTER TABLE
stock=# \d supplier
                                    Table "public.supplier"
 Column |         Type          | Collation | Nullable |                Default
--------+-----------------------+-----------+----------+----------------------------------------
 s_id   | integer               |           | not null | nextval('supplier_s_id_seq'::regclass)
 s_name | character varying(20) |           |          |
Indexes:
    "supplier_pkey" PRIMARY KEY, btree (s_id)
Referenced by:
    TABLE "stock" CONSTRAINT "fk_supplier" FOREIGN KEY (fk_int_supplier) REFERENCES supplier(s_id) ON UPDATE CASCADE ON DELETE CASCADE





                                                    ^
6.stock=# create table tbl_dept(dept_id serial primary key,dept_name varchar(40));
CREATE TABLE
stock=# \d tbl_dept
                                       Table "public.tbl_dept"
  Column   |         Type          | Collation | Nullable |                  Default
-----------+-----------------------+-----------+----------+-------------------------------------------
 dept_id   | integer               |           | not null | nextval('tbl_dept_dept_id_seq'::regclass)
 dept_name | character varying(40) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (dept_id)


7.stock=# create table tbl_classes(class_id serial primary key,class_name varchar(20),fk_int_dept_id  integer references tbl_dept(dept_id))
stock-# ;
CREATE TABLE
stock=# \d tbl_classes
                                          Table "public.tbl_classes"
     Column     |         Type          | Collation | Nullable |                    Default
----------------+-----------------------+-----------+----------+-----------------------------------------------
 class_id       | integer               |           | not null | nextval('tbl_classes_class_id_seq'::regclass)
 class_name     | character varying(20) |           |          |
 fk_int_dept_id | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(dept_id)


        ^
8.stock=# create table tbl_entrollment(pk_int_enrollment_id serial primary key,int_count int,fk_int_class_id integer references tbl_classes(class_id));
CREATE TABLE
stock=# \d tbl_entrollment
                                            Table "public.tbl_entrollment"
        Column        |  Type   | Collation | Nullable |                            Default
----------------------+---------+-----------+----------+---------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_entrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_entrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_entrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(class_id)


9.stock=# \d tbl_classes
                                          Table "public.tbl_classes"
     Column     |         Type          | Collation | Nullable |                    Default
----------------+-----------------------+-----------+----------+-----------------------------------------------
 class_id       | integer               |           | not null | nextval('tbl_classes_class_id_seq'::regclass)
 class_name     | character varying(20) |           |          |
 fk_int_dept_id | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (class_id)
    "name_uni" UNIQUE CONSTRAINT, btree (class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(dept_id)
Referenced by:
    TABLE "tbl_entrollment" CONSTRAINT "tbl_entrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(class_id)


10.stock=# alter table tbl_dept add vchr_dept_description varchar(50);
ALTER TABLE
stock=# \d tbl_dept
                                             Table "public.tbl_dept"
        Column         |         Type          | Collation | Nullable |                  Default
-----------------------+-----------------------+-----------+----------+-------------------------------------------
 dept_id               | integer               |           | not null | nextval('tbl_dept_dept_id_seq'::regclass)
 dept_name             | character varying(40) |           |          |
 vchr_dept_description | character varying(50) |           |          |
Indexes:
    "tbl_dept_pkey" PRIMARY KEY, btree (dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tbl_dept(dept_id)


stock=# \d supplier;
                                    Table "public.supplier"
 Column |         Type          | Collation | Nullable |                Default
--------+-----------------------+-----------+----------+----------------------------------------
 s_id   | integer               |           | not null | nextval('supplier_s_id_seq'::regclass)
 s_name | character varying(20) |           |          |
Indexes:
    "supplier_pkey" PRIMARY KEY, btree (s_id)


11.stock=# insert into supplier values('1','Logitech'),('2','Samsung'),('3','Iball'),('4','LG'),('5','Creative');
INSERT 0 5
stock=# select * from supplier;
 s_id |  s_name
------+----------
    1 | Logitech
    2 | Samsung
    3 | Iball
    4 | LG
    5 | Creative
(5 rows)
