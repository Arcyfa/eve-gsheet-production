SELECT 
	invTypes.typeID, 
	invTypes.typeName AS typeName
FROM invTypes
where invTypes.typeName NOT LIKE '%"%' and invTypes.typeName IS NOT NULL;