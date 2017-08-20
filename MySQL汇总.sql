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

/*数据记录的CRUD*/

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

INSERT INTO user(id,name,age,gender,birthday,address) VALUES(NULL,'小明',5,1,'2012-12-12','南京东路108号');

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

/*添加新的字段为分类描述VARCHAR(20)*/
ALTER TABLE category ADD `desc` VARCHAR(20) COMMENT '分类描述';

/*为分类表的描述字段进行修改,类型VARCHAR(50) 添加约束 NOT NULL */
ALTER TABLE category MODIFY `desc` VARCHAR(50) NOT NULL COMMENT '分类描述';

/*为分类表的分类名称字段进行更换,更换为description VARCHAR(30)*/
ALTER TABLE category CHANGE `desc`  description VARCHAR(30) NOT NULL COMMENT '分类描述';

/*删除分类表中description这列*/
ALTER TABLE category DROP description;

/*为分类表category改成category2*/
RENAME TABLE category TO category2;

/*为分类表category2的编码表进行修改,修改成gbk*/
ALTER TABLE category CHARACTER  SET gbk;

/*使用INSERT命令完成表*/
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
1:字段要求: id  INT  主键 , age  INT  , name 字符类型, birthday 日期类型   salary 数值类型 要求小数点保留2位.

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
INSERT INTO users VALUES(NULL,50,'石公虎','1610-10-10',NULL);

/*3:查询所有员工的薪资,年薪,以及姓名*/
SELECT ifNULL(salary,0) AS '薪资',ifNULL(salary,0)*12 AS '年薪', name AS '姓名' FROM users;

/*4:查询所有员工,如果薪资没有的员工,salary列值显示:没有薪资,倒序显示.*/
SELECT ifNULL(salary,'没有薪资') AS '薪资',name AS '姓名' FROM users ORDER BY salary DESC;

/*5:将salary列为NULL的用户薪资,修改为0.00.*/
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






--  Day02
CREATE TABLE exam(
	id INT NOT NULL AUTO_INCREMENT COMMENT '学生ID',
	name VARCHAR(20) NOT NULL COMMENT '学生姓名',
	chinese DOUBLE COMMENT '语文',
	math DOUBLE COMMENT '数学',
	english DOUBLE COMMENT '英文',
	PRIMARY KEY(id)
)CHARACTER SET utf8 COMMENT '考试表';

INSERT INTO exam VALUES(NULL, '关羽', 85, 76, 60);
INSERT INTO exam VALUES(NULL, '张飞', 70, 75, 70);
INSERT INTO exam VALUES(NULL, '赵云', 90, 65, 95);
INSERT INTO exam VALUES(NULL, '刘备', 97, 50, 50);
INSERT INTO exam VALUES(NULL, '曹操', 90, 89, 80);
INSERT INTO exam VALUES(NULL, '司马懿', 90, 67, 65);

-- 查询表中所有学生的信息
SELECT * FROM exam;

-- 查询表中所有学生的姓名和对应的英语成绩
SELECT name, english FROM exam;

-- 查询姓名为赵云的学生成绩
SELECT * FROM exam WHERE name = '赵云';
SELECT name, english FROM exam WHERE name = '赵云';

-- 查询英语成绩大于90分的同学
SELECT * FROM exam WHERE english > 90;

-- 查询英语分数不等于70分的所有同学
SELECT * FROM exam WHERE english <> 70;
SELECT * FROM exam WHERE NOT english = 70;
SELECT * FROM exam WHERE english != 70;
SELECT * FROM exam WHERE NOT english IN(70);

-- 查询英语分数在80-90之间的同学(包含80-90)
SELECT * FROM exam WHERE english >= 80 AND english <= 90;
SELECT * FROM exam WHERE english BETWEEN 80 AND 90;

-- 查询数学分类为89,75,91的同学
SELECT * FROM exam WHERE math = 89 OR math = 75 OR math = 91;
SELECT * FROM exam WHERE math IN (89, 75, 91);

INSERT INTO exam VALUES(NULL, '刘阿斗', 86, NULL, 83);

-- 查询所有姓刘的学生的成绩
SELECT * FROM exam WHERE name LIKE '刘%';

-- 查询所有姓刘两个字的学生成绩
SELECT * FROM exam WHERE name LIKE '刘_';

