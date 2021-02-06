SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, GRANTEE
 , GROUP_CONCAT(DISTINCT PRIVILEGE_TYPE ORDER BY PRIVILEGE_TYPE) PRIVILEGE_TYPES
FROM (
 SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, GRANTEE, PRIVILEGE_TYPE
  FROM information_schema.TABLES
  INNER JOIN information_schema.user_privileges USING (TABLE_CATALOG)
  WHERE NOT TABLE_SCHEMA IN ('information_schema', 'performance_schema')
   AND GRANTEE=CONCAT("'", REPLACE(CURRENT_USER(), '@', "'@'"), "'")
 UNION ALL
 SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, GRANTEE, PRIVILEGE_TYPE
  FROM information_schema.TABLES
  INNER JOIN information_schema.schema_privileges USING (TABLE_CATALOG, TABLE_SCHEMA)
  WHERE NOT TABLE_SCHEMA IN ('information_schema', 'performance_schema')
   AND GRANTEE=CONCAT("'", REPLACE(CURRENT_USER(), '@', "'@'"), "'")
 UNION ALL
 SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, GRANTEE, PRIVILEGE_TYPE
  FROM information_schema.TABLES
  INNER JOIN information_schema.table_privileges USING (TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME)
  WHERE NOT TABLE_SCHEMA IN ('information_schema', 'performance_schema')
   AND GRANTEE=CONCAT("'", REPLACE(CURRENT_USER(), '@', "'@'"), "'")
) u
 GROUP BY TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE, GRANTEE
;
