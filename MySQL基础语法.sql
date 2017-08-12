-- 查看所有数据库
SHOW DATABASES;

-- 查看建库语句和字符集
SHOW  CREATE DATABASE 库名;

-- 增加数据库
CREATE DATABASE 库名;
CREATE DATABASE 库名 CHARACTER SET 字符集;
CREATE DATABASE 库名 CHARSET 字符集;

-- 删除数据库
DROP DATABASE 库名;

-- 改库名
ALTER DATABASE 库名 CHARACTER SET 字符集;
ALTER DATABASE 库名 CHARSET 字符集;

-- 切换数据库
USE 库名;

-- 查看当前的数据库名称
SELECT DATABASE();

-- 创建数据表
CREATE TABLE 表名(列名  类型  约束, 列名  类型  约束);
CREATE TABLE 表名(列名  类型  约束, 列名  类型  约束)CHARACTER SET utf8;
CREATE TABLE 表名(列名  类型  约束, 列名  类型  约束)CHARSET utf8;

-- 删除数据表
DROP TABLE 表名;

-- 增加数据表一列
ALTER TABLE 表名 ADD 列名  类型(长度)  约束;

-- 修改数据表列的类型
ALTER TALBE 表名 MODIFY 列名  类型(长度)  约束;

-- 删除数据表一列
ALTER TABLE 表名 DROP 列名;

-- 修改数据表列名
ALTER TABLE 表名 CHANGE 旧列名  新列名  类型(长度)  约束;

-- 修改数据表名
RENAME TABLE  旧表名 TO 新表名;

-- 修改数据表编码集
ALTER TABLE 表名 CHARACTER SET 编码集;
ALTER TABLE 表名 CHARSET 编码集;

-- 查看所有数据表
SHOW TABLES;

-- 查看表结构
DESC 表名;
SHOW COLUMNS FROM 表名;

-- 查看数据表编码集
SHOW CREATE TABLE 表名;

-- 添加数据
INSERT INTO 表名(列名,列名)VALUES(值,值);
INSERT INTO 表名 VALUES(值,值);

-- 删除数据
DELETE FROM 表名  WHERE 条件;
TRUNCATE TABLE 表名;

-- 修改数据
UPDATE 表名 SET 列名=值,列名=值 WHERE 条件;


/*查看mysql服务的所有客户端和服务端使用的字符集*/
SHOW VARIABLES LIKE 'character%';

# 临时设置客户端的字符集
SET NAMES GBK;

# 开启事务
START TRANSACTION;

# 回滚事务
ROLLBACK;

-- 查看该表的所有信息
SELECT * FROM 表名;

-- 查询指定列的信息
SELECT 列名,列名... FROM 表名;

-- 条件查询
SELECT * FROM 表名 WHERE  条件;

-- 查询排重
SELECT DISTINCT 列名 FROM 表名 [WHERE 条件];

-- 别名以及列运算
SELECT 列名 AS 别名, 列名 AS 别名 ...FROM 表名 [WHERE 条件];
SELECT 列名 AS '别名', 列名 AS '别名'...FROM 表名 [WHERE 条件];
SELECT 列名 别名, 列名 别名... FROM 表名 [WHERE 条件];

-- ORDER BY排序
SELECT * FROM 表名 ORDER BY 列名 ASC;
SELECT * FROM 表名 ORDER BY 列名 DESC;