-- 查询数学成绩不为NULL的学生
SELECT * FROM exam WHERE math IS NOT NULL;

-- 查询数学成绩为NULL的学生
SELECT * FROM exam WHERE math IS NULL;

-- 查询数学分>80并且语文分>80的同学
SELECT * FROM exam WHERE math > 80 AND chinese > 80;

-- 查询数学分>80 或者 语文分>80的同学
SELECT * FROM exam WHERE math > 80 OR  chinese > 80;
SELECT * FROM exam WHERE chinese > 80 OR math > 80;

-- 查询英语分数不大于60的学生
SELECT * FROM exam WHERE  NOT english > 60;
SELECT * FROM exam WHERE  english <= 60;

-- 过滤掉重复的语文成绩
SELECT chinese FROM exam;
SELECT DISTINCT chinese FROM exam;

SELECT name AS 姓名, chinese AS 语文, math AS 数学, english AS 英语 FROM exam;
SELECT name AS '姓名', chinese AS '语文', math AS '数学', english AS '英语' FROM exam;
SELECT name 姓名, chinese 语文, math 数学, english 英语 FROM exam;

-- 查询在所有学生的分数，在显示的时候每门课加10分特长分。（每一门课程都加10分）
SELECT name , chinese+10 AS 语文, math+10 AS 数学, english+10 AS 英语 FROM exam;

-- 查询每个学生的总分。
SELECT name AS 姓名, IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0) AS 总分 FROM exam;

-- 对语文成绩升序排序后输出。
SELECT * FROM exam ORDER BY chinese ASC;

-- 对语文升序排序，如果语文成绩一样，按数学成绩降序排序。
SELECT * FROM exam ORDER BY chinese ASC, math DESC;

-- 对总分排序按从高到低降序输出
SELECT * , chinese+math+english AS 总分 FROM exam ORDER BY 总分 DESC;
SELECT * , chinese+math+english AS 总分 FROM exam ORDER BY chinese+math+english DESC;

-- 显示所有学生的姓名和总成绩；
SELECT name AS 姓名, chinese+math+english AS 总分 FROM exam;

-- 查询显示学生姓名和总成绩。
SELECT name AS 姓名, IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0) AS 总分 FROM exam;

-- 对姓刘的学生成绩总分进行降序排序
SELECT *, IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0) AS 总分 FROM exam 
	WHERE name LIKE '刘%' ORDER BY 总分 DESC;

-- 统计一个班级共有多少学生？
SELECT COUNT(*) AS 人数 FROM exam;

-- 统计语文成绩大于等于90的学生有多少个
SELECT COUNT(*) AS 人数 FROM exam  WHERE chinese >= 90;

-- 统计总分大于250的人数有多少？
SELECT COUNT(*) AS 人数 FROM exam WHERE IFNULL(chinese, 0)+IFNULL(math,0)+IFNULL(english,0) > 250;

-- 统计一个班级数学总成绩？
SELECT SUM(math) FROM exam;

-- 分别显示一个班级语文、英语、数学各科的总成绩
SELECT SUM(chinese) AS 语文, SUM(math) AS 数学, SUM(english) AS 英语 FROM exam;

-- 统计一个班级语文、英语、数学的成绩总和。
SELECT SUM(chinese)+SUM(math)+SUM(english) AS 总分 FROM exam;
SELECT SUM(IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0)) AS 总分 FROM exam;


-- 统计一个班级语文成绩平均分
SELECT SUM(chinese) / COUNT(*) FROM exam;
SELECT ROUND(SUM(chinese)/COUNT(*), 2) FROM exam;

-- 求一个班级数学平均分
SELECT ROUND(AVG(IFNULL(math,0)),2) AS 数学平均分 FROM exam;

-- 求一个班级总分平均分
SELECT AVG(IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0)) AS 总分平均分 FROM exam;

-- 统计英语的最高分和最低分
SELECT MAX(english) AS 英语最高分, MIN(english) AS 英语最低分 FROM exam;

-- 统计总分的最高分和最低分
SELECT MAX(IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0)) AS 总分最高分,
	MIN(IFNULL(chinese,0)+IFNULL(math,0)+IFNULL(english,0)) AS 总分最低分 FROM exam;

CREATE TABLE orders(
	id INT COMMENT '订单ID',
	product VARCHAR(20) COMMENT '产品名',
	price DECIMAL COMMENT '价格'
)CHARACTER SET utf8 COMMENT '订单表';

