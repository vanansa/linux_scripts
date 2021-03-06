-- mysql
SELECT CONCAT(
    'GRANT SELECT (`', COLUMN_NAME, '`), SHOW VIEW ON mydatabase.`', TABLE_NAME, '` to ''myuser''@`myhost`;')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'mydatabase' AND TABLE_NAME = 'mytable';

 

 SELECT CONCAT('GRANT SELECT (`', COLUMN_NAME, '`), SHOW VIEW ON world.`', TABLE_NAME, '` to ''user1''@`localhost`;') 
 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'world';

-- above query's output

 GRANT SELECT (`Percentage`), SHOW VIEW ON world.`countrylanguage` to 'user1'@`localhost`; 


SELECT user.GRANTEE , schemas.GRANTEE, tables.GRANTEE from USER_PRIVILEGES AS user INNER JOIN SCHEMA_PRIVILEGES AS schemas.GRANTEE ON 'schemas.GRANTEE'='user.GRANTEE' INNER JOIN TABLE_PRIVILEGES AS tables.GRANTEE ON 'tables.GRANTEE'='schemas.GRANTEE';