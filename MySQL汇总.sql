/*登录数据库*/
mysql[-h 连接的主机ip -P 端口号] -u root -p

/* 查询当前所有的数据库*/
SHOW DATABASES;

/*显示创建的数据库*/
SHOW CREATE DATABASE mysql;

/*创建数据库*/
CREATE DATABASE  数据库名;

/*指定创建数据库的编码集*/
CREATE DATABASE 数据库名 CHARACTER SET utf8;
CREATE DATABASE 数据库名 CHARSET=utf8;

/*删除数据库*/
DROP DATABASE mydb1;

/*修改数据库的字符集*/
ALTER DATABASE 数据库名称 CHARACTER SET 字符集;

/*显示当前数据库*/
SELECT DATABASE();

/*使用数据库*/
USE  数据库;

/*数据表操作*/
/*创建表*/
CREATE TABLE 表名(
	列名  数据类型,
	列名  数据类型,
	列名  数据类型
);

CREATE TABLE IF NOT EXISTS emp(
	id INT COMMENT '员工ID',
	name VARCHAR(20) COMMENT '员工姓名',
	age INT COMMENT '员工年龄',
	gender INT COMMENT '员工性别',
	birthday DATE COMMENT '员工生日'
)CHARACTER SET utf8 COMMENT '员工表';

SHOW TABLES;

/*显示表的结构*/
SHOW COLUMNS FROM emp;
DESC emp;

SHOW CREATE TABLE emp;


CREATE TABLE emp2(
	id INT PRIMARY KEY AUTO_INCREMENT COMMENT '员工ID',
	name VARCHAR(20) UNIQUE COMMENT '员工姓名',
	age INT NOT NULL COMMENT '员工年龄',
	gender INT COMMENT '员工性别',
	birthday DATE COMMENT '员工生日',
	address VARCHAR(30) UNIQUE NOT NULL COMMENT '员工住址'
)CHARACTER SET utf8 COMMENT '员工表';

/*增加列*/
ALTER TABLE emp2 ADD salary DOUBLE;

/*修改列*/
ALTER TABLE emp2  MODIFY name VARCHAR(30) UNIQUE;

/*修改列名*/
ALTER TABLE emp2 CHANGE name username VARCHAR(30) UNIQUE;

/*删除列*/
ALTER TABLE emp2 DROP age;

/*修改表名*/
RENAME TABLE emp2 TO employee;

/*修改表的字符集*/
ALTER TABLE employee CHARACTER SET utf8;

/*删除表*/
DROP TABLE emp;

/**数据记录的CRUD**/
/**/
INSERT INTO 表名(列名,列名) VALUES(值,值);
INSERT INTO 表名 VALUES(值,值),(值,值);
CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT  COMMENT '用户ID',
	name VARCHAR(30) NOT NULL COMMENT '用户名',
	age INT NOT NULL COMMENT '用户年龄',
	gender INT COMMENT '用户性别',
	birthday DATE COMMENT '用户生日',
	address VARCHAR(30) NOT NULL UNIQUE COMMENT '用户住址'
)CHARACTER SET utf8 COMMENT '用户表';

INSERT INTO user(id,name,age,gender,birthday,address) VALUES(null,'小明',5,1,'2012-12-12','南京东路108号');

SHOW VARIABLES LIKE 'characte	r%';
/*设置CMD Client 的字符集*/
SET CHARACTER SET gbk;

/*修改表记录*/
UPDATE 表名 SET 列名=值,列名=值[WHERE 条件语句]
UPDATE user SET age = 20;
UPDATE user SET age = 18 WHERE name='张三';

/*删除表中数据*/
DELETE FROM 表名[WHERE 条件语句]

TRUNCATE TABLE 表名;

/*开启事务*/
START TRANSACTION;

CREATE TABLE IF NOT EXISTS `category`(
	cid INT PRIMARY KEY AUTO_INCREMENT COMMENT '分类ID',
	cname VARCHAR(100) COMMENT '分类名称'
)CHARACTER SET utf8 COMMENT '分类表';

/*添加新的字段为分类描述varchar(20)*/
ALTER TABLE category ADD `desc` VARCHAR(20) COMMENT '分类描述';

/*为分类表的描述字段进行修改,类型varchar(50) 添加约束 not null */
ALTER TABLE category MODIFY `desc` VARCHAR(50) NOT NULL COMMENT '分类描述';

/*为分类表的分类名称字段进行更换,更换为description varchar(30)*/
ALTER TABLE category CHANGE `desc`  description VARCHAR(30) NOT NULL COMMENT '分类描述';

/*删除分类表中description这列*/
ALTER TABLE category DROP description;

/*为分类表category改成category2*/
RENAME TABLE category TO category2;

/*为分类表category2的编码表进行修改,修改成gbk*/
ALTER TABLE category CHARACTER  SET gbk;

/*使用insert命令完成表*/
INSERT INTO category VALUES(NULL,'手机'),(NULL,'电脑');

/*使用delete命令删除category一条记录*/
DELETE FROM category WHERE cname='手机';

/*使用update命令修改category表中某些记录的字段值*/
UPDATE category SET cname='PC' WHERE cid=2;