INSERT INTO orders(id, product, price) VALUES(1, '纸巾', 16);
INSERT INTO orders(id, product, price) VALUES(2, '纸巾', 16);
INSERT INTO orders(id, product, price) VALUES(3, '红牛', 5);
INSERT INTO orders(id, product, price) VALUES(4, '洗衣粉', 60);
INSERT INTO orders(id, product, price) VALUES(5, '苹果', 8);
INSERT INTO orders(id, product, price) VALUES(6, '洗衣粉', 60);

-- 查询购买的每种商品的总价。
SELECT product, SUM(price) FROM orders GROUP BY product;

-- 查询每一种商品的总价大于30的商品，并显示总价。
SELECT product,SUM(price) AS 总价 FROM orders  GROUP BY product HAVING SUM(price) > 30;

CREATE TABLE IF NOT EXISTS dept(
	id INT  auto_increment COMMENT '部门id',
	name VARCHAR(20) COMMENT '部门名称',
	PRIMARY KEY(id)
) CHARACTER SET utf8 COMMENT '部门表';

CREATE TABLE IF NOT EXISTS employee(
	id INT AUTO_INCREMENT COMMENT '员工id',
	name VARCHAR(20) COMMENT '员工姓名',
	age TINYINT COMMENT '员工年龄' ,
	salary DECIMAL COMMENT '员工薪资',
	dept_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (dept_id) REFERENCES dept(id)
) CHARACTER SET utf8 COMMENT '员工表';


/*给部门表添加数据*/
INSERT INTO dept VALUES(NULL,'人事部');
INSERT INTO dept VALUES(NULL,'财务部');
INSERT INTO dept VALUES(NULL,'公关部');
INSERT INTO dept VALUES(NULL,'总经理办公室');


/*给雇员表添加数据*/
INSERT INTO employee VALUES(NULL,'小乔',18,10000);
INSERT INTO employee VALUES(NULL,'大乔',19,10000);
INSERT INTO employee VALUES(NULL,'曹操',20,12000);
INSERT INTO employee VALUES(NULL,'周瑜',21,13000);
INSERT INTO employee VALUES(NULL,'刘备',22,14000);



/*1.	基于products表的数据,进行聚合函数查询.*/
/*2.	商品汇总,总价等查询。*/
-- 1 查询商品的总条数
SELECT COUNT(*) AS 总条数 FROM product;

-- 2 查询价格大于200商品的总条数
SELECT COUNT(*) AS 总条数 FROM product WHERE price > 200;

-- 3 查询分类为'c001'的所有商品的总和
SELECT category_id, SUM(price) AS 总和 FROM product 
	WHERE category_id = 'c001'
	GROUP BY category_id;

-- 4 查询分类为'c002'所有商品的平均价格
SELECT category_id, AVG(IFNULL(price,0)) AS 平均价格 FROM product 
	WHERE category_id = 'c002'
		GROUP BY category_id;

-- 5 查询商品的最大价格和最小价格
SELECT MAX(price) AS 最大价格, MIN(price) AS 最小价格 FROM product;

-- 1 统计各个分类商品的个数
SELECT category_id, COUNT(*) AS 个数  FROM product GROUP BY category_id; 

-- 2 统计各个分类商品的个数,且只显示个数大于1的信息
SELECT category_id, COUNT(*) AS 个数 FROM product GROUP BY category_id HAVING 个数 > 1;

/*
1:设计员工表emp和部门表dept
  要求: emp表的基本字段 empno INT 主键 自动自增长,ename 字符类型 salary 数值类型  bonus 奖金数值型……deptno INT 员工在的部门 (外键)
       dept表的基本字段 deptno INT 主键 自动增长 , dname 部门名称 字符类型  dlocation 地理位置 字符类型
2: 设计表结构 在emp表中设计deptno外键.录入相关数据.
*/

CREATE TABLE tmp_emp (
	empno INT UNSIGNED AUTO_INCREMENT COMMENT '员工id',
	ename VARCHAR(30) NOT NULL DEFAULT '' COMMENT '员工姓名',
	salary DECIMAL NOT NULL DEFUALT 0 COMMENT '员工薪资',
	bonus DECIMAL NOT NULL DEFAULT 0 COMMENT '员工奖金',
	deptno INT NOT NULL COMMNET '部门id',
	PRIMARY KEY (empno),
	FOREIGN KEY (deptno) REFERENCES tmp_dept(deptno)
)CHARACTER SET utf8 COMMENT '员工表';

CREATE TABLE tmp_dept (
	deptno INT AUTO_INCREMENT COMMENT '部门id',
	dname VARCHAR(20) NOT NULL DEFAULT '' COMMENT '部门名称',
	dlocation VARCHAR(20) NOT NULL DEFAULT '' COMMENT '地址位置',
	PRIMARY KEY (deptno)
) CHARACTER SET utf8 COMMENT '部门表';

CREATE TABLE A(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL
);
INSERT INTO A VALUES(1,'苹果');
INSERT INTO A VALUES(2,'橘子');
INSERT INTO A VALUES(3,'香蕉');

CREATE TABLE B( 
   id INT PRIMARY KEY AUTO_INCREMENT,
   price DECIMAL
);
INSERT INTO B VALUES(1,2.30);
INSERT INTO B VALUES(2,3.50);
INSERT INTO B VALUES(4,NULL);

-- 查询两张表中关于水果的信息，要显示水果名称和水果价格
SELECT * FROM a,b WHERE a.id = b.id;
SELECT * FROM a INNER JOIN b ON a.id = b.id; -- 内连接
SELECT * FROM a LEFT OUTER JOIN b ON a.id = b.id; -- 左外连接
SELECT * FROM a RIGHT OUTER JOIN b ON a.id = b.id; -- 右外连接

SELECT * FROM a LEFT OUTER JOIN b ON a.id = b.id
UNION
SELECT * FROM a RIGHT OUTER JOIN b ON a.id = b.id;

SELECT * FROM a LEFT OUTER JOIN b ON a.id = b.id
UNION ALL
SELECT * FROM a RIGHT OUTER JOIN b ON a.id = b.id;

/*
1:完成学员student 和 老师 teacher 表和课程表的设计
2:多对多设计原则,引入中间表.
*/

CREATE TABLE student(
	id INT UNSIGNED  AUTO_INCREMENT COMMENT '学生学号',
	name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '学生姓名',
	city VARCHAR(20) NOT NULL DEFAULT '' COMMENT '学生所在城市',
	age TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '学生年龄',
	PRIMARY KEY (id)
)CHARACTER SET utf8 COMMENT '学生表';


CREATE TABLE teacher(
	id INT UNSIGNED AUTO_INCREMENT COMMENT '老师职工号',
	name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '老师姓名',
	PRIMARY KEY (id)
)CHARACTER SET utf8 COMMENT '老师表';

CREATE TABLE course (
	id INT UNSIGNED AUTO_INCREMENT COMMENT '课程id',
	name VARCHAR(20) NOT NULL DEFAULT '' COMMENT '课程名',
	teacher_id INT UNSIGNED  COMMENT '老师职工号',
	PRIMARY KEY (id),
	FOREIGN KEY (teacher_id) REFERENCES teacher(id)
)CHARACTER SET utf8 COMMENT '课程表';

CREATE TABLE student_course (
	student_id INT UNSIGNED COMMENT '学生学号',
	course_id INT UNSIGNED COMMENT '老师职工号',
	score INT,
	FOREIGN KEY (student_id) REFERENCES student(id),
	FOREIGN KEY (course_id) REFERENCES course(id)
)CHARACTER SET utf8 COMMENT '学生课程表';

INSERT INTO teacher VALUES(NULL,'关羽');
INSERT INTO teacher VALUES(NULL,'张飞');
INSERT INTO teacher VALUES(NULL,'赵云');

INSERT INTO student VALUES(NULL,'小王','北京',20);
INSERT INTO student VALUES(NULL,'小李','上海',18);
INSERT INTO student VALUES(NULL,'小周','北京',22);
INSERT INTO student VALUES(NULL,'小刘','北京',21);
INSERT INTO student VALUES(NULL,'小张','上海',22);
INSERT INTO student VALUES(NULL,'小赵','北京',17);
INSERT INTO student VALUES(NULL,'小蒋','上海',23);
INSERT INTO student VALUES(NULL,'小韩','北京',25);
INSERT INTO student VALUES(NULL,'小魏','上海',25);
INSERT INTO student VALUES(NULL,'小明','北京',20);