/*创建商品表*/
CREATE TABLE IF NOT EXISTS product(
	pid INT PRIMARY KEY AUTO_INCREMENT COMMENT '商品ID',
	pname VARCHAR(20) COMMENT '商品名称',
	price DOUBLE COMMENT '商品价格',
	category_id VARCHAR(32) COMMENT '分类ID'
) CHARACTER SET utf8 COMMENT '商品表';

INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'联想',5000,'c001');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'海尔',3000,'c001');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'雷神',5000,'c001');

INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'JACK JONES',800,'C002');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'真维斯',200,'c002');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'花花公子',440,'c002');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'劲霸',2000,'c002');

INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'香奈儿',800,'c003');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'相宜本草',200,'c003');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'面霸',5,'c003');

INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'好想你枣',56,'c004');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'香飘飘奶茶',1,'c005');
INSERT INTO product(pid,pname,price,category_id) VALUES(NULL,'果9',1,NULL);

/*根据上述数据完成下面的查询练习*/
/*1.查询商品名称为“花花公子”的商品所有信息：*/
SELECT * FROM product WHERE pname = "花花公子";
/*2.查询价格为800商品*/
SELECT * FROM product WHERE price = 800;
/*3.查询价格不是800的所有商品*/
SELECT * FROM product WHERE price <>800;
SELECT * FROM product WHERE price != 800;
SELECT * FROM product WHERE NOT(price = 800);
SELECT * FROM product WHERE NOT price = 800;
SELECT * FROM product WHERE NOT price IN(800);
/*4.查询商品价格大于60元的所有商品信息*/
SELECT * FROM product WHERE price > 60;
/*5.查询商品价格在200到1000之间所有商品*/
SELECT * FROM product WHERE price BETWEEN 200 AND 1000;
SELECT * FROM product WHERE price >= 200 AND price <= 1000;
/*6.查询商品价格是200或800的所有商品*/
SELECT * FROM product WHERE price = 200 OR price = 800;
SELECT * FROM product WHERE price IN (200,800);
/*7.查询含有'霸'字的所有商品*/
SELECT * FROM product WHERE pname LIKE '%霸%';
/*8.查询以'香'开头的所有商品*/
SELECT * FROM product WHERE pname LIKE '香%';
/*9.查询第二个字为'想'的所有商品*/
SELECT * FROM product WHERE pname LIKE '_想%';
/*10.商品没有分类的商品*/
SELECT * FROM product WHERE category_id IS NULL;
/*11.查询有分类的商品*/
SELECT * FROM product WHERE category_id IS NOT  NULL;


/*查看MySQL内部设置的编码*/
SHOW VARIABLES LIKE 'character%';

/*
在cmd窗口,使用mysql命令,创建编码utf8的数据库webdb2,创建表users,完成相关查询
要求: users表的字段  id  name  age   birthday   salary
1:字段要求: id  int  主键 , age  int  , name 字符类型, birthday 日期类型   salary 数值类型 要求小数点保留2位.

*/

CREATE TABLE IF NOT EXISTS users(
	id INT PRIMARY KEY AUTO_INCREMENT COMMENT '员工编号',
	age INT COMMENT '员工年龄',
	name VARCHAR(30) COMMENT '员工名字',
	birthday DATE COMMENT '员工生日',
	salary DOUBLE(7,2) COMMENT '员工薪资' 
)CHARACTER SET utf8 COMMENT '员工表';

/*2:录入初始化数据,薪资可以录入,也可以不录入数据. */
INSERT INTO users VALUES(NULL,18,'李逍遥','1666-06-06',9999.999);
INSERT INTO users VALUES(NULL,17,'赵灵儿','1665-05-05',99999.9999);
INSERT INTO users VALUES(NULL,18,'林月如','1666-08-08',55555.555);
INSERT INTO users VALUES(NULL,50,'石公虎','1610-10-10',NUll);

/*3:查询所有员工的薪资,年薪,以及姓名*/
SELECT ifnull(salary,0) AS '薪资',ifnull(salary,0)*12 AS '年薪', name AS '姓名' FROM users;

/*4:查询所有员工,如果薪资没有的员工,salary列值显示:没有薪资,倒序显示.*/
SELECT ifnull(salary,'没有薪资') AS '薪资',name AS '姓名' FROM users ORDER BY salary DESC;

/*5:将salary列为null的用户薪资,修改为0.00.*/
UPDATE users SET salary = 0 WHERE salary IS NULL;

/*基于用户表users完成相关查询.*/
INSERT INTO users VALUES(NULL,18,'张小虎','1666-07-07',500);
INSERT INTO users VALUES(NULL,40,'张员外','1624-06-06',1000);
INSERT INTO users VALUES(NULL,18,'小明','1998-08-08',4000);
INSERT INTO users VALUES(NULL,17,'小丽','1997-07-07',6666);

/*1:查询员工张姓且薪资大于900的员工.*/
SELECT * FROM users WHERE salary > 900 AND name LIKE '张%';
/*2:查询生日在1990-1-1之前的员工信息.*/
SELECT * FROM users WHERE birthday < '1990-1-1';
/*3:查询员工薪资小于1200 或者 大于5000的信息*/
SELECT * FROM users WHERE salary < 1200 OR salary > 5000;
/*4:查询姓名以明结尾的员工信息.*/
SELECT * FROM users WHERE name LIKE '%明';