INSERT INTO course VALUES(NULL,'语文',1);
INSERT INTO course VALUES(NULL,'数学',1);
INSERT INTO course VALUES(NULL,'生物',2);
INSERT INTO course VALUES(NULL,'化学',2);
INSERT INTO course VALUES(NULL,'物理',2);
INSERT INTO course VALUES(NULL,'英语',3);

INSERT INTO student_course VALUES(1,1,80);
INSERT INTO student_course VALUES(1,2,90);
INSERT INTO student_course VALUES(1,3,85);
INSERT INTO student_course VALUES(1,4,78);
INSERT INTO student_course VALUES(2,2,53);
INSERT INTO student_course VALUES(2,3,77);
INSERT INTO student_course VALUES(2,5,80);
INSERT INTO student_course VALUES(3,1,71);
INSERT INTO student_course VALUES(3,2,70);
INSERT INTO student_course VALUES(3,4,80);
INSERT INTO student_course VALUES(3,5,65);
INSERT INTO student_course VALUES(3,6,75);
INSERT INTO student_course VALUES(4,2,90);
INSERT INTO student_course VALUES(4,3,80);
INSERT INTO student_course VALUES(4,4,70);
INSERT INTO student_course VALUES(4,6,95);
INSERT INTO student_course VALUES(5,1,60);
INSERT INTO student_course VALUES(5,2,70);
INSERT INTO student_course VALUES(5,5,80);
INSERT INTO student_course VALUES(5,6,69);
INSERT INTO student_course VALUES(6,1,76);
INSERT INTO student_course VALUES(6,2,88);
INSERT INTO student_course VALUES(6,3,87);
INSERT INTO student_course VALUES(7,4,80);
INSERT INTO student_course VALUES(8,2,71);
INSERT INTO student_course VALUES(8,3,58);
INSERT INTO student_course VALUES(8,5,68);
INSERT INTO student_course VALUES(9,2,88);
INSERT INTO student_course VALUES(10,1,77);
INSERT INTO student_course VALUES(10,2,76);
INSERT INTO student_course VALUES(10,3,80);
INSERT INTO student_course VALUES(10,4,85);
INSERT INTO student_course VALUES(10,5,83);


-- 需求 : 查询年龄最大的学生信息
-- 1.查询年龄最大
SELECT MAX(age) FROM student;
-- 2.查询年龄最在的学生信息
SELECT * FROM student WHERE age IN (SELECT MAX(age) FROM student);


-- 需求：查询分数不及格的所有的学生信息
-- 1.查询不及格学生的student_id号
SELECT student_id FROM student_course WHERE score < 60;
-- 2.根据不及格的学生student_id查询学生信息
SELECT * FROM student WHERE id IN(SELECT student_id FROM student_course WHERE score < 60);

-- 需求：查询分数不及格的所有的学生信息, 需要显示不及格的分数
-- as 定义 `临时表`
SELECT * FROM student_course WHERE score < 60;

SELECT student.*, temp.score FROM student,
	(SELECT * FROM student_course WHERE score < 60) AS temp
		WHERE student.id = temp.student_id;

-- all 的用法 :
-- 需求 : 查询年龄最大的学生的信息
-- 查询所有年龄的学生
SELECT age FROM student;
SELECT * FROM student WHERE age >= ALL(SELECT age FROM student);

-- any 和 some 的用法 :
-- 查询成绩是90的学生 (student) 的信息
-- 使用 some / any 用法 :
SELECT student_id FROM student_course WHERE score = 90;
SELECT * FROM student 
	WHERE id IN (SELECT student_id FROM student_course WHERE score = 90);

SELECT * FROM student 
	WHERE id = ANY(SELECT student_id FROM student_course WHERE score = 90);

SELECT * FROM student
	Where id = SOME(SELECT student_id FROM student_course WHERE score = 90);

-- 需求 : 查询不及格的学生信息和不及格分数
-- 1. 查询不及格分数
SELECT * FROM student_course WHERE score < 60;
-- 2.查询不及格的学生贪睡和不及格分数
SELECT student.*,temp.score FROM student,
	(SELECT * FROM student_course WHERE score < 60) AS temp
		WHERE student.id = temp.student_id;




-- 子查询练习
-- 需求 : 查询数学成绩比语文成绩高的所有学生信息
-- 查询数学的id
SELECT id FROM course WHERE name = '数学';
-- 根据数学id查询数学成绩
SELECT * FROM student_course WHERE course_id  = (SELECT id FROM course WHERE name = '数学');
-- 查询语文id
SELECT id FROM course WHERE name = '语文';
-- 根据语文id查询语文的成绩
SELECT * FROM student_course WHERE course_id = (SELECT id FROM course WHERE name = '语文');
-- 查询数学成绩比语文成绩高的student_id

SELECT temp1.student_id FROM 
	(SELECT * FROM student_course WHERE course_id  = (SELECT id FROM course WHERE name = '数学')) AS temp1,
		(SELECT * FROM student_course WHERE course_id = (SELECT id FROM course WHERE name = '语文')) AS temp2
			WHERE temp1.student_id = temp2.student_id AND temp1.score > temp2.score;


SELECT * FROM student 
	WHERE id IN (
		SELECT temp1.student_id FROM 
			(SELECT * FROM student_course WHERE course_id  = (SELECT id FROM course WHERE name = '数学')) AS temp1,
				(SELECT * FROM student_course WHERE course_id = (SELECT id FROM course WHERE name = '语文')) AS temp2
					WHERE temp1.student_id = temp2.student_id AND temp1.score > temp2.score
	);
-- mysql 自带函数 (知道即可)



-- sql 强化练习
-- limit 限制查询结果返回的数量  (分页)


-- 1	查询平均成绩大于70分的同学的学号和平均成绩
		-- 平均成绩大于70分
		SELECT student_id, AVG(score) FROM student_course
			GROUP BY student_id
				HAVING AVG(score) > 70;
		

-- 2	查询所有同学的学号、姓名、选课数、总成绩
		-- 选课数
		SELECT student_id, COUNT(*), SUM(score) FROM student_course GROUP BY student_id;

		SELECT student.id, temp.选课数, temp.总成绩  FROM student,
			(SELECT student_id, COUNT(*) AS 选课数, SUM(score) AS 总成绩 FROM student_course GROUP BY student_id) AS temp
				WHERE student.id = temp.student_id;

-- 3	查询学过赵云老师所教课的同学的学号、姓名
		SELECT id FROM teacher WHERE name = '赵云';
		SELECT id FROM course WHERE teacher_id = (SELECT id FROM teacher WHERE name = '赵云');
		SELECT student_id FROM student_course WHERE course_id IN(
			SELECT id FROM course WHERE teacher_id = (SELECT id FROM teacher WHERE name = '赵云')
		);

		SELECT id, name FROM student 
			WHERE id IN (
				SELECT student_id FROM student_course WHERE course_id IN(
					SELECT id FROM course WHERE teacher_id = (SELECT id FROM teacher WHERE name = '赵云')
				)
			);
-- 4	查询没学过关羽老师课的同学的学号、姓名
		SELECT id FROM teacher WHERE name = '关羽';
		SELECT id FROM course WHERE teacher_id  = (SELECT id FROM teacher WHERE name = '关羽');
		SELECT DISTINCT student_id FROM student_course WHERE course_id IN (
			SELECT id FROM course WHERE teacher_id  = (SELECT id FROM teacher WHERE name = '关羽')
		);
		SELECT id, name FROM student
			WHERE  id NOT IN (
				SELECT DISTINCT student_id FROM student_course WHERE course_id IN (
					SELECT id FROM course WHERE teacher_id  = (SELECT id FROM teacher WHERE name = '关羽')
				)
			);
-- 5	查询学三门课以下的同学的学号、姓名
		SELECT student_id FROM 
			student_course GROUP BY student_id 
				HAVING COUNT(*) < 3;
		
		SELECT id, name FROM student 
			WHERE id IN (
				SELECT student_id FROM 
					student_course GROUP BY student_id 
						HAVING COUNT(*) < 3
			);
-- 6	查询各科成绩最高和最低的分
		SELECT course_id, MAX(score) AS 最高分, MIN(score) AS 最低分 FROM student_course GROUP BY course_id;
-- 7	查询学生信息和平均成绩
		SELECT student_id, AVG(score) FROM student_course 
			GROUP BY student_id;

		SELECT student.*, temp.平均分 FROM student,
			(SELECT student_id, AVG(score) AS 平均分 FROM student_course 
			GROUP BY student_id) AS temp
				WHERE student.id = temp.student_id;

-- 8	查询各个城市的学生数量
		SELECT city, COUNT(*) FROM student GROUP BY city;

-- 9	查询不及格的学生信息和课程信息
		SELECT * FROM student_course WHERE score < 60;

		SELECT student.*, course.name, temp.score FROM student, course,
			(SELECT * FROM student_course WHERE score < 60) AS temp
				WHERE student.id = temp.student_id AND temp.course_id = course.id;


-- 10	统计每门课程的学生选修人数（超过四人的进行统计）
		SELECT course_id,COUNT(*) FROM student_course GROUP BY course_id HAVING COUNT(*) > 4;

-- 强化练习第二部分 : 部门员工查询练习
CREATE TABLE dept(
	deptno INT PRIMARY KEY AUTO_INCREMENT COMMENT '部门编号',
	dname VARCHAR(14) COMMENT '部门名称',
	loc VARCHAR(13) COMMENT '部门所在位置'
) CHARACTER SET utf8 COMMENT '部门表';

CREATE TABLE emp(
	empno INT PRIMARY KEY AUTO_INCREMENT COMMENT '员工工号',
	ename VARCHAR(10) COMMENT '员工姓名',
	JOB VARCHAR(9) COMMENT '岗位',
	MGR INT COMMENT '上司',
	HIREDATE DATE COMMENT '入职时间',
	SAL INT COMMENT '薪水',
	COMM INT COMMENT '拥金',
	DEPTNO INT NOT NULL,
	FOREIGN KEY (DEPTNO) REFERENCES dept(deptno)
) CHARACTER SET utf8 COMMENT '员工表';

INSERT INTO dept VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES(30,'SALES','CHICAGO');
INSERT INTO dept VALUES(40,'OPERATIONS','BOSTON');

INSERT INTO emp VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO emp VALUES(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO emp VALUES(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO emp VALUES(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO emp VALUES(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO emp VALUES(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO emp VALUES(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO emp VALUES(7788,'SCOTT','ANALYST',7566,'1987-06-13',3000,NULL,20);
INSERT INTO emp VALUES(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO emp VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO emp VALUES(7876,'ADAMS','CLERK',7788,'1987-06-13',1100,NULL,20);
INSERT INTO emp VALUES(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO emp VALUES(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO emp VALUES(7934,'MILLER','CLERK',7782,'1983-01-23',1300,NULL,10);


-- 1.	列出至少有4个员工的部门的信息
	SELECT DEPTNO, COUNT(*) FROM emp GROUP BY DEPTNO HAVING COUNT(*) >= 4;
	SELECT * FROM dept WHERE deptno IN (SELECT DEPTNO FROM emp GROUP BY DEPTNO HAVING COUNT(*) >= 4);
-- 2.	列出薪金比“SMITH”多的所有员工
	SELECT SAL FROM emp WHERE ename = 'SMITH';
	SELECT * FROM emp WHERE SAL > (SELECT SAL FROM emp WHERE ename = 'SMITH');

-- 3.	列出所有员工的姓名及其直接上级的姓名。
	SELECT temp1.ename,temp2.ename FROM 
	(SELECT * FROM emp) AS temp1,
	(SELECT * FROM emp) AS temp2
	WHERE temp1.MGR = temp2.empno;

-- 33. 删除10号部门薪水最高的员工
	SELECT MAX(SAL) FROM emp WHERE DEPTNO = 10 GROUP BY DEPTNO;
	
	DELETE FROM emp WHERE SAL IN (SELECT * FROM (SELECT MAX(SAL) FROM emp WHERE DEPTNO = 10 GROUP BY DEPTNO) AS temp );

-- 34. 将薪水最高的员工的薪水降30%
	SELECT MAX(SAL) FROM emp;

	UPDATE emp SET SAL = SAL * 0.7 
		WHERE SAL = (SELECT * FROM (SELECT MAX(SAL) FROM emp) AS temp);

-- 35. 查询员工姓名，工资和 工资级别
SELECT ename, SAL ,CASE WHEN SAL > 3000 THEN '三级'
					    WHEN SAL > 2000 THEN '二级'
						ELSE '一级'
						END AS 工资级别
						FROM emp;






